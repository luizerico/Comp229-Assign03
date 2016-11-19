<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <h3>Student Details</h3>
        <div class="row student-detail">
            <p>
                <asp:Literal ID="student_inform" runat="server"></asp:Literal>
            </p>
            <asp:Literal ID="InfoID" runat="server" Visible="False"></asp:Literal>

            <div class="row list">
                <asp:Label ID="student_id" runat="server" Text="Student ID:" CssClass="col-md-4 control-label" />
                <div class="col-md-8">
                    <asp:Literal ID="Info_StudentID" runat="server" Text=""></asp:Literal>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="Label_LastName" runat="server" Text="Last Name:" CssClass="col-md-4 control-label" />
                <div class="col-md-8">
                    <asp:Literal ID="Info_LastName" runat="server" Text=""></asp:Literal>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="Label_FirstName" runat="server" Text="First Name:" CssClass="col-md-4 control-label" />
                <div class="col-md-8">
                    <asp:Literal ID="Info_FirstName" runat="server" Text=""></asp:Literal>
                </div>
            </div>
            <div class="row">
                <asp:Label ID="Label_Enrollment" runat="server" Text="Enrollment Date:" CssClass="col-md-4 control-label" />
                <div class="col-md-8">
                    <asp:Literal ID="Info_Enrollment" runat="server" Text="" />
                </div>
            </div>

            <div id="editStudent" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Student Informations</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label4" Text="Student ID:" CssClass="col-md-4 control-label required" />
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="text_studentid" placeholder="Your first name" CssClass="form-control" Text="" ReadOnly="True" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please, inform your first name."
                                            ControlToValidate="text_firstname" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label1" Text="First Name:" CssClass="col-md-4 control-label required" />
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="text_firstname" placeholder="Your first name" CssClass="form-control" Text="" />
                                        <asp:RequiredFieldValidator ID="text_firstname_req" runat="server" ErrorMessage="Please, inform your first name."
                                            ControlToValidate="text_firstname" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label2" Text="Last Name:" CssClass="col-md-4 control-label required" />
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="text_lastname" placeholder="Your last name" CssClass="form-control" Text="" />
                                        <asp:RequiredFieldValidator ID="text_lastname_req" runat="server" ErrorMessage="Please, inform your last name."
                                            ControlToValidate="text_lastname" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label3" Text="Enrollment Date:" CssClass="col-md-4 control-label" />
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="text_enrollment_date" TextMode="Date" CssClass="form-control" Text="" />
                                        <asp:RequiredFieldValidator ID="text_enrollment_date_req" runat="server" ErrorMessage="Please, inform the enrollment date." ControlToValidate="text_enrollment_date" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                                        <asp:RangeValidator ID="text_enrollment_date_rag" runat="server" Type="Date" ControlToValidate="text_enrollment_date" MinimumValue="1/1/2016" MaximumValue="12/31/2016" ErrorMessage="Don't use date outside 2016. " Display="Dynamic" />
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="saveStudent" OnClick="updateStudentOnClick" Text="Save" CssClass="btn btn-default" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row button-row">
                <asp:Button runat="server" ID="deleteStudent" Text="Delete" CssClass="btn btn-danger" />
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editStudent">Edit Student</button>
            </div>
        </div>
        <div class="row list-grid">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AllowSorting="True" Caption="Courses" AllowCustomPaging="False" AllowPaging="True" HorizontalAlign="Center" Width="100%" BorderColor="#CCCCCC"></asp:GridView>
        </div>
    </div>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnAssign03 %>"
        SelectCommand="
                SELECT CRS.[CourseID], [Title], [Credits], [DepartmentID] FROM [Courses] as CRS
                JOIN [Enrollments] as ERL
                ON CRS.CourseID = ERL.CourseID
                JOIN [Students] as STD
                ON ERL.StudentID = STD.StudentID
                WHERE STD.[StudentID] = @StudentID
                ">

        <SelectParameters>
            <asp:ControlParameter ControlID="InfoID" PropertyName="Text" Name="StudentID" Type="Int32" DefaultValue="-1" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnAssign03 %>"
        ProviderName="<%$ ConnectionStrings:ConnAssign03.ProviderName %>"
        DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @StudentID"
        SelectCommand="SELECT [StudentID], [LastName], [FirstMidName], [EnrollmentDate] FROM [Students] WHERE [StudentID] = @StudentID"
        UpdateCommand="UPDATE [Students] SET [LastName] = @LastName, [FirstMidName] = @FirstMidName, [EnrollmentDate] = @EnrollmentDate WHERE [StudentID] = @StudentID">

        <SelectParameters>
            <asp:ControlParameter ControlID="InfoID" PropertyName="Text" Name="StudentID" Type="Int32" DefaultValue="-1" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="StudentID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstMidName" Type="String" />
            <asp:Parameter DbType="Date" Name="EnrollmentDate" />
            <asp:Parameter Name="StudentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
