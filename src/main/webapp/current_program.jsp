
<%@page import="dbconnection.IConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.Plans"%>
<%@page import="model.Details"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%@ page session="true" %>

<%
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
    
        ResultSet resultSet = statement.executeQuery("select * from weekly_details, targets where weekly_details.name='" + name + "' and targets.name='" + name + "'");
        
	
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

<%
Gson gsonObj3 = new Gson();
Map<Object,Object> map3 = null;
List<Map<Object,Object>> list3 = new ArrayList<Map<Object,Object>>();
String dataPoints3 = null;

Gson gsonObj4 = new Gson();
Map<Object,Object> map4 = null;
List<Map<Object,Object>> list4 = new ArrayList<Map<Object,Object>>();
String dataPoints4 = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
	Statement statement = connection.createStatement();
	String xVal, yVal, xVal2, yVal2;
        
        String name=(String)session.getAttribute("currentUser"); 
    
        ResultSet resultSet = statement.executeQuery("select * from weekly_details where weekly_details.name='" + name + "'");
        
	
	while(resultSet.next()){
		xVal = resultSet.getString("weekly_details.week_number");
		yVal = resultSet.getString("weekly_details.food_price");
                xVal2 = resultSet.getString("weekly_details.week_number");
                yVal2 = resultSet.getString("weekly_details.waste_measuremement");
		map3 = new HashMap<Object,Object>();map3.put("x", Double.parseDouble(xVal)); map3.put("y", Double.parseDouble(yVal)); list3.add(map3);
		dataPoints3 = gsonObj3.toJson(list3);
                map4 = new HashMap<Object,Object>(); map4.put("x", Double.parseDouble(xVal2)); map4.put("y", Double.parseDouble(yVal2)); list4.add(map4);
		dataPoints4 = gsonObj4.toJson(list4);
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints3 = null;
        dataPoints4 = null;
}
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Food Waste Reducer (FWR)</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
   <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <style>
        input {
            border:none;
            background: transparent;
            outline: none;
        }
        
.hide{
  display:none;
}
.show{
  display:block;
}

.box{

border: 5px #f52891 ;

width: 20px;

height: 20px;

background-color: #f52891;

opacity: 0.8;

}

.box2{

border: 5px #f52891 ;

width: 20px;

height: 20px;

background-color: #53df80;


}

.float-container {
  
    padding: 20px;
    margin-left:20px
}

.float-child {
    width: 25%;
    height: 18px;
    float: left;
    padding: 20px;
    margin-left: 20px;
   
}  
.nav-item1{
                display: block;
                
                font-size: 13px;
                position: relative;
                display:flex;
                align-items:center;              
               
                transition: all 300ms cubic-bezier(0.075,0.82, 0.165, 1);
                
            }
            
            .nav-item1:hover {
                
  transform: scale(1.2);
  text-shadow: none;
  padding-left:7px
}

dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in{
    z-index: 1;
    position:relative;
}
container-fluid{
      z-index: 0;
    position:relative;
}

.footer{
position:absolute;
bottom:0;
}

 html {
  scroll-behavior: smooth;
 }
 
 a {
  text-decoration: none;
  color: black;
 } 
 
 #down {
  margin-top: 100%;
  padding-bottom: 25%;
 } 

 .dropdown-list{
     height:250px;
     width:600px;
 }
 .dropdown-menu{
     height:250px;
     width:600px
 }
 .dropdown-header{
     height:35px;
     width:600px;
 }
 
 .badge badge-danger badge-counter{
     height:15px;
     width:20px;
     margin-right:40px;
 }
 
       .highcharts-figure,
.highcharts-data-table table {
    min-width: 320px;
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

input[type="number"] {
    min-width: 50px;
}
    </style>
</head>

<body id="page-top">
      <%

try {
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
String name=(String)session.getAttribute("currentUser"); 
String query = "select * from recommendations where rec_id =(select max(rec_id) from recommendations where name='" + name +"') ";
PreparedStatement pst = conn.prepareStatement(query);
ResultSet rs = pst.executeQuery(query);

if(rs.next()){ 
%>
<input type="hidden" name="hiddenGroceryRecommendation" id="txtGroRec" value="<%=rs.getString("recommendation1")%>">
<input type="hidden" name="hiddenWasteRecommendation" id="txtWasteRec" value="<%=rs.getString("recommendation2")%>">
<input type="hidden" name="hiddenUserRecommendation" id="txtUserRec" value="<%=rs.getString("recommendation3")%>">
<%
            }
            }
        catch(Exception e){

}

        %>
        
 <%

try {
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
String name=(String)session.getAttribute("currentUser"); 
String query = "select * from plans where name='" + name + "'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>                  
                        <input type="hidden"  name="plan_measurement" id="txtPlan" value="<%=rs.getString("plan_measurement")%>"> 
                        <%
}
}
catch(Exception e){}
%>

   <%

