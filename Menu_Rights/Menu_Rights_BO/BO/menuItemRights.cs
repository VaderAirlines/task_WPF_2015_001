using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Menu_Rights_BO_DAO.BO {

    public class menuItemRights {
        //.ctor
        public menuItemRights(string rights) {
            char[] rightsArray = rights.ToCharArray();
            this.isVisible = rightsArray[0] == '1' ? true : false;
            this.canCreate = rightsArray[1] == '1' ? true : false;
            this.canRead = rightsArray[2] == '1' ? true : false;
            this.canUpdate = rightsArray[3] == '1' ? true : false;
            this.canDelete = rightsArray[4] == '1' ? true : false;
        }

        // properties
        public bool isVisible { get; set; }
        public bool canCreate { get; set; }
        public bool canRead { get; set; }
        public bool canUpdate { get; set; }
        public bool canDelete { get; set; }

        public string visibleTooltipText { get { return "visibility"; } }
        public string createTooltipText { get { return "create"; } }
        public string readTooltipText { get { return "read"; } }
        public string updateTooltipText { get { return "update"; } }
        public string deleteTooltipText { get { return "delete"; } }

		// overrides
		public override string ToString() {
			StringBuilder retval = new StringBuilder();
			retval.Append(isVisible ? 1 : 0);
			retval.Append(canCreate ? 1 : 0);
			retval.Append(canRead ? 1 : 0);
			retval.Append(canUpdate ? 1 : 0);
			retval.Append(canDelete ? 1 : 0);

			return retval.ToString();
		}
    }


}
