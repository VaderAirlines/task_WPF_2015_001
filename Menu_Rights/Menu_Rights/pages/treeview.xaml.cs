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

namespace Menu_Rights.pages {
    /// <summary>
    /// Interaction logic for treeview.xaml
    /// </summary>
    public partial class treeview:Page {
        
        // fields
        List<menuItem> currentTreeviewItems = null;

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
        }

        private void visibilityChangedHandler(object sender,RoutedEventArgs e) {
            CheckBox checkbox = (CheckBox)sender;
            menuItem checkedItem = getMenuItemWithID(currentTreeviewItems, (int)checkbox.Tag);
            MessageBox.Show(checkedItem.id.ToString());
        }

        // helpers
        private void fillTreeview(userGroup group) {
            currentTreeviewItems = dbItems.getItemsForGroup(group.id);
            currentTreeviewItems = hierarchicalHelper.convertToHierarchicalMenuItemList(currentTreeviewItems);

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