//This scriptlet runs a SQL query on the targets table 
//It returns only those users whose name is the same as the session key
//This result is then outputted in text format for the user to see


try {
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
String name=(String)session.getAttribute("currentUser"); 
String query = "select * from weekly_details where week_id =(select max(week_id) from weekly_details where name='" + name + "') ";
PreparedStatement pst = conn.prepareStatement(query);
ResultSet rs = pst.executeQuery(query);

if(rs.next()){ 
%>
                    <!-- Page Heading -->
                    
                  <input type="hidden" name="foodPrice" id="txtFoodPrice" value="<%=rs.getString("food_price")%>">
        <%
            }
            }
        catch(Exception e){

}

        %>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient sidebar accordion" style="background-color: #FAFAEB; color:#05386B; font-family:Helvetica, sans-serif;" id="navbarResponsive">
           
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center">
                <div class="sidebar-brand-icon ">
                   <!-- <i class="fas fa-laugh-wink"></i> -->
                    <img src="img/Waste_To_Wallet.png" alt="Logo" style="height:95%; width:95%">
                </div>
<!--                <div class="sidebar-brand-text mx-3" style="background-color:#8EE4AF; color:#05386B; font-family:Helvetica, sans-serif;">Waste <sup>To</sup> Wallet</div>-->
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item1 active">
                <a class="nav-link" style=" margin-left:10px;color:#05386B; font-family:Helvetica, sans-serif;" id="popup-1"  href="" >
                    <i class="fas fa-fw fa-smile"></i>
                    <span>Welcome</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="padding-left:10px">
                <b>Programmes</b>
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item1" >
                <a class="nav-link" style="margin-left: 10px; color: #05386B; font-family:Helvetica, sans-serif;" href="home.jsp">
                    <i class="fas fa-fw fa-calendar"></i>
                    <span>Home</span>
                </a>
                
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
           
           

            

            <!-- Nav Item - Pages Collapse Menu -->
<!--            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

             Nav Item - Charts 
            <li class="nav-item">
                <a class="nav-link" href="test.jsp">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Test</span></a>
            </li>

             Nav Item - Tables 
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>-->

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" >

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto" >

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                                            <%
try {
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
String name=(String)session.getAttribute("currentUser"); 
String query = "select * from weekly_details where week_number =(select max(week_number) from weekly_details where name='" + name + "') ";
PreparedStatement pst = conn.prepareStatement(query);
ResultSet rs = pst.executeQuery(query);
if(rs.next()){ 
%>


      
                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter" style="color:white;">Week <%=rs.getString("week_number")%></span>
                            </a>
                            <%
            } } catch(Exception e){}
        %>
 
                    <!-- Page Heading -->
                    



      
                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-mail-bulk fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter"></span>
                            </a>
            
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                             
                                <h6 class="dropdown-header">
                                    Recommendations
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
 
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate"><input type="text" name="GroceryRecommendation" id="txtDisplayRec1"></div>
                                        <div class="small text-gray-500">Based on this week's grocery cost</div>
                                    </div>
          
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate"><input type="text" name="WasteRecommendation" id="txtDisplayRec2"></div>
                                        <div class="small text-gray-500">Based on the weight of your waste</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate"><input type="text" name="UserRecommendation" id="txtDisplayRec3"></div>
                                        <div class="small text-gray-500">Because your motivation is ${SKUSER.motivation}</div>
                                    </div>
                                </a>
                                      
<!--                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog Â· 2w</div>
                                    </div>
                                </a>-->
<!--                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>-->
                            </div>
                        </li>

                        <li class="nav-item dropdown no-arrow">
            <div class="container">
                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active" style="color:#cdb599 ; font-family:Helvetica, sans-serif;">
                            <c:if test="${empty SKUSER.name}">
                                <a class="nav-link" href="./login.jsp">Login
                                    <span class="sr-only">(current)</span>
                                </a>
                            </c:if>
                            <c:if test="${not empty SKUSER.name}">
                                <a class="nav-link" href="./login.jsp">${SKUSER.name}
                                    <span class="sr-only">(current)</span>
                                </a>
                            </c:if>
                             

                        </li>
                        
                        <li class="nav-item">
            <a class="nav-link" href="/logout">Logout</a>
          </li> 

                    </ul>
                </div>
            </div>
                        </nav>
            </div>
                    
<!--                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">-->
                            
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                     
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
<%

