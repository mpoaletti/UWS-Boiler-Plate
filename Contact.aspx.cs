using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Xml.Linq;
using Azure.Security.KeyVault.Secrets;
using Azure.Identity;

namespace UWS_Boiler_Plate
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSend.Attributes["title"] = "Click to send the message";
                btnRetrieve.Attributes["title"] = "Click to retrieve the message";
            }

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string KeyVaultUrl = ConfigurationManager.AppSettings["KeyVaultUrl"]; // Include the key name from web.config that is assigned the value of your Key Vault URL.
            string secretName = "MyConnectionString"; // Replace "MyConnectionString" with the name of the secret you created in Key Vault that contains your connection string.

            try
            {
                SecretClient client = new SecretClient(new Uri(KeyVaultUrl), new DefaultAzureCredential());
                KeyVaultSecret secret = client.GetSecret(secretName);
                string connectionString = secret.Value;
                var insertStatement = "INSERT into tblContactFormMessages (Name, Message) values (@Name, @Message)";
                using (var sqlConnection = new SqlConnection(connectionString))
                {
                    sqlConnection.Open();
                    using (var sqlCommand = new SqlCommand(insertStatement, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("Name", cfMessage.Name);
                        sqlCommand.Parameters.AddWithValue("Message", cfMessage.Message);
                        sqlCommand.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                
            }

        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            string KeyVaultUrl = ConfigurationManager.AppSettings["KeyVaultUrl"];
            string secretName = "MyConnectionString";
            string inputName = txtName2.Text.Trim();

            try
            {
                SecretClient client = new SecretClient(new Uri(KeyVaultUrl), new DefaultAzureCredential());
                KeyVaultSecret secret = client.GetSecret(secretName);
                string connectionString = secret.Value;
                var insertStatement = "SELECT Message FROM tblContactFormMessages WHERE Name = @InputName";
                using (var sqlConnection = new SqlConnection(connectionString))
                {
                    sqlConnection.Open();
                    using (var sqlCommand = new SqlCommand(insertStatement, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@InputName", inputName);
                        using (SqlDataReader reader = sqlCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                lblMessages.Text = reader["Message"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

    }
}