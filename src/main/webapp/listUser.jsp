<%@page import="java.sql.DriverManager"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All User</title>
</head>
<body>
<%
//UserBean user = new UserBean();
UserDao dao = new UserDao();
List<User> userList = dao.getAllUsers();
//Iterator<UserBean> itr = userList.iterator();
%>
<table border="1">
<tr>

<th>Select the user info you wish to view</th>

</tr>
<tr>
<%
/*while(itr.hasNext())
{
System.out.println(user.getId());*/
for (User user : userList) {
%>

<td onclick="moveName(this.cellIndex, this.textContent.trim())"><%=user.getName()%></td>


</tr>

<%
}
//}
%>
</table>
<%
    
//This scriptlet creates an arraylist to add to the graph
//The graph will be populated by datapoints that are set to null to start
//A connection is made with the database
//The name value of the session key is retrieved and set equal to a variable called 'name'
//This 'name' variable is then used in the 'WHERE' clause of an sql statement
//The result of this query is mapped to the arraylist


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;

Gson gsonObj2 = new Gson();
Map<Object,Object> map2 = null;
List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
String dataPoints2 = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
	Statement statement = connection.createStatement();
	String xVal, yVal, xVal2, yVal2;
        
        String name=(String)session.getAttribute("currentUser"); 
        String user = request.getParameter("user");
        ResultSet resultSet = statement.executeQuery("select * from weekly_details, targets where weekly_details.name='" + user + "' and targets.name='" + name + "'");
        
	
	while(resultSet.next()){
		xVal = resultSet.getString("weekly_details.week_number");
		yVal = resultSet.getString("weekly_details.food_price");
                xVal2 = resultSet.getString("targets.week_number");
                yVal2 = resultSet.getString("targets.target_value");
		map = new HashMap<Object,Object>();map.put("x", Double.parseDouble(xVal)); map.put("y", Double.parseDouble(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
                map2 = new HashMap<Object,Object>(); map2.put("x", Double.parseDouble(xVal2)); map2.put("y", Double.parseDouble(yVal2)); list2.add(map2);
		dataPoints2 = gsonObj2.toJson(list2);
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
        dataPoints2 = null;
}
%>
<br>
<br>
<form name="user">
    <input id="teste0" type="text">
 
</form>

  <script>
    function moveName(index, name){
        document.getElementById("user" + index).value  = name;
    }
</script>
<script type="text/javascript">

//If datapoints have been made by the previous scriptlet, a line graph is made of these datapoints
window.onload = function() { 
         
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: ""
	},
	data: [{
		type: "line", color: "rgba(83, 223, 128, .6)", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints);%>},
            {type: "line", color: "rgba(245, 40, 145, 0.8)", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints2);%>
	}]
});
chart.render();
<% } %> 
 
};
</script>


</body>
</html>
