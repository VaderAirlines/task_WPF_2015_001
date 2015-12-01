using System;
using System.Collections.Generic;
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
using System.Configuration;
using Menu_Rights_BO_DAO.BO;
using Menu_Rights_BO_DAO.DAO;
using Menu_Rights_Application_Settings;
using System.Reflection;

namespace Menu_Rights {

    public partial class MainWindow:Window {

            // application reference
            public menuRightsApplication app { get; set; }

            // initializers
            public MainWindow() {
                InitializeComponent();
            }

            private void init(object sender,RoutedEventArgs e) {
                app = new menuRightsApplication();
                app.validUserLoggedIn += app_validUserLoggedIn;
                app.userLoggedOut += app_userLoggedOut;

                app.gotoPage("login");
            }

            // app event handlers
            void app_validUserLoggedIn(object sender,validUserLoggedInEventArgs e) {
                fillMenu(app.currentUser.getMenuItems());
            }
        
            void app_userLoggedOut(object sender,EventArgs e) {
                mnuMenu.Items.Clear();
            }
        
            // UI handlers
            private void openPage(object sender,RoutedEventArgs e) {
                e.Handled = true;

                MenuItem item = (MenuItem)sender;
                string[] tagSplit = item.Tag.ToString().Split('|');

                string page = tagSplit[0];
                int menuItemID = Convert.ToInt32(tagSplit[1]);

                switch(page) {
                    case "logout":
                        app.logOut();
                        page = "login";
                        break;
                    default:
                        break;
                }

                app.gotoPage(page, new object[] {menuItemID}); 
            }

            // helpers
            public void fillMenu(List<menuItem> items) {
                mnuMenu.Items.Clear();
                items.ForEach(item => mnuMenu.Items.Add(item));
            }

    }


}
