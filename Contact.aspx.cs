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

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string KeyVaultUrl = "https://uws-boilerplate-vault.vault.azure.net/";
            string secretName = "VSConnectionString";

            try
            {
                var client = new SecretClient(new Uri(KeyVaultUrl), new DefaultAzureCredential());
                KeyVaultSecret secret = client.GetSecret(secretName);
                string connectionString = secret.Value;
                // var connectionString = ConfigurationManager.ConnectionStrings[""].ConnectionString;
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

        // Uncomment after connecting to database

        protected void Page_PreRender(object sender, EventArgs e)
        {
            lvMessages.DataBind();
        }
    }
}