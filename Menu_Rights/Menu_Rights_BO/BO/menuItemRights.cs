using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;

namespace Menu_Rights_BO_DAO.BO {

	public class menuItemRights : commonBase {
		// delegates/events
		//public delegate void VisibilityRightsChangedEventHandler(bool value);
		//public event VisibilityRightsChangedEventHandler RightsChanged;

		// .ctors
		public menuItemRights(string rights) {
			char[] rightsArray = rights.ToCharArray();
			this.isVisible = rightsArray[0] == '1' ? true : false;
			this.canCreate = rightsArray[1] == '1' ? true : false;
			this.canRead = rightsArray[2] == '1' ? true : false;
			this.canUpdate = rightsArray[3] == '1' ? true : false;
			this.canDelete = rightsArray[4] == '1' ? true : false;
		}

		// clr properties
		//private bool _isVisible;
		//public bool isVisible {
		//	get { return _isVisible; }
		//	set { 
		//		_isVisible = value;
		//		if (RightsChanged != null) { RightsChanged(value); };
		//	}
		//}

		// clr properties
		public string visibleTooltipText { get { return "visibility"; } }
		public string createTooltipText { get { return "create"; } }
		public string readTooltipText { get { return "read"; } }
		public string updateTooltipText { get { return "update"; } }
		public string deleteTooltipText { get { return "delete"; } }

		// clr dprop wrappers
		public bool isVisible {
			get { return (bool) GetValue(isVisibleProperty); }
			set { SetValue(isVisibleProperty, value); }
		}

		public bool canCreate {
			get { return (bool) GetValue(canCreateProperty); }
			set { SetValue(canCreateProperty, value); }
		}

		public bool canRead {
			get { return (bool) GetValue(canReadProperty); }
			set { SetValue(canReadProperty, value); }
		}

		public bool canUpdate {
			get { return (bool) GetValue(canUpdateProperty); }
			set { SetValue(canUpdateProperty, value); }
		}

		public bool canDelete {
			get { return (bool) GetValue(canDeleteProperty); }
			set { SetValue(canDeleteProperty, value); }
		}

		// dependency properties
		public static readonly DependencyProperty isVisibleProperty =
			DependencyProperty.Register("isVisible", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canCreateProperty =
			DependencyProperty.Register("canCreate", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canReadProperty =
			DependencyProperty.Register("canRead", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canUpdateProperty =
			DependencyProperty.Register("canUpdate", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canDeleteProperty =
			DependencyProperty.Register("canDelete", typeof(bool), typeof(menuItemRights));



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
