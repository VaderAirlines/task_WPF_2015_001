using System;
using System.Collections.Generic;
using System.Text;

namespace Menu_Rights_BO_DAO
{
    class appUser
    {
        // BACKING FIELDS
        private int _id;
        private string _login;
        private userGroup _group;

        // PROPERTIES
        public int id { get { return _id; } set { _id = value; } }    
        public string login { get { return _login; } set { _login = value; } }
        public userGroup group { get { return _group; } set { _group = value; } }
    
    }
}
