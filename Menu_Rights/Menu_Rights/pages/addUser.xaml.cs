using Menu_Rights_BO_DAO.BO;
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

namespace Menu_Rights.pages {
    /// <summary>
    /// Interaction logic for addUser.xaml
    /// </summary>
    public partial class addUser:Page {

        // fields
        internal userHelper user = new userHelper();

        // initializers
        public addUser() {
            InitializeComponent();
        }
        
        private void init(object sender,RoutedEventArgs e) {
            cmbGroups.DataContext = dbUserGroups.getUserGroups();
            txtLogin.DataContext = user;
            txtPassword.DataContext = user;
        }


        // UI handlers
        private void createUser(object sender,RoutedEventArgs e) {
            // input verification
            if(cmbGroups.SelectedIndex < 0) {
                MessageBox.Show("Please select a group for the new user.");
                return;
            }

            if ((user.username == null || user.password == null) || (user.username.Length < 6 || user.password.Length < 6)) {
                MessageBox.Show("Please provide a username and password, both min. 6 characters long.");
                return;
            }

            // input verified
            userGroup selectedGroup = (userGroup)cmbGroups.SelectedItem;
            user.groupID = selectedGroup.id;

            if(!dbUsers.logInAlreadyExists(user.username)) {
                try {
                    dbUsers.createUser(user.username,user.password,user.groupID);
                } catch {
                    MessageBox.Show("Failed to create user. Please try again.");
                };

            } else {
                MessageBox.Show("Username already taken. Please choose another one.");
            };

        }

    }

    //-----------------------------------------------------------------------------------------
    // binding classes (helpers)
    internal class userHelper {
        public string username { get; set; }
        public string password { get; set; }
        public int groupID { get; set; }
    }
}
