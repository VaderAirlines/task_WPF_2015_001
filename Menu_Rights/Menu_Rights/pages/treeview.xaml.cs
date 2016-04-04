using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Menu_Rights_BO_DAO.DAO;
using Menu_Rights_BO_DAO.BO;
using Menu_Rights.classes;
using System.Threading;

namespace Menu_Rights.pages {
	/// <summary>
	/// Interaction logic for treeview.xaml
	/// </summary>
	public partial class treeview : Page {

		// fields
		List<menuItem> currentTreeviewItems = null;
		List<menuItem> originalItems = null;
		List<menuItem> itemsThatWereAdapted = new List<menuItem>();
		List<menuItem> copiedRights = null;


		// initializers
		public treeview() {
			InitializeComponent();
		}

		private void init(object sender, RoutedEventArgs e) {
			menuRightsApplication app = this.DataContext as menuRightsApplication;

			setScrollerHeight();

			cmbGroups.DataContext = dbUserGroups.getUserGroups();
			// cmbGroups.Items.MoveCurrentTo(currentGroup); //-> gaat niet omdat equals niet kon overridden worden
			//fillTreeview(app.currentUser.group.id);
		}


		// UI handlers
		private void Page_SizeChanged(object sender, SizeChangedEventArgs e) {
			setScrollerHeight();
		}

		private void groupSelectionChangedHandler(object sender, SelectionChangedEventArgs e) {
			fillTreeview((cmbGroups.SelectedItem as userGroup).id);
			itemsThatWereAdapted.Clear();
		}

		private void checkboxClickHandler(object sender, RoutedEventArgs e) {
			int menuItemID;
			CheckBox checkbox = (CheckBox) sender;
			bool comesFromSubItem = false;

			// check caller
			try {
				menuItemID = Convert.ToInt32(e.Source.ToString());
				comesFromSubItem = true;
			} catch {
				menuItemID = (int) checkbox.Tag;
			}

			// get items to compare
			menuItem checkedItem = getMenuItemWithID(currentTreeviewItems, menuItemID);
			menuItem originalItem = getMenuItemWithID(originalItems, menuItemID);

			// add or remove from altered items list
			handleItemChanges(checkedItem, originalItem);

			if (!comesFromSubItem) {
				if (checkbox.Name.Equals("chkVisible")) {
					// handle subitem visibility
					handleItems(checkedItem.subItems,
						checkedItem.rights.isVisible ? treeviewItemAction.SetAllVisible : treeviewItemAction.SetAllInvisible);

					// handle parent visibility if checked
					if ((bool) checkbox.IsChecked) {
						handleParents(checkedItem, checkbox, e);
					};
				};
			} else {
				handleParents(checkedItem, checkbox, e);
			}


			// treeview refreshen lukt NIET	!!!
			//trvTreeview.Dispatcher.Invoke(new Action(delegate() {
			//	List<int> expandedList = new List<int>();
			//	foreach (TreeViewItem item in trvTreeview.ItemsSource) {
			//		if (item.IsExpanded) { expandedList.Add(getMenuItemWithID(currentTreeviewItems, (int) checkbox.Tag).id); }
			//	}
			//	trvTreeview.Items.Refresh();
			//	foreach (TreeViewItem item in trvTreeview.Items) {
			//		if (expandedList.IndexOf(getMenuItemWithID(currentTreeviewItems, (int) checkbox.Tag).id) > -1) {
			//			item.IsExpanded = true;
			//		}
			//	}
			//}), System.Windows.Threading.DispatcherPriority.Render);
		}

		private void btnSaveTreeview_Click(object sender, RoutedEventArgs e) {
			for (int i = itemsThatWereAdapted.Count - 1; i > -1; i--) {
				menuItem item = itemsThatWereAdapted[i];
				if (item.rights.ToString() ==
					getMenuItemWithID(originalItems, item.id).rights.ToString()) {
						itemsThatWereAdapted.Remove(item);
				}
			}

			if (itemsThatWereAdapted.Count > 0) {
				userGroup currentGroup = (userGroup) cmbGroups.SelectedItem;

				mailer.sendMail(createMessage(itemsThatWereAdapted, originalItems), currentGroup);

				try {
					dbItems.saveItems(itemsThatWereAdapted, currentGroup.id);
					MessageBox.Show("De rechten zijn opgeslagen.");

					itemsThatWereAdapted.Clear();
					fillTreeview(currentGroup.id);

				} catch {
					MessageBox.Show("De rechten konden niet worden opgeslagen.\nGelieve opnieuw te proberen ofwel iemand belangrijk te contacteren.");
				}

			} else {
				MessageBox.Show("Er zijn geen items veranderd waardoor er niets zal worden opgeslagen.");
			}
		}

