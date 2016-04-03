using System;
using System.Collections.Generic;
using System.Text;

namespace Menu_Rights_BO_DAO.BO {
	public class menuItem {
		// BACKING FIELDS
		int _id;
		int _orderNrInParent;
		int _fontSize;
		int _parentID;

		string _font;
		string _fontWeight;
		string _text;
		string _pageName;
		string _color;

		menuItemRights _rights = new menuItemRights("111010111");
		List<menuItem> _subItems;

		// .ctors
		public menuItem() {
		}

		//private void handleRightsChange(bool value) {
		//	foreach (menuItem item in this.subItems) {
		//		item.rights.isVisible = value;
		//	}
		//}

		// PROPERTIES
		public int id { get { return _id; } set { _id = value; } }
		public int parentID { get { return _parentID; } set { _parentID = value; } }
		public int orderNrInParent { get { return _orderNrInParent; } set { _orderNrInParent = value; } }
		public int fontSize { get { return _fontSize; } set { _fontSize = value; } }

		public string font { get { return _font; } set { _font = value; } }
		public string fontWeight { get { return _fontWeight; } set { _fontWeight = value; } }
		public string text { get { return _text; } set { _text = value; } }
		public string pageName { get { return _pageName; } set { _pageName = value; } }
		public string color { get { return _color; } set { _color = value; } }
		public string tag { get { return pageName + "|" + id; } }

		public string visibility { get; set; }

		public menuItemRights rights {
			get { return _rights; }
			set {
				_rights = value;
				//_rights.RightsChanged += new menuItemRights.VisibilityRightsChangedEventHandler(handleRightsChange);
			}
		}

		public List<menuItem> subItems { get { return _subItems; } set { _subItems = value; } }

		public string textAndID { get { return _text + " (" + _id + ")"; } }

		// OVERRIDES
		// override object.Equals
		public override bool Equals(object obj) {
			if (obj == null || GetType() != obj.GetType()) {
				return false;
			}

			menuItem other = (menuItem) obj;

			if (other.rights == null)
				return base.Equals(obj);

			if (other.id + other.rights.ToString() == this.id + this.rights.ToString())
				return true;

			return false;
		}

		// override object.GetHashCode
		public override int GetHashCode() {
			// TODO: write your implementation of GetHashCode() here
			// throw new NotImplementedException();
			return base.GetHashCode();
		}

	}
}
