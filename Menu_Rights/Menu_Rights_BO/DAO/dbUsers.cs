using Menu_Rights_BO_DAO.CONFIG;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using Menu_Rights_BO_DAO.BO;

namespace Menu_Rights_BO_DAO.DAO {

    public static class dbUsers {

        public static appUser getUser(string login, string password) {
            appUser user = null;

            using (SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getUser", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@login", login);
                com.Parameters.AddWithValue("@password", password);

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if (reader.HasRows) {
                        while (reader.Read()) {
                            user = new appUser();
                            user.id = Convert.ToInt32(reader["id"]);
                            user.login = login;
                            user.group = dbUserGroups.getUserGroup(Convert.ToInt32(reader["groupID"]));
                        }
                    };
                } catch (Exception ex) {
                    throw ex;
                };
            }

            return user;
        }
    }
}
