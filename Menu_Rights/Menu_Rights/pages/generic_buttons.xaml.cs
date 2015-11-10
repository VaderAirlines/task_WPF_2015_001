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

namespace Menu_Rights.pages {
    /// <summary>
    /// Interaction logic for generic_buttons.xaml
    /// </summary>
    public partial class generic_buttons:Page {

        // initializers
        public generic_buttons() {
            InitializeComponent();
        }

        // UI handlers
        private void closeWindow(object sender,RoutedEventArgs e) {
            menuRightsApplication app = this.DataContext as menuRightsApplication;
            app.currentMenuItem = null;

            Window mainWindow = Application.Current.MainWindow;
            Frame contentFrame = UIhelper.FindChild<Frame>(Application.Current.MainWindow, "fraContent");

            Page pageToOpen = (Page)Application.LoadComponent(new Uri("pages/treeview.xaml",UriKind.Relative));
            pageToOpen.DataContext = this.DataContext;

            contentFrame.Navigate(pageToOpen);
        }


        
    }
}
