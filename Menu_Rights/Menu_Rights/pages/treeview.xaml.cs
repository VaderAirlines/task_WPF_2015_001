﻿using System;
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

		private void visibilityChangedHandler(object sender, RoutedEventArgs e) {
			CheckBox checkbox = (CheckBox) sender;
			menuItem checkedItem = getMenuItemWithID(currentTreeviewItems, (int) checkbox.Tag);
			menuItem originalItem = getMenuItemWithID(originalItems, (int) checkbox.Tag);

			handleItemChanges(checkedItem, originalItem);

			if (checkbox.Name.Equals("chkVisible")) {
				actOnMenuItems(checkedItem.subItems,
					checkedItem.rights.isVisible ? treeviewItemAction.Select : treeviewItemAction.Deselect);
			};

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
			if (itemsThatWereAdapted.Count > 0) {
				userGroup currentGroup = (userGroup) cmbGroups.SelectedItem;

				mailer.sendMail(itemsThatWereAdapted, originalItems, currentGroup);
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
			actOnMenuItems((trvTreeview.DataContext as List<menuItem>), treeviewItemAction.Select);
		}

		private void btnDeselectAll_Click(object sender, RoutedEventArgs e) {
			actOnMenuItems((trvTreeview.DataContext as List<menuItem>), treeviewItemAction.Deselect);
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
				itemsThatWereAdapted.Add(item);
		}

		private void actOnMenuItems(List<menuItem> items, treeviewItemAction action) {
			if (items == null) { return; };

			bool setValue = action == treeviewItemAction.Select ? true : false;
			foreach (menuItem item in items) {
				item.rights.isVisible = setValue;
				handleItemChanges(item, getMenuItemWithID(originalItems, item.id));
				if (item.subItems.Count > 0) { actOnMenuItems(item.subItems, action); };
			}
		}

		private void pasteRights(List<menuItem> copiedRights) {
			foreach (menuItem copiedItem in copiedRights) {
				menuItem targetItem = getMenuItemWithID(currentTreeviewItems, copiedItem.id);
				targetItem.rights.isVisible = copiedItem.rights.isVisible;
				targetItem.rights.canCreate = copiedItem.rights.canCreate;
				targetItem.rights.canDelete = copiedItem.rights.canDelete;
				targetItem.rights.canRead = copiedItem.rights.canRead;
				targetItem.rights.canUpdate = copiedItem.rights.canUpdate;

				if (copiedItem.subItems.Count > 0) { pasteRights(copiedItem.subItems); };
			}
		}

		// private enums
		private enum treeviewItemAction {
			Select,
			Deselect
		}

	}
}