//This scriptlet runs a SQL query on the plans table 
//It returns only those users whose name is the same as the session key
//This result is then outputted in text format for the user to see
try {
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
String name=(String)session.getAttribute("currentUser"); 
String query = "select * from plans where name='" + name + "'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>
                    <!-- Page Heading -->
                    <br>
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text" style="color:#05386B; font-family:Helvetica, sans-serif; padding-left: 20px;">Welcome ${SKUSER.name}. Your planned grocery spending is â¬<b><input type="text" style="color:#05386B; font-family:Helvetica, sans-serif" name="plan_measurement" id="txtPlan" readonly value="<%=rs.getString("plan_measurement")%>"></b></h1>
                     <div>
        <hr width ="95%" size="20" color="#05386B">
    </div>
                     
                        <%
}
}
catch(Exception e){}
%>
                         
                    </div>
                   
                    </div>

                     <br>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4" style="height: 490px; width: 120%; margin-left:20px; ">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary" style="color:#05386B; font-family:Helvetica, sans-serif;">Current plan</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
<!--                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>-->
<br>
                          <%

//This scriptlet runs a SQL query on the targets table 
//It returns only those users whose name is the same as the session key
//This result is then outputted in text format for the user to see


try {
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/environment", "Eoin", "DbUser19");
String name=(String)session.getAttribute("currentUser"); 
String query = "select * from targets where target_id =(select max(target_id) from targets where name='" + name + "') ";
PreparedStatement pst = conn.prepareStatement(query);
ResultSet rs = pst.executeQuery(query);

if(rs.next()){ 
%>
                    <!-- Page Heading -->
                    
                    <h2 class="h3 mb-0 text-gray-800" style="color:#69BC69; margin-left:10px; font-family:Helvetica, sans-serif">This week's target spend was € <input type="text" name="lastTarget" id="txtLastTarget" value="<%=rs.getString("target_value")%>"></h2>
        <%
            }
            }
        catch(Exception e){
}
        %>
    
                    
                    
                    
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
         axisY: {
             gridThickness: 0,
    stripLines: [
      {
        value: 0,
        showOnTop: true,
        color: "gray",
        thickness: 2}],
        title: "Cost (€)"},
        legend: {
              horizontalAlign: "center", // "center" , "right"
       verticalAlign: "bottom",  // "top" , "bottom"
       fontSize: 15,
             cursor: "pointer",
            itemclick: function (e) {
                //console.log("legend click: " + e.dataPointIndex);
                //console.log(e);
                if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                    e.dataSeries.visible = false;
                } else {
                    e.dataSeries.visible = true;
                }

                e.chart.render();
            }    
     },
	data: [{
                axisYType: "primary",
		type: "line", color: "rgba(83, 223, 128, .6)", //change type to bar, line, area, pie, etc
                 showInLegend: true,
                legendText: "Food Price",
		dataPoints: <%out.print(dataPoints);%>},
            {type: "line", color: "rgba(245, 40, 145, 0.8)", //change type to bar, line, area, pie, etc
                showInLegend: true,
                legendText: "Targets",
		dataPoints: <%out.print(dataPoints2);%>
	}]
});
chart.render();
<% } %> 
 
};
</script>


<div id="chartContainer" style="height: 390px; width: 100%;"></div>
 </div>
 <br>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4" style="height: 490px; width: 120%; margin-left:20px; ">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary" style="color:#05386B; font-family:Helvetica, sans-serif;">Current food waste reduction progress</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <figure class="highcharts-figure">
    <div id="container"></div>
    
</figure>
<script>
    var planTotal = document.getElementById("txtPlan").value;
    var price = document.getElementById("txtFoodPrice").value;
    var progress = planTotal / price;
    var remainingPlan = 1 - progress;
    
    Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: ''
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            }
        }
    },
    series: [{
        name: 'Current Progress',
        colorByPoint: true,
        data: [{
            name: '% Plan Remaining',
            y: remainingPlan,
            color:"rgba(245, 40, 145, 0.8)",
            sliced: true,
            selected: true
        }, {
            name: '% Plan Achieved',
            y: progress,
            color: "rgba(83, 223, 128, .6)" 
        }
       ]
    }]
});
</script>
                            </div>

    
    


<br>
<br>
<br>

   
  



<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<!--                         Pie Chart 
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                 Card Header - Dropdown 
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                 Card Body 
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>-->
                                    
                                </div>
                            </div>
                        </div>
                    </div>
 
                                
                     
                            </div>

                            <!-- Color System -->
                            
                             <br>   
                              <div class="row">

                            <div>
        <hr width ="95%" size="20" color="#05386B">
    </div>
                                      
<!--<footer class="py-5" style="background-color:transparent">
    <div class="container">
        <h4  style="padding-left: 20px; padding-right: 20px; color:#05386B; font-family:Helvetica,sans-serif;">Waste to Wallet ${currentYear}</h4> <p id="date" style="padding-left: 20px; padding-right: 20px; color:#05386B; font-family:Helvetica, sans-serif;">
 <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    </div>
                             
      
     /.container 
  </footer>-->
        </div>
                         
                   

                
            

    
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
   

  
  

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>