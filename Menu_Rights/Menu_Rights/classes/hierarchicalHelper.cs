using Menu_Rights_BO_DAO.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Menu_Rights {
    public static class hierarchicalHelper {

        public static List<menuItem> convertToHierarchicalMenuItemList(List<menuItem> itemList) {
            itemList.ForEach(item => item.subItems = itemList.Where(child => child.parentID == item.id).ToList());
            itemList.ForEach(item => item.color = item.subItems.Count < 1 ? "Gray" : "Blue");
            itemList.ForEach(item => item.fontSize = item.subItems.Count < 1 ? 15 : 18);
            itemList.ForEach(item => item.visibility = item.subItems.Count < 1 ? "Visible" : "Hidden");
            itemList.ForEach(item => item.font = "Calibri Light");
            itemList.ForEach(item => item.fontWeight = "Normal");

            List<menuItem> topItems = itemList.Where(item => item.parentID == 0).ToList();
            topItems.ForEach(item => item.color = "Blue");
            topItems.ForEach(item => item.fontSize = 20);
            topItems.ForEach(item => item.font = "Calibri Light");
            topItems.ForEach(item => item.fontWeight = "Bold");

            return topItems;
        }

    }
}
