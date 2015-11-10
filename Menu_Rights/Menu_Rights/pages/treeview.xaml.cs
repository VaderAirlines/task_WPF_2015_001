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

        // initializers
        public treeview() {
            InitializeComponent();
        }

        private void init(object sender,RoutedEventArgs e) {
            menuRightsApplication app = this.DataContext as menuRightsApplication;
            fillTreeview(app.currentUser.getMenuItems());
        }


        // helpers
        private void fillTreeview(List<menuItem> items) {
            trvTreeview.Items.Clear();
            items.ForEach(item => trvTreeview.Items.Add(item));
        }

    }
}
