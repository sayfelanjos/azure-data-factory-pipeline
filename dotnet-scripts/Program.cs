using System;
using DT = System.Data;
using QC = Microsoft.Data.SqlClient;

namespace Connect_to_SQL_Server
{
    public class Program
    {
        static public void Main(string[] args)
        {
            string connectionString = $"""
            Server=tcp:{args[0]}.database.windows.net,1433;Database={args[1]};
            User ID={args[2]};Password={args[3]};
            Encrypt=True;TrustServerCertificate=False;
            Connection Timeout=30;
            """;

            using (var connection = new QC.SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Connected successfully.");

                Program.SelectRows(connection);
            }
        }

        static public void SelectRows(QC.SqlConnection connection)
        {
            using (var command = new QC.SqlCommand())
            {
                string query = File.ReadAllText(@"..\models\Create_Table_Inspand.sql");
                command.Connection = connection;
                command.CommandType = DT.CommandType.Text;
                command.CommandText = query;

                QC.SqlDataReader reader = command.ExecuteReader();
            }
        }
    }
}