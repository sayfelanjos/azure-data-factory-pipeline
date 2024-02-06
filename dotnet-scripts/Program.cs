using System;
using System.IO;
using DT = System.Data;
using QC = Microsoft.Data.SqlClient;

namespace Connect_to_SQL_Server
{
    public class Program
    {
        static public void Main(string[] args)
        {
            // string connectionString = $"""
            // Server=tcp:{args[0]}.database.windows.net,1433;Database={args[1]};
            // User ID={args[2]};Password={args[3]};
            // Encrypt=True;TrustServerCertificate=False;
            // Connection Timeout=120;
            // """;

                QC.SqlConnectionStringBuilder builder = new QC.SqlConnectionStringBuilder();

                builder.DataSource = "WINDOWS-DESKTOP"; 
                builder.UserID = "sa";            
                builder.Password = "@Sayfelanjos1986";     
                builder.InitialCatalog = "FebrabanLocal";
                builder.TrustServerCertificate = true;

            using (var connection = new QC.SqlConnection(builder.ConnectionString))
            {
                connection.Open(); 
                Console.WriteLine("Connected successfully.");
                connection.Close();      
                Program.SelectRows(connection);

            }
        }

        static public void SelectRows(QC.SqlConnection connection)
        {

            foreach (string file in Directory.GetFiles(@"..\models\Schemas", "*.sql"))
            {
                connection.Open(); 
                using (var command = new QC.SqlCommand())
                {
                    string query = File.ReadAllText(file);
                    command.Connection = connection;
                    command.CommandType = DT.CommandType.Text;
                    command.CommandText = query;

                    QC.SqlDataReader reader = command.ExecuteReader();
                } 
                connection.Close();      
            }

            foreach (string file in Directory.GetFileSystemEntries(@"..\models\Tables", "*.sql", SearchOption.AllDirectories))
            {
                connection.Open(); 
                using (var command = new QC.SqlCommand())
                {
                    string query = File.ReadAllText(file);
                    command.Connection = connection;
                    command.CommandType = DT.CommandType.Text;
                    command.CommandText = query;

                    QC.SqlDataReader reader = command.ExecuteReader();
                } 
                connection.Close();  
            }

        }
    }
}