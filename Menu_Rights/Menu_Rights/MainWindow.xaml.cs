﻿using System;
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

namespace Menu_Rights
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void init(object sender,RoutedEventArgs e) {
            appUser currentUser = dbUsers.getUser("login", "paswoord");
            List<menuItem> items = currentUser.getMenuItems();
            MessageBox.Show("got user");
        }
    }


}
