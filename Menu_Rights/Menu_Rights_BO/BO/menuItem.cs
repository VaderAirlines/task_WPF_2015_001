﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Menu_Rights_BO_DAO.BO {
    public class menuItem {
        // BACKING FIELDS
        int _id;
        int _orderNrInParent;
        int _fontSize;
        int _parentID;

        string _text;
        string _pageName;
        string _color;

        menuItemRights _rights;
        List<menuItem> _subItems;

        // PROPERTIES
        public int id { get { return _id; } set { _id = value; } }
        public int parentID { get { return _parentID; } set { _parentID = value; } }
        public int orderNrInParent { get { return _orderNrInParent; } set { _orderNrInParent = value; } }
        public int fontSize { get { return _fontSize; } set { _fontSize = value; } }

        public string text { get { return _text; } set { _text = value; } }
        public string pageName { get { return _pageName; } set { _pageName = value; } }
        public string color { get { return _color; } set { _color = value; } }
        public string tag { get { return pageName + "|" + id; } }

        public menuItemRights rights { get { return _rights; } set { _rights = value; } }
        public List<menuItem> subItems { get { return _subItems; } set { _subItems = value; } }

        // EXTRA PROPERTIES FOR COMBOBOXES ETC.
        public string textAndID { get { return _text + " (" + _id + ")"; } }
    }
}
