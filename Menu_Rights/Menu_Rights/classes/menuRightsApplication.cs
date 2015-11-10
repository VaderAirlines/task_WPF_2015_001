using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Menu_Rights_BO_DAO.BO;
using Menu_Rights_BO_DAO.DAO;

namespace Menu_Rights {
    public class menuRightsApplication {

        // public properties
        public appUser currentUser { get; set; }
        public menuItem currentMenuItem { get; set; }

        public menuRightsApplication() {
            this.currentUser = dbUsers.getUser("login","paswoord");
        }

    }
}
