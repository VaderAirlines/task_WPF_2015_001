using Menu_Rights_BO_DAO.CONFIG;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using Menu_Rights_BO_DAO.BO;

namespace Menu_Rights_BO_DAO.DAO {

    public static class dbItems {

        // TODO : lijst met items ophalen (dataset?)
        //        items opvullen en teruggeven
        public static List<menuItem> getItemsForGroup(int groupID) {
            List<menuItem> items = null;

            using (SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getItemsForGroup", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@groupID", groupID);

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if (reader.HasRows) {
                        items = new List<menuItem>();

                        while (reader.Read()) {
                            menuItem item = new menuItem();
                            item.id = Convert.ToInt32(reader["id"]);
                            item.pageName = reader["pageName"].ToString();
                            item.orderNrInParent = Convert.ToInt32(reader["orderNrInParent"]);
                            item.text = reader["itemText"].ToString();
                            item.color = "Black";
                            item.parentID = Convert.ToInt32(reader["parentID"]);
                            item.rights = new menuItemRights(reader["rights"].ToString());

                            items.Add(item);
                        };
                    };
                } catch { throw; };
            }

            return items;
        }
    }
}
