using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Home - " + Application["app_name"];
        }

        protected void saveStudentOnClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {               
                SqlConnection conn;
                SqlCommand comm;
                string connectionString = ConfigurationManager.ConnectionStrings["ConnAssign03"].ConnectionString;

                conn = new SqlConnection(connectionString);

                comm = new SqlCommand(
                    "INSERT INTO Students (LastName, FirstMidName, EnrollmentDate) " +
                    "VALUES (@LastName, @FirstMidName, @EnrollmentDate)", conn);

                comm.Parameters.Add("@LastName", System.Data.SqlDbType.Text).Value = text_firstname.Text;
                comm.Parameters.Add("@FirstMidName", System.Data.SqlDbType.Text).Value = text_lastname.Text;
                comm.Parameters.Add("@EnrollmentDate", System.Data.SqlDbType.Date).Value = text_enrollment_date.Text;

                try
                {
                    conn.Open();
                    comm.ExecuteNonQuery();
                    // student_inform.Text = "Student Added..." ; 
                    Response.Redirect("Home.aspx");
                }
                catch
                {
                    student_inform.Text = "Student not added. Erro to save the data. Try Again or call the support." ;
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    

    }
}