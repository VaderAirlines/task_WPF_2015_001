using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Menu_Rights_BO_DAO.BO;
using Menu_Rights_BO_DAO.DAO;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;

namespace Menu_Rights {

    public class menuRightsApplication {

        // events
        public event EventHandler<validUserLoggedInEventArgs> validUserLoggedIn;
        public event EventHandler userLoggedOut;

        //.ctor
        public menuRightsApplication() {
        }

        // public properties
        public appUser currentUser { get; set; }

        // methods
        public bool setUser(string login,string password) {
            this.currentUser = dbUsers.getUser(login,password);

            if(this.currentUser != null) {
                validUserLoggedInEventArgs args = new validUserLoggedInEventArgs(login);
                validUserLoggedIn(this,args);
                return true;
            }

            return false;
        }

        public void logOut() {
            this.currentUser = null;
            userLoggedOut(this,new EventArgs());
        }

        public void gotoPage(string pageName,object[] args = null) {

            // get necessary object references
            MainWindow mainWindow = (MainWindow)Application.Current.MainWindow;
            Page pageToOpen = null;

            try {
                pageToOpen = (Page)Application.LoadComponent(new Uri("pages/" + pageName + ".xaml",UriKind.Relative));


                // set data context
                object datacontext = null;
                switch(pageName) {
                    case "login":
                    case "addMenuItem":
                    case "treeview":
                        datacontext = this;
                        break;
                    case "generic_buttons":
                        datacontext = this.currentUser.getMenuItem(Convert.ToInt32(args[0]));
                        break;
                    default:
                        break;
                }

                pageToOpen.DataContext = datacontext;

                // navigate to given page
                mainWindow.fraContent.Navigate(pageToOpen);

            } catch {
                gotoPage("error",args);
            };
        }

    }

    // custom event args
    public class validUserLoggedInEventArgs:EventArgs {
        public validUserLoggedInEventArgs(string login) { this.login = login; }
        public string login { get; set; }
    }
}
