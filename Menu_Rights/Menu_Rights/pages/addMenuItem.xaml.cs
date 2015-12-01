using Menu_Rights_BO_DAO.DAO;
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
using bo = Menu_Rights_BO_DAO.BO;

namespace Menu_Rights.pages {

    public partial class addMenuItem:Page {

        // fields
        bo.menuItem menuItem = new bo.menuItem();


        // initializers
        public addMenuItem() {
            InitializeComponent();
        }

        private void init(object sender,RoutedEventArgs e) {
            List<bo.menuItem> parentList = dbItems.getAllItems();
            bo.menuItem dummyTopItem = new bo.menuItem() { id = 0, text = "is top item" };
            parentList.Insert(0, dummyTopItem);

            cmbParents.DataContext = parentList;
            txtText.DataContext = menuItem;
            txtOrderInParent.DataContext = menuItem;
            txtPageName.DataContext = menuItem;
        }


        // UI handlers
        private void createMenuItem(object sender,RoutedEventArgs e) {
            // input verification
            if(cmbParents.SelectedIndex < 0) {
                MessageBox.Show("Please select a parent for the new user.");
                return;
            }

            if (menuItem.text == "" || menuItem.pageName == "") {
                MessageBox.Show("Please complete the entire form.");
                return;
            }

            // input verified
            bo.menuItem selectedItem = (bo.menuItem)cmbParents.SelectedItem;
            menuItem.parentID = selectedItem.id;

                try {
                    dbItems.createMenuItem(menuItem.text, menuItem.parentID, menuItem.orderNrInParent, menuItem.pageName);

                    MessageBox.Show("Item created successfully.");

                    clearItem();
                    refreshMenu();

                    txtText.Focus();

                } catch {
                    MessageBox.Show("Failed to create menu-item. Please try again.");
                };
        }


        // helpers
        private void clearItem() {
            menuItem = new bo.menuItem();
            init(this, new RoutedEventArgs());
        }

        private void refreshMenu() {
            MainWindow mainWindow = (MainWindow)Application.Current.MainWindow;
            menuRightsApplication app = (menuRightsApplication)this.DataContext;

            app.currentUser.group = dbUserGroups.getUserGroup(app.currentUser.group.id);
            mainWindow.fillMenu(app.currentUser.getMenuItems());
        }
    }


}
