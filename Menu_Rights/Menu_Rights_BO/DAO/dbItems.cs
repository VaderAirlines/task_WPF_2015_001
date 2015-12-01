using Menu_Rights_BO_DAO.CONFIG;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using Menu_Rights_BO_DAO.BO;

namespace Menu_Rights_BO_DAO.DAO {

    public static class dbItems {

        public static List<menuItem> getItemsForGroup(int groupID) {
            List<menuItem> items = null;

            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getItemsForGroup",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@groupID",groupID);

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if(reader.HasRows) {
                        items = new List<menuItem>();

                        while(reader.Read()) {
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

        public static List<menuItem> getAllItems() {
            List<menuItem> items = null;

            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getAllItems",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if(reader.HasRows) {
                        items = new List<menuItem>();

                        while(reader.Read()) {
                            menuItem item = new menuItem();
                            item.id = Convert.ToInt32(reader["id"]);
                            item.pageName = reader["pageName"].ToString();
                            item.orderNrInParent = Convert.ToInt32(reader["orderNrInParent"]);
                            item.text = reader["itemText"].ToString();
                            item.parentID = Convert.ToInt32(reader["parentID"]);

                            items.Add(item);
                        };
                    };
                } catch { throw; };
            }

            return items;
        }

        public static void createMenuItem(string text,int parentID,int orderNrInParent,string pageName) {
            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("createMenuItem",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@text", text);
                com.Parameters.AddWithValue("@parentID", parentID);
                com.Parameters.AddWithValue("@orderNrInParent", orderNrInParent);
                com.Parameters.AddWithValue("@pageName", pageName);

                try {
                    con.Open();

                    com.ExecuteNonQuery();

                } catch { throw; };
            }
        }
    }
}
