
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.Details"%>
<%@ page import="dao.DetailsDao"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Weekly Details</title>
</head>
<body>
<%
//UserBean user = new UserBean();
DetailsDao dao = new DetailsDao();
List<Details> detailsList = dao.getAllDetails();
//Iterator<UserBean> itr = userList.iterator();
%>
<table border="1">
<tr>
<th>Id</th>
<th>Price</th>
<th>Weight</th>
<th>Week</th>
</tr>
<tr>
<%

for (Details details : detailsList) {
%>
<td><%=details.getId()%></td>
<td><%=details.getPrice()%></td>
<td><%=details.getWeight()%></td>
<td><%=details.getWeekId()%></td>

</tr>
<%
}
//}
%>
</table>
<p><a href="DetailsServlet?action=insert">Add Details</a></p>
</body>
</html>