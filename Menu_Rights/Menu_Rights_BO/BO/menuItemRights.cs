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
			this.canNew = rightsArray[1] == '1' ? true : false;
			this.canSave = rightsArray[2] == '1' ? true : false;
			this.canDelete = rightsArray[3] == '1' ? true : false;
			this.canCancel = rightsArray[4] == '1' ? true : false;
			this.canPrint = rightsArray[5] == '1' ? true : false;
			this.canFind = rightsArray[6] == '1' ? true : false;
			this.canHelp = rightsArray[7] == '1' ? true : false;
			this.canClose = rightsArray[8] == '1' ? true : false;
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


		// clr dprop wrappers
		public bool isVisible {
			get { return (bool) GetValue(isVisibleProperty); }
			set { SetValue(isVisibleProperty, value); }
		}

		public bool canNew {
			get { return (bool) GetValue(canNewProperty); }
			set { SetValue(canNewProperty, value); }
		}

		public bool canSave {
			get { return (bool) GetValue(canSaveProperty); }
			set { SetValue(canSaveProperty, value); }
		}

		public bool canDelete {
			get { return (bool) GetValue(canDeleteProperty); }
			set { SetValue(canDeleteProperty, value); }
		}

		public bool canCancel {
			get { return (bool) GetValue(canCancelProperty); }
			set { SetValue(canCancelProperty, value); }
		}

		public bool canPrint {
			get { return (bool) GetValue(canPrintProperty); }
			set { SetValue(canPrintProperty, value); }
		}

		public bool canFind {
			get { return (bool) GetValue(canFindProperty); }
			set { SetValue(canFindProperty, value); }
		}

		public bool canHelp {
			get { return (bool) GetValue(canHelpProperty); }
			set { SetValue(canHelpProperty, value); }
		}

		public bool canClose {
			get { return (bool) GetValue(canCloseProperty); }
			set { SetValue(canCloseProperty, value); }
		}


		// dependency properties
		public static readonly DependencyProperty isVisibleProperty =
			DependencyProperty.Register("isVisible", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canNewProperty =
			DependencyProperty.Register("canNew", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canSaveProperty =
			DependencyProperty.Register("canSave", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canCancelProperty =
			DependencyProperty.Register("canCancel", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canDeleteProperty =
			DependencyProperty.Register("canDelete", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canPrintProperty =
			DependencyProperty.Register("canPrint", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canFindProperty =
			DependencyProperty.Register("canFind", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canHelpProperty =
			DependencyProperty.Register("canHelp", typeof(bool), typeof(menuItemRights));

		public static readonly DependencyProperty canCloseProperty =
			DependencyProperty.Register("canClose", typeof(bool), typeof(menuItemRights));

		
		// overrides
		public override string ToString() {
			StringBuilder retval = new StringBuilder();
			retval.Append(isVisible ? 1 : 0);
			retval.Append(canNew ? 1 : 0);
			retval.Append(canSave ? 1 : 0);
			retval.Append(canCancel ? 1 : 0);
			retval.Append(canDelete ? 1 : 0);
			retval.Append(canPrint ? 1 : 0);
			retval.Append(canFind ? 1 : 0);
			retval.Append(canHelp ? 1 : 0);
			retval.Append(canClose ? 1 : 0);

			return retval.ToString();
		}

	}


}
