using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using System.Windows;

namespace Menu_Rights_BO_DAO.BO {

    public class userGroup : commonBase {

		// .ctors
		public userGroup() {}

		// clr dprop wrappersdependency properties
		public int id {
			get { return (int) GetValue(idProperty); }
			set { SetValue(idProperty, value); }
		}

		public string name {
			get { return (string) GetValue(nameProperty); }
			set { SetValue(nameProperty, value); }
		}

		public List<menuItem> menuItems {
			get { return (List<menuItem>) GetValue(menuItemsProperty); }
			set { SetValue(menuItemsProperty, value); }
		}


		// dependency properties
		public static readonly DependencyProperty idProperty =
			DependencyProperty.Register("id", typeof(int), typeof(userGroup));

		public static readonly DependencyProperty nameProperty =
			DependencyProperty.Register("name", typeof(string), typeof(userGroup));

		public static readonly DependencyProperty menuItemsProperty =
			DependencyProperty.Register("menuItems", typeof(List<menuItem>), typeof(userGroup));


		// overrides
		public override string ToString() {
			return this.id.ToString();
		}

		//public override bool Equals(object obj) {
		//	userGroup other = (userGroup) obj;

		//	if (this.id == other.id) { return true; };
		//	return false;
		//}
    }
}
