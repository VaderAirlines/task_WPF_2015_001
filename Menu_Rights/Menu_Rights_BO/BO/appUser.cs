using System;
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
            group.menuItems.ForEach(item => item.color = item.subItems.Count < 1 ? "Yellow" : "Black");
            List<menuItem> topItems = group.menuItems.Where(item => item.parentID == 0).ToList();
            topItems.ForEach(item => item.color = "Red");

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
