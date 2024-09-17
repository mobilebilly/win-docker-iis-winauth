<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AD User Name</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Current User Information</h2>
            <p>User Name: <% = System.Web.HttpContext.Current.User.Identity.Name %></p>
        </div>
    </form>
</body>
</html>