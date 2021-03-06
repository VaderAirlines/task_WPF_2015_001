﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Menu_Rights_BO_DAO.BO {
    public class appUser {
        // BACKING FIELDS
        private int _id;
        private string _login;
        private string _email;
        private userGroup _group;

        // PROPERTIES
        public int id { get { return _id; } set { _id = value; } }
        public string login { get { return _login; } set { _login = value; } }
		public string email { get { return _email; } set { _email = value; } }
        public userGroup group { get { return _group; } set { _group = value; } }

        public List<menuItem> getMenuItems() {
			group.menuItems = group.menuItems.Where(item => item.rights.isVisible == true).ToList();
            group.menuItems.ForEach(item => item.subItems = group.menuItems.Where(child => child.parentID == item.id).ToList());
            List<menuItem> topItems = group.menuItems.Where(item => item.parentID == 0).ToList();

            return topItems;
        }

        public menuItem getMenuItem(int _id) {
            try {
                return (menuItem)group.menuItems.Where(_item => _item.id == _id).ToList()[0];
            } catch {
                return null;
            }
        }

    }
}