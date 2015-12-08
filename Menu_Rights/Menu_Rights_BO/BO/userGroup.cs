using System;
using System.Collections.Generic;
using System.Text;

namespace Menu_Rights_BO_DAO.BO {
    public class userGroup {
        // BACKING FIELDS
        int _id;
        string _name;
        List<menuItem> _menuItems;

        // PROPERTIES
        public int id { get { return _id; } set { _id = value; } }
        public string name { get { return _name; } set { _name = value; } }
        public List<menuItem> menuItems { get { return _menuItems; } set { _menuItems = value; } }

        // OVERRIDES
        public override bool Equals(object obj) {
            userGroup other = (userGroup)obj;

            if(this.id == other.id) { return true; };
            return false;
        }
    }
}
