using Menu_Rights_BO_DAO.CONFIG;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using Menu_Rights_BO_DAO.BO;

namespace Menu_Rights_BO_DAO.DAO {

    public static class dbUserGroups {

        public static userGroup getUserGroup(int groupID) {
            userGroup userGroup = null;

            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getUserGroup",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@groupID",groupID);

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if(reader.HasRows) {
                        while(reader.Read()) {
                            userGroup = new userGroup();
                            userGroup.id = groupID;
                            userGroup.name = reader["name"].ToString();
                            userGroup.menuItems = dbItems.getItemsForGroup(groupID);
                        }
                    };
                } catch { throw; };
            }

            return userGroup;
        }

        public static List<userGroup> getUserGroups() {
            List<userGroup> userGroups = null;

            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getUserGroups",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if(reader.HasRows) {
                        userGroups = new List<userGroup>();

                        while(reader.Read()) {
                            userGroup ugroup = new userGroup();
                            ugroup.id = Convert.ToInt32(reader["id"]);
                            ugroup.name = reader["name"].ToString();
                            ugroup.menuItems = dbItems.getItemsForGroup(ugroup.id);

                            userGroups.Add(ugroup);
                        }
                    };
                } catch { throw; };
            }

            return userGroups;
        }

        public static void createUserGroup(string groupName,int groupToCopyID) {
            try {
                if(groupToCopyID == 0) { createGroupWithoutCopiedRights(groupName); } 
                else { createCopyOfGroup(groupToCopyID,groupName); };

            } catch { throw; };
        }


        // helpers
        private static void createGroupWithoutCopiedRights(string groupName) {
            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("createUserGroup",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@groupName",groupName);

                try {
                    con.Open();

                    com.ExecuteNonQuery();

                } catch { throw; };
            }
        }

        private static void createCopyOfGroup(int groupToCopyID,string groupName) {
            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("createCopyOfGroup",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@groupName",groupName);
                com.Parameters.AddWithValue("@groupToCopyID",groupToCopyID);

                try {
                    con.Open();

                    com.ExecuteNonQuery();

                } catch { throw; };
            }
        }
    }
}
