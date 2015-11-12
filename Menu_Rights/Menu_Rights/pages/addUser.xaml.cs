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
    /// Interaction logic for addUser.xaml
    /// </summary>
    public partial class addUser:Page {

        public List<lowieke> testList = null;
        public testObject testObject = new testObject() { testProperty="joske" };

        public addUser() {
            InitializeComponent();

            testList = new List<lowieke>() { new lowieke() { joske="eerste dinges", agnes = false},
                                             new lowieke() { joske="eerste dinges", agnes = false},
                                             new lowieke() { joske="eerste dinges", agnes = false},
                                             new lowieke() { joske="eerste dinges", agnes = false},
                                             new lowieke() { joske="eerste dinges", agnes = false},
                                             new lowieke() { joske="eerste dinges", agnes = false},
                                             new lowieke() { joske="eerste dinges", agnes = false},
                                             new lowieke() { joske="tweede dinges", agnes=true} 
                                            };

            cmbGroups.DataContext = testList; 
            txtLogin.DataContext = testObject;
        }

        private void createUser(object sender,RoutedEventArgs e) {
            if (cmbGroups.SelectedIndex != -1) {
                lowieke item = (lowieke)cmbGroups.SelectedItem;
                MessageBox.Show(item.joske);
                MessageBox.Show(testObject.testProperty);
            } else {
                MessageBox.Show("Please choose a group.");
            }
        }
    }

    public class lowieke {
        public string joske { get; set; }
        public bool agnes { get; set; }
    }

    public class testObject {
        public string testProperty { get; set; }
    }
}
