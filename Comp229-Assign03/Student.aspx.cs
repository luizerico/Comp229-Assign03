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
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Students - " + Application["app_name"];

            InfoID.Text = Request.QueryString["student_id"];

            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnAssign03"].ConnectionString;

            conn = new SqlConnection(connectionString);

            comm = new SqlCommand(
                "SELECT StudentID, LastName, FirstMidName, EnrollmentDate FROM Students " +
                "WHERE StudentID=@StudentID", conn);

            comm.Parameters.Add("@StudentID", System.Data.SqlDbType.Int).Value = Request.QueryString["student_id"];
            
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    Info_StudentID.Text = reader["StudentID"].ToString();
                    Info_LastName.Text = reader["LastName"].ToString();
                    Info_FirstName.Text = reader["FirstMidName"].ToString();
                    Info_Enrollment.Text = reader["EnrollmentDate"].ToString();

                    text_studentid.Text = reader["StudentID"].ToString();
                    text_lastname.Text = reader["LastName"].ToString();
                    text_firstname.Text = reader["FirstMidName"].ToString();
                    text_enrollment_date.Text = reader["EnrollmentDate"].ToString();

                }
                reader.Close();
            }
            catch
            {
             student_inform.Text = "Error loading the data";
            }
            finally
            {
                conn.Close();
            }
        }

        protected void updateStudentOnClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection conn;
                SqlCommand comm;
                string connectionString = ConfigurationManager.ConnectionStrings["ConnAssign03"].ConnectionString;

                conn = new SqlConnection(connectionString);

                comm = new SqlCommand(
                    "UPDATE Students SET LastName=@LastName, FirstMidName=@FirstMidName, EnrollmentDate@EnrollmentDate " +
                    "WHERE StudentID=@StudentID", conn);

                comm.Parameters.Add("@StudentID", System.Data.SqlDbType.Int).Value = text_studentid.Text; 
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
                    student_inform.Text = "Student not updated. Try Again or call the support.";
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void deleteStudentOnClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection conn;
                SqlCommand comm;
                string connectionString = ConfigurationManager.ConnectionStrings["ConnAssign03"].ConnectionString;

                conn = new SqlConnection(connectionString);

                comm = new SqlCommand(
                    "DELETE FROM Students  " +
                     "WHERE StudentID=@StudentID", conn);

                comm.Parameters.Add("@StudentID", System.Data.SqlDbType.Int).Value = text_studentid.Text;

                try
                {
                    conn.Open();
                    comm.ExecuteNonQuery();
                    // student_inform.Text = "Student Added..." ; 
                    Response.Redirect("Home.aspx");
                }
                catch
                {
                    student_inform.Text = "Student not deleted. Try Again or call the support.";
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}