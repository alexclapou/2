using System;
using System.Data.SqlClient;
using System.Data;

namespace Application
{
    class MainClass
    {
        public static void Main(string[] args)
        {


            String ConnectionString = "Data Source=localhost, 3333;Initial Catalog=MusicApplication;User ID=SA;Password=<YourStrong@Passw0rd>";

            SqlConnection conn = new SqlConnection(ConnectionString); 
            conn.Open();
            Console.WriteLine("Hello World!");
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM musicapplication_schema.Album", conn);
            da.Fill(ds, "musicapplication_schema.Album");
            foreach (DataRow dr in ds.Tables["musicapplication_schema.Album"].Rows)
                Console.WriteLine("{0}", dr["name"]);
            conn.Close();
        }
    }
}
