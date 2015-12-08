using Menu_Rights_BO_DAO.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Menu_Rights {
    public static class hierarchicalHelper {

        public static List<menuItem> convertToHierarchicalMenuItemList(List<menuItem> itemList) {
            itemList.ForEach(item => item.subItems = itemList.Where(child => child.parentID == item.id).ToList());
            itemList.ForEach(item => item.color = item.subItems.Count < 1 ? "Blue" : "Black");
            List<menuItem> topItems = itemList.Where(item => item.parentID == 0).ToList();
            topItems.ForEach(item => item.color = "Red");

            return topItems;
        }

    }
}
