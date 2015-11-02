using Menu_Rights_BO_DAO.CONFIG;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Menu_Rights_BO_DAO.DAO {

    class dbUserGroups {

        public static userGroup getUserGroup(int groupID) {
            userGroup userGroup = null;

            using (SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getUser", con);
                com.Parameters.AddWithValue("@groupID", groupID);

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if (reader.HasRows) {
                        while (reader.Read()) {
                            userGroup = new userGroup();
                            userGroup.id = groupID;
                            userGroup.name = reader["name"].ToString();
                            userGroup.menuItems = dbItems.getItemsForGroup(groupID);
                        }
                    };
                } catch (Exception ex) {
                    throw ex;
                };
            }

            return userGroup;
        }
    }
}
