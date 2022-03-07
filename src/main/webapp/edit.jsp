<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User</title>
</head>
<body>
<form method="POST" action='UserHandler' name="frmAddUser"><input
type="hidden" name="action" value="insert" />
<p><b>Add New Record</b></p>
<table>
<tr>
<td>User ID</td>
<td><input type="text" name="id" /></td>
</tr>
<tr>
<td>Name</td>
<td><input type="text" name="name" /></td>
</tr>
<tr>
<td>Motivation</td>
<td><input type="text" name="motivation" /></td>
</tr>
<tr>
<td>Goal</td>
<td><input type="text" name="goal" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Submit" /></td>
</tr>
</table>
</form>
<p><a href="UserHandler?action=listUser">View-All-Records</a></p>
</body>
</html>