		private void btnSelectAll_Click(object sender, RoutedEventArgs e) {
			handleItems((trvTreeview.DataContext as List<menuItem>), treeviewItemAction.SetAllVisible);
		}

		private void btnDeselectAll_Click(object sender, RoutedEventArgs e) {
			handleItems((trvTreeview.DataContext as List<menuItem>), treeviewItemAction.SetAllInvisible);
		}

		private void btnSelectAllRights_Click(object sender, RoutedEventArgs e) {
			handleItems((trvTreeview.DataContext as List<menuItem>), treeviewItemAction.SelectAllRights);
		}

		private void btnDeselectAllRights_Click(object sender, RoutedEventArgs e) {
			handleItems((trvTreeview.DataContext as List<menuItem>), treeviewItemAction.UnselectAllRights);
		}

		private void btnCopyRights_Click(object sender, RoutedEventArgs e) {
			if (currentTreeviewItems == null) { return; };
			if (copiedRights == null) { copiedRights = new List<menuItem>(); };

			copiedRights.Clear();
			currentTreeviewItems.ForEach(x => copiedRights.Add(x));
		}

		private void btnPasteRights_Click(object sender, RoutedEventArgs e) {
			if (copiedRights != null && trvTreeview.DataContext != null) {
				pasteRights(copiedRights);
			}
		}


		// helpers
		private void setScrollerHeight() {
			scrScroller.Height = this.ActualHeight;
			scrScroller.MaxHeight = this.ActualHeight;
		}

		private void fillTreeview(int groupId) {
			resetItemCollections(groupId);
			bindTreeview(currentTreeviewItems);
		}

		private void resetItemCollections(int groupID) {
			currentTreeviewItems = dbItems.getItemsForGroup(groupID);
			currentTreeviewItems = hierarchicalHelper.convertToHierarchicalMenuItemList(currentTreeviewItems);

			originalItems = dbItems.getItemsForGroup(groupID);
			originalItems = hierarchicalHelper.convertToHierarchicalMenuItemList(originalItems);

			itemsThatWereAdapted.Clear();
		}

		private void bindTreeview(List<menuItem> items) {
			trvTreeview.DataContext = items;
		}

		private menuItem getMenuItemWithID(List<menuItem> items, int idToFind) {
			foreach (menuItem item in items) {
				if (item.id == idToFind) { return item; } else {
					menuItem subitem = getMenuItemWithID(item.subItems, idToFind);
					if (subitem != null) { return subitem; };
				};
			}

			return null;
		}

		private void handleItemChanges(menuItem item, menuItem originalItem) {
			if (item.Equals(originalItem))
				itemsThatWereAdapted.Remove(item);
			else
				if (itemsThatWereAdapted.IndexOf(item) > -1) { itemsThatWereAdapted.Remove(item); };
				itemsThatWereAdapted.Add(item);
		}

		private void handleParents(menuItem checkedItem, CheckBox checkbox, RoutedEventArgs e) {
			if (checkedItem.parentID > 0) {
				menuItem parent = getMenuItemWithID(currentTreeviewItems, checkedItem.parentID);
				parent.rights.isVisible = true;
				e.Source = checkedItem.parentID;
				checkboxClickHandler(checkbox, e);
			};
		}

		private void handleItems(List<menuItem> items, treeviewItemAction action) {
			if (items == null) { return; };

			bool setValue = action == treeviewItemAction.SetAllVisible || action == treeviewItemAction.SelectAllRights ? true : false;

			// handle enabling/disabling of all child elements
			if (action == treeviewItemAction.SetAllVisible || action == treeviewItemAction.SetAllInvisible) {
				foreach (menuItem item in items) {
					item.rights.isVisible = setValue;
					handleItemChanges(item, getMenuItemWithID(originalItems, item.id));
					if (item.subItems.Count > 0) { handleItems(item.subItems, action); };
				}
			} else {
				foreach (menuItem item in items) {
					item.rights.canCancel = setValue;
					item.rights.canClose = setValue;
					item.rights.canDelete = setValue;
					item.rights.canFind = setValue;
					item.rights.canHelp = setValue;
					item.rights.canNew = setValue;
					item.rights.canPrint = setValue;
					item.rights.canSave = setValue;
					handleItemChanges(item, getMenuItemWithID(originalItems, item.id));
					if (item.subItems.Count > 0) { handleItems(item.subItems, action); };
				}
			}
		}

