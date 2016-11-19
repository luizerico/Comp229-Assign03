<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Comp229_Assign03.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="ListDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnAssign03 %>" 
        SelectCommand="SELECT [StudentID], [LastName], [FirstMidName] FROM [Students] ORDER BY [StudentID]">
    </asp:SqlDataSource>
    <div class="row ">
        <p>
            <asp:Literal ID="student_inform" runat="server"></asp:Literal>
        </p>
        <ul class="students-list">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ListDataSource">
            <ItemTemplate>
                <li>
                    <%-- <asp:HyperLink id="hyperlink1" 
                      NavigateUrl="/Student.aspx?student_id=<%# Eval("StudentID")%>"
                      Text=<%# Eval("StudentID")%>
                      runat="server"/>
                    --%>    
                    <a href="/Student.aspx?student_id=<%# Eval("StudentID")%>" ><%# Eval("StudentID")%></a>
                    <%# Eval("StudentID")%> : <%# Eval("LastName")%>, <%# Eval("FirstMidName")%> 
                    <%-- <div class="student-controls">
                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-xs btn-warning"
                            Text="edit"
                            href="/Student.aspx"
                            runat="server" /> 
                        <asp:LinkButton ID="LinkButton2" CssClass="btn btn-xs btn-danger"
                            Text="delete"
                            href="/Student.aspx"
                            runat="server" />
                    </div> --%>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        <div style="text-align: center;">

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newStudent">Add New Student</button>
            <div id="newStudent" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Student Informations</h4>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <asp:Label runat="server" ID="label_firstname" Text="First Name:" CssClass="col-md-4 control-label required" />
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="text_firstname" placeholder="Your first name" ToolTip="Inform your first name" CssClass="form-control"  />
                                <asp:RequiredFieldValidator ID="text_firstname_req" runat="server" ErrorMessage="Please, inform your first name."
                                    ControlToValidate="text_firstname" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="label_lastname" Text="Last Name:" CssClass="col-md-4 control-label required" />
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="text_lastname" placeholder="Your last name" ToolTip="Inform your last name" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="text_lastname_req" runat="server" ErrorMessage="Please, inform your last name."
                                    ControlToValidate="text_lastname" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="label_enrollment" Text="Enrollment Date:" CssClass="col-md-4 control-label" />
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="text_enrollment_date" TextMode="Date" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="text_enrollment_date_req" runat="server" ErrorMessage="Please, inform the enrollment date." ControlToValidate="text_enrollment_date" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                                <asp:RangeValidator id="text_enrollment_date_rag" runat="server" Type="Date" ControlToValidate="text_enrollment_date" MinimumValue="1/1/2016" MaximumValue="12/31/2016" ErrorMessage="Don't use date outside 2016. " Display="Dynamic" />
                            </div>
                        </div>
                    </div>
                      
                  </div>
                  <div class="modal-footer">
                      <asp:Button runat="server" id="saveStudent" Text="Save"  onClick="saveStudentOnClick" cssClass="btn btn-default"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                </div>

              </div>
            </div>

        </div>
    </div>

</asp:Content>
