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
    /// Interaction logic for login.xaml
    /// </summary>
    public partial class login:Page {

        // .ctor
        public login() {
            InitializeComponent();
            txtLogin.Focus();
        }

        // UI handlers
        private void checkLoginCredentials(object sender,RoutedEventArgs e) {
            menuRightsApplication app = (menuRightsApplication)this.DataContext;

            if (txtLogin.Text != "" && txtPassword.Text != "") {
                if (app.setUser(txtLogin.Text, txtPassword.Text)) {
                    app.gotoPage("welcome", new object[] {app.currentUser});
                } else {
                    MessageBox.Show("Login/paswoord combinatie niet gevonden.");
                }

            } else {
                MessageBox.Show("Gelieve beide velden in te vullen");
            }
            
            txtLogin.Focus();
        }
    }
}
