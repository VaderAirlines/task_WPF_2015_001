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
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow:Window {

            // application reference
            public menuRightsApplication app { get; set; }


            // initializers
            public MainWindow() {
                InitializeComponent();
            }

            private void init(object sender,RoutedEventArgs e) {
                app = new menuRightsApplication();

                fillMenu(app.currentUser.getMenuItems());
                
                Page startPage = (Page)Application.LoadComponent(new Uri("pages/treeview.xaml",UriKind.Relative));
                startPage.DataContext = app;

                fraContent.Navigate(startPage);
            }


            // UI handlers
            private void openPage(object sender,RoutedEventArgs e) {
                e.Handled = true;

                MenuItem item = (MenuItem)sender;
                string[] tagSplit = item.Tag.ToString().Split('|');

                string page = "pages/" + tagSplit[0];
                app.currentMenuItem = app.currentUser.getMenuItem(Convert.ToInt32(tagSplit[1]));

                Page pageToOpen = (Page)Application.LoadComponent(new Uri(page,UriKind.Relative));
                pageToOpen.DataContext = app;

                fraContent.Navigate(pageToOpen);
            }


            // helpers
            private void fillMenu(List<menuItem> items) {
                items.ForEach(item => mnuMenu.Items.Add(item));
            }

    }


}
