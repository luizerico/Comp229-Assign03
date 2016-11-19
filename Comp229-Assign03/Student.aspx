<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Comp229_Assign03.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Student Details</h3>
    <div class="row student-detail">
        <asp:Literal ID="InfoID" runat="server" Visible="False"></asp:Literal>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row list">
                    <asp:Label ID="student_id" runat="server" Text="Student ID:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Literal ID="StudentID" runat="server" Text='<%# Eval("StudentID")%>'></asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="Label_LastName" runat="server" Text="Last Name:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Literal ID="Info_LastName" runat="server" Text='<%# Eval("LastName")%>'></asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="Label_FirstName" runat="server" Text="First Name:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Literal ID="Info_FirstName" runat="server" Text='<%# Eval("FirstMidName")%>'></asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="Label_Enrollment" runat="server" Text="Enrollment Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Literal ID="Info_Enrollment" runat="server" Text='<%# Eval("EnrollmentDate")%>' />
                    </div>
                </div>

           
           
            </ItemTemplate>
        </asp:Repeater>
        <div class="row">
            <asp:Button runat="server" ID="saveStudent" Text="Save"  CssClass="btn btn-default" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Edit</button>
        </div>
    </div>
    <div class="row list-grid">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AllowSorting="True" Caption="Courses" AllowCustomPaging="False" AllowPaging="True" HorizontalAlign="Center" Width="100%" BorderColor="#CCCCCC"></asp:GridView>
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
