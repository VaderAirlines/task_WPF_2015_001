using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Menu_Rights_BO_DAO.BO {

    public class menuItemRights {
        //.ctor
        public menuItemRights(string rights) {
            char[] rightsArray = rights.ToCharArray();
            this.canCreate = rightsArray[0] == '1' ? true : false;
            this.canRead = rightsArray[1] == '1' ? true : false;
            this.canUpdate = rightsArray[2] == '1' ? true : false;
            this.canDelete = rightsArray[3] == '1' ? true : false;
        }

        // properties
        public bool canCreate { get; set; }
        public bool canRead { get; set; }
        public bool canUpdate { get; set; }
        public bool canDelete { get; set; }
    }


}
