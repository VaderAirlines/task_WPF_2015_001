using Menu_Rights_BO_DAO.CONFIG;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using Menu_Rights_BO_DAO.BO;

namespace Menu_Rights_BO_DAO.DAO {

    public static class dbUsers {

        // public methods
        public static appUser getUser(string login,string password) {
            appUser user = null;

            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("getUser",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@login",login);
                com.Parameters.AddWithValue("@password",password);

                try {
                    con.Open();

                    SqlDataReader reader = com.ExecuteReader();
                    if(reader.HasRows) {
                        while(reader.Read()) {
                            user = new appUser();
                            user.id = Convert.ToInt32(reader["id"]);
                            user.login = login;
							user.email = reader["emailAddress"].ToString();
                            user.group = dbUserGroups.getUserGroup(Convert.ToInt32(reader["groupID"]));
                        }
                    };
                } catch { throw; };
            }

            return user;
        }

        public static void createUser(string login, string password, string email, int groupID) {
            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("createUser",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@login",login);
                com.Parameters.AddWithValue("@password",password);
                com.Parameters.AddWithValue("@email",password);
                com.Parameters.AddWithValue("@groupID",groupID);

                try {
                    con.Open();

                    com.ExecuteNonQuery();

                } catch { throw; };
            }
        }


        // public helpers
        public static bool logInAlreadyExists(string login) {
            int checkValue;

            using(SqlConnection con = connectionManager.getConnection()) {
                SqlCommand com = new SqlCommand("checkIfUserNameAlreadyExists",con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@login",login);

                try {
                    con.Open();

                    checkValue = Convert.ToInt32(com.ExecuteScalar());

                } catch { throw; };
            }

            return checkValue > 0 ? true : false;
        }
    }
}
