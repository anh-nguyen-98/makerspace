<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EngineeringSkillsManagement.aspx.cs" Inherits="Makerspace.EngineeringSkillsManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="True" DataKeyNames="id">
        <Columns>
            <asp:commandfield showdeletebutton="true" showeditbutton="true" />
           <%--<asp:commandfield showdeletebutton="true" showeditbutton="true" />--%>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:TemplateField HeaderText="Full Name" >
                <ItemTemplate>
                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("full_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="FullNameEditTextBox" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FullNameInsertTextBox" runat="server" ></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("first_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="FirstNameEditTextBox" runat="server" Text='<%# Bind("first_name") %>' Width="20px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FirstNameInsertTextBox" runat="server" ></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="EmailEditTextBox" runat="server" Text='<%# Bind("email") %>' Width="400px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="EmailInsertTextBox" runat="server" ></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
     
             <asp:TemplateField>
                        <FooterTemplate>
                             <asp:Button ID="InsertBtn" runat="server"  Text="insert" OnClick="InsertBtn_Click" />
                        </FooterTemplate>
                    </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MakerspaceDBConnectionString %>" DeleteCommand="Delete from Students where id=@id;"  SelectCommand="SELECT * FROM [Students] ORDER BY [email]" UpdateCommand="UPDATE Students SET email = @email, full_name = @full_name, first_name = @first_name where id = @id;">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email" />
            <asp:Parameter Name="first_name" />
            <asp:Parameter Name="full_name" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="email" />
            <asp:Parameter Name="full_name" />
            <asp:Parameter Name="first_name" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server">
    </asp:GridView>
</asp:Content>