		private void pasteRights(List<menuItem> copiedRights) {
			foreach (menuItem copiedItem in copiedRights) {
				menuItem targetItem = getMenuItemWithID(currentTreeviewItems, copiedItem.id);
				targetItem.rights.isVisible = copiedItem.rights.isVisible;
				targetItem.rights.canNew = copiedItem.rights.canNew;
				targetItem.rights.canSave = copiedItem.rights.canSave;
				targetItem.rights.canDelete = copiedItem.rights.canDelete;
				targetItem.rights.canCancel = copiedItem.rights.canCancel;
				targetItem.rights.canPrint = copiedItem.rights.canPrint;
				targetItem.rights.canFind = copiedItem.rights.canFind;
				targetItem.rights.canHelp = copiedItem.rights.canHelp;
				targetItem.rights.canClose = copiedItem.rights.canClose;

				handleItemChanges(targetItem, getMenuItemWithID(originalItems, copiedItem.id));

				if (copiedItem.subItems.Count > 0) { pasteRights(copiedItem.subItems); };
			}
		}

		private string createMessage(List<menuItem> itemsThatWereAdapted, List<menuItem> originalItems) {
			StringBuilder message = new StringBuilder();

			message.AppendLine("Beste {login},");
			message.AppendLine();
			message.AppendLine("uw rechten in ons systeem zijn aangepast. Hieronder een overzicht:");
			message.AppendLine();

			foreach (menuItem item in itemsThatWereAdapted) {
				menuItem originalItem = getMenuItemWithID(originalItems, item.id);
				string itemPath = getItemPath(item);
				message.AppendLine(itemPath);
				if (originalItem.rights.isVisible != item.rights.isVisible) {
					message.Append("\t");
					message.Append(originalItem.rights.isVisible ? "was visible, " : "was not visible, ");
					message.Append(item.rights.isVisible ? "is now visible, " : "is now invisible");
					message.AppendLine();
				}
				if (originalItem.rights.canNew != item.rights.canNew) {
					message.Append("\t");
					message.Append(originalItem.rights.canNew ? "was newable, " : "was not newable, ");
					message.Append(item.rights.canNew ? "is now newable, " : "isn't newable anymore");
					message.AppendLine();
				}
				if (originalItem.rights.canSave != item.rights.canSave) {
					message.Append("\t");
					message.Append(originalItem.rights.canSave ? "was saveable, " : "was not saveable, ");
					message.Append(item.rights.canSave ? "is now saveable, " : "isn't saveable anymore");
					message.AppendLine();
				}
				if (originalItem.rights.canDelete != item.rights.canDelete) {
					message.Append("\t");
					message.Append(originalItem.rights.canDelete ? "was deleteable, " : "was not deleteable, ");
					message.Append(item.rights.canDelete ? "is now deleteable, " : "isn't deleteable anymore");
					message.AppendLine();
				}
				if (originalItem.rights.canCancel != item.rights.canCancel) {
					message.Append("\t");
					message.Append(originalItem.rights.canCancel ? "was cancelable, " : "was not cancelable, ");
					message.Append(item.rights.canCancel ? "is now cancelable, " : "isn't cancelable anymore");
					message.AppendLine();
				}
				if (originalItem.rights.canClose != item.rights.canClose) {
					message.Append("\t");
					message.Append(originalItem.rights.canClose ? "was closeable, " : "was not closeable, ");
					message.Append(item.rights.canClose ? "is now closeable, " : "isn't closeable anymore");
					message.AppendLine();
				}
				if (originalItem.rights.canPrint != item.rights.canPrint) {
					message.Append("\t");
					message.Append(originalItem.rights.canPrint ? "was printable, " : "was not printable, ");
					message.Append(item.rights.canPrint ? "is now printable, " : "isn't printable anymore");
					message.AppendLine();
				}
				if (originalItem.rights.canFind != item.rights.canFind) {
					message.Append("\t");
					message.Append(originalItem.rights.canFind ? "was findable, " : "was not findable, ");
					message.Append(item.rights.canFind ? "is now findable, " : "isn't findable anymore");
					message.AppendLine();
				}
				if (originalItem.rights.canHelp != item.rights.canHelp) {
					message.Append("\t");
					message.Append(originalItem.rights.canHelp ? "was helpable, " : "was not helpable, ");
					message.Append(item.rights.canHelp ? "is now helpable, " : "isn't helpable anymore");
					message.AppendLine();
				}

				message.AppendLine();
			}

			message.AppendLine();
			message.AppendLine("Kind regards,");
			message.AppendLine();
			message.AppendLine("the WPF crew.");
			message.AppendLine();
			message.AppendLine("Date: " + DateTime.Now.ToLongDateString());

			return message.ToString();
		}

		private string getItemPath(menuItem item, string path = "") {
			if (string.IsNullOrEmpty(path)) { 
				path = item.text; 
			} else { 
				path = item.text + " -> " + path; 
			};
			
			if (item.parentID > 0) {
				menuItem parent = getMenuItemWithID(currentTreeviewItems, item.parentID);
				path = getItemPath(parent, path);
			};

			return path;
		}


		// private enums
		private enum treeviewItemAction {
			SetAllVisible,
			SetAllInvisible,
			SelectAllRights,
			UnselectAllRights
		}

	}
}
