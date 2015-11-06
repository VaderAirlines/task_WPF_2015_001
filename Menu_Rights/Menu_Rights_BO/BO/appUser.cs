﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Menu_Rights_BO_DAO.BO {
    public class appUser {
        // BACKING FIELDS
        private int _id;
        private string _login;
        private userGroup _group;

        // PROPERTIES
        public int id { get { return _id; } set { _id = value; } }
        public string login { get { return _login; } set { _login = value; } }
        public userGroup group { get { return _group; } set { _group = value; } }

        public List<menuItem> getMenuItems() {
            group.menuItems.ForEach(item => item.subItems = group.menuItems.Where(child => child.parentID == item.id).ToList());
            List<menuItem> topItems = group.menuItems.Where(item => item.parentID == 0).ToList();

            return topItems;
        }

    }
}