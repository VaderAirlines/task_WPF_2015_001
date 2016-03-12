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

namespace Menu_Rights.pages {
    /// <summary>
    /// Interaction logic for treeview.xaml
    /// </summary>
    public partial class treeview:Page {
        
        // fields
        List<menuItem> currentTreeviewItems = null;
		List<menuItem> originalItems = null;
		List<menuItem> itemsThatWereAdapted = new List<menuItem>();

        // initializers
        public treeview() {
            InitializeComponent();
        }

        private void init(object sender,RoutedEventArgs e) {
            menuRightsApplication app = this.DataContext as menuRightsApplication;

            cmbGroups.DataContext = dbUserGroups.getUserGroups();
            cmbGroups.SelectedItem = app.currentUser.group;

            fillTreeview((userGroup)cmbGroups.SelectedItem);
        }


        // UI handlers
        private void groupSelectionChangedHandler(object sender,SelectionChangedEventArgs e) {
            fillTreeview((userGroup)cmbGroups.SelectedItem);
			itemsThatWereAdapted.Clear();
        }

        private void visibilityChangedHandler(object sender,RoutedEventArgs e) {
            CheckBox checkbox = (CheckBox)sender;
            menuItem checkedItem = getMenuItemWithID(currentTreeviewItems, (int)checkbox.Tag);
			menuItem originalItem = getMenuItemWithID(originalItems, (int) checkbox.Tag);

			// update items that were adapted
			if (checkedItem.Equals(originalItem))
				itemsThatWereAdapted.Remove(checkedItem);
			else
				itemsThatWereAdapted.Add(checkedItem);
        }

		private void btnSaveTreeview_Click(object sender, RoutedEventArgs e) {
			if (itemsThatWereAdapted.Count > 0) {
				userGroup currentGroup = (userGroup) cmbGroups.SelectedItem;

				mailer.sendMail(itemsThatWereAdapted, originalItems, currentGroup);
				try {
					dbItems.saveItems(itemsThatWereAdapted, currentGroup.id);
					MessageBox.Show("De rechten zijn opgeslagen.");

					itemsThatWereAdapted.Clear();
					fillTreeview(currentGroup);

				} catch {
					MessageBox.Show("De rechten konden niet worden opgeslagen.\nGelieve opnieuw te proberen ofwel iemand belangrijk te contacteren.");
				}

			} else {
				MessageBox.Show("Er zijn geen items veranderd waardoor er niets zal worden opgeslagen.");
			}
		}

        // helpers
        private void fillTreeview(userGroup group) {
            currentTreeviewItems = dbItems.getItemsForGroup(group.id);
            currentTreeviewItems = hierarchicalHelper.convertToHierarchicalMenuItemList(currentTreeviewItems);

			originalItems = dbItems.getItemsForGroup(group.id);
			originalItems = hierarchicalHelper.convertToHierarchicalMenuItemList(originalItems);

            trvTreeview.Items.Clear();
            currentTreeviewItems.ForEach(item => trvTreeview.Items.Add(item));
        }
        
        private menuItem getMenuItemWithID(List<menuItem> items,int idToFind) {
            foreach(menuItem item in items) {
                if (item.id == idToFind) { return item; }
                else { 
                    menuItem subitem = getMenuItemWithID(item.subItems, idToFind);
                    if (subitem != null) { return subitem; };
                };
            }

            return null;
        }

    }
}
