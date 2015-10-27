using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;


namespace Menu_Rights_BO_DAO.CONFIG 
{
    static class connectionManager 
    {
        // FIELDS
        static string _connectionString = null;

        // PUBLIC METHODS
        public static SqlConnection getConnection() {
            if (_connectionString == null) {
                _connectionString = readConStringFromAppSettings();
            };

            return new SqlConnection(_connectionString);
        }

        // PRIVATE METHODS
        private static string readConStringFromAppSettings() {
            try {
                Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                return config.AppSettings["connectionString"];
            } catch {
                throw new couldNotReadConnectionStringFromAppSettingsException();
            }
        }
    }

    // EXCEPTIONS
    [Serializable]
    public class couldNotReadConnectionStringFromAppSettingsException:Exception {
        public couldNotReadConnectionStringFromAppSettingsException() { }
        public couldNotReadConnectionStringFromAppSettingsException(string message) : base(message) { }
        public couldNotReadConnectionStringFromAppSettingsException(string message,Exception inner) : base(message,inner) { }
        protected couldNotReadConnectionStringFromAppSettingsException(
          System.Runtime.Serialization.SerializationInfo info,
          System.Runtime.Serialization.StreamingContext context)
            : base(info,context) { }
    }
}
