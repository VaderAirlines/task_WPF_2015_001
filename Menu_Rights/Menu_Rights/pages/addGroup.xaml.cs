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

    public partial class addGroup:Page {

        // initializers
        public addGroup() {
            InitializeComponent();
        }
        
        private void init(object sender,RoutedEventArgs e) {
            cmbGroups.DataContext = dbUserGroups.getUserGroups();
        }

        // UI handlers
        private void createGroup(object sender,RoutedEventArgs e) {
            if(!(txtGroupname.Text == "")) {
                string groupName = txtGroupname.Text;
                int groupToCopyID = 0;

                if(cmbGroups.SelectedIndex > -1) {
                    userGroup groupToCopy = (userGroup)cmbGroups.SelectedItem;
                    groupToCopyID = groupToCopy.id;
                };

                try {
                    dbUserGroups.createUserGroup(groupName, groupToCopyID);
                    refreshUI();
                    MessageBox.Show("Group was created succesfully.");

                } catch {
                    MessageBox.Show("Failed to create group. Please try again.");
                };

            } else {
                MessageBox.Show("Please enter a groupname.");
                txtGroupname.Focus();
            };
        }


        // helpers
        private void refreshUI() {
            cmbGroups.DataContext = dbUserGroups.getUserGroups();
            txtGroupname.Text = "";
            txtGroupname.Focus();
        }

    }

}
