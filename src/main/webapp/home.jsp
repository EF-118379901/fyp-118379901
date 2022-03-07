<%@page import="service.UserService"%>
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
    <link href="css/home.css" rel="stylesheet">
    <style>
        .popup .overlay {
  position:fixed;
  top:0px;
  left:0px;
  width:100vw;
  height:100vh;
  background:rgba(0,0,0,0.7);
  z-index:1;
  display:none;
}

.popup .content {
  position:absolute;
  top:30%;
  left:50%;
  transform:translate(-50%,-50%) scale(0);
  background:#fff;
  width:580px;
  height:330px;
  z-index:2;
  text-align:center;
  padding:20px;
  box-sizing:border-box;
  font-family:Helvetica, sans-serif;
}

.popup .close-btn {
  cursor:pointer;
  position:absolute;
  right:10px;
  top:20px;
  width:30px;
  height:30px;
  background:#222;
  color:#fff;
  font-size:25px;
  font-weight:600;
  line-height:30px;
  text-align:center;
  border-radius:50%;
}

.popup.active .overlay {
  display:block;
}

.popup.active .content {
  transition:all 300ms ease-in-out;
  transform:translate(-50%,-50%) scale(1);
}

.button {
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  padding:15px;
  font-size:18px;
  border:2px solid #222;
  color:#222;
  text-transform:uppercase;
  font-weight:600;
  background:#fff;
}

dropdown-list{
     width: 700px !important;
    height: 400px !important;
}

.dropdown-menu {
    width: 700px !important;
    height: 400px !important;
}

.dropdown-item{
       width: 700px !important;
       
}
.dropdown-header{
    width: 700px !important;
    
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
String query = "select * from weekly_details where date =(select max(date) from weekly_details where name='" + name + "')" ;
PreparedStatement pst = conn.prepareStatement(query);
ResultSet rs = pst.executeQuery(query);
if(rs.next()){ 
%>
<input type="hidden" name="lastDate" id="txtLastDate" value="<%=rs.getString("date")%>">
<%
            } } catch(Exception e){}
        %>
        
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
<input type="hidden" name="lastWeek" id="txtLastWeek" value="<%=rs.getString("week_number")%>">
<%
            } } catch(Exception e){}
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
                <a class="nav-link" style=" margin-left:10px;color:#05386B; font-family:Helvetica, sans-serif;" id="popup-1" onclick="togglePopup()" >
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
                <a class="nav-link" style="margin-left: 10px; color: #05386B; font-family:Helvetica, sans-serif;" href="start_program.jsp">
                    <i class="fas fa-fw fa-calendar"></i>
                    <span>Start New Program</span>
                </a>
                
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item1">
                <a class="nav-link" style="margin-left: 10px; color:#05386B ; font-family:Helvetica, sans-serif;" href="current_program.jsp">
                    <i class="fas fa-fw fa-search"></i>                 
                    <span>View Insights</span>
                    <span class="sr-only">(current)</span>
                </a>             
            </li>
            
            
           

            

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

       

            <!-- Sidebar Toggler (Sidebar) -->
           
           

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

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#0" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-mail-bulk fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter"></span>
                            </a>
            
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu  dropdown-menu-right shadow animated--grow-in"
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
            <a class="nav-link" href="UserHandler?action=listUser">Logout</a>
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
<div class="popup" id="popup-2">
  <div class="overlay"></div>
  <div class="content">
    <div class="close-btn" onclick="togglePopup()">&times;</div>
    <h1>Welcome to Waste to Wallet</h1>
    <p>This is a service intended to help you reduce your food waste</p>
    <p>Every week, you'll add your details to this page</p>
    <p>We'll then give you a spending target for the week as well as some recommendations that will help you reach this target! </p>
    <p>These targets will work you towards your set plan </p>
    <p>If you wish to take a deeper dive into your programme so far, click on insights to see graphical breakdowns of your progress </p>
  </div>
</div>
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
                        <h1 class="h3 mb-0 text" style="color:#05386B; font-family:Helvetica, sans-serif; padding-left: 20px;">Welcome ${SKUSER.name}. Your planned grocery spending is €<b><input type="text" style="color:#05386B; font-family:Helvetica, sans-serif" name="plan_measurement" id="txtPlan" readonly value="<%=rs.getString("plan_measurement")%>"></b></h1>
                     <div>
        <hr width ="95%" size="20" color="#05386B">
    </div>
                     
                        <%
}
}
catch(Exception e){}
%>
                         
                    </div>
                    <br>

 <form method="POST" action='DetailsServlet' name="frmDetailsServlet" onsubmit="return giveReasons();"><input type="hidden" name="action"  />
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4" style="padding-left: 35px;">

                            <!-- Project Card Example -->
                            <div class="card shadow-lg mb-3" style="height: 340px; width: 100%; color: #69BC69; font-family:Helvetica, sans-serif;" >
                                <div class="card-header py-3" >
                                    <h6 class="m-0 font-weight-bold text" style="color: #05386B; font-family:Helvetica, sans-serif;">Enter this week's details here:</h6>
                                </div>
                                <br>
                                    <div class="form-text text-muted">
                                         <div class="h5 mb-0 font-weight-bold text-gray-800" style="padding-left: 20px; padding-right: 20px; color: #05386B; font-family:Helvetica, sans-serif;"><input type="text" class="form-control" placeholder="Cost of food (€)" name="food_price" id="txtFoodPrice" /></div> 
                                    </div>
                                
                                <br>
                                    
                                    <div class="form-text text-muted">
                                         <div class="h5 mb-0 font-weight-bold text-gray-800" style="padding-left: 20px; padding-right: 20px; color: #05386B; font-family:Helvetica, sans-serif;"><input type="text" class="form-control" placeholder="Waste Measurement (Kg's)" name="waste_measurement" id="txtWasteMeasurement" /></div> 
                                    </div>
                                
                                <br>
                                    <div class="form-text text-muted">
                                         <div class="h5 mb-0 font-weight-bold text-gray-800" style="padding-left: 20px; padding-right: 20px; color: #05386B; font-family:Helvetica, sans-serif;"><input type="date" class="form-control" name="date" id="txtDate" /></div> 
                                         
                                    </div>
                                <br>
                                
                                <div>
                                 <button class="btn btn-lg btn-success btn-block" style="height:50px; width:285px; margin-left:20px;  background-color:#8EE4AF; color:#05386B; font-family:Helvetica, sans-serif;" type="submit">Submit this week's details</button>
                                </div>
                                <br>
                                </div>
                     
                        </div>
                                <br>
                                
                                <div>
                     <input type="hidden" name="id" value="${SKUSER.id}" />                          
                     <input type="hidden" name="name" value="${SKUSER.name}" />
                     <input type="hidden" name="recommendation1" id="recommendation1" />
                     <input type="hidden" name="recommendation2" id="recommendation2" />
                     <input type="hidden" name="recommendation3" id="recommendation3" />
                     <input type="hidden" name="motivation" id="txtMotivation" value="${SKUSER.motivation}" />
                     <input type="hidden" name="week_number" id="txtWeekNumber" />                   
                     </div>
                   
                     <br>
                           
                    
                     <br>
                     
                   <div class="col-lg-6 mb-4" >

                            <!-- Project Card Example -->
                            <div class="card shadow-lg mb-3" style="height: 330px; width: 100%;" >
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text" style="color: #05386B; font-family:Helvetica, sans-serif;">Your plan and target:</h6>
                                </div>
                                <br>
                                    <div class="form-text text-muted">
                                         <div class="h5 mb-0 font-weight-bold text-gray-800" style="padding-left: 20px; padding-right: 20px; font-family:Helvetica, sans-serif;"><input type="text" class="form-control" placeholder="Target" name="target_value2" id="txtTarget" readonly/></div> 
                                    </div>          
                                <br>
                                
                          
 </form>
                             <form method="POST" action='DetailsServlet' name="frmDetailsServlet" ><input type="hidden" name="action"  />
                                <select class="form-control hide" name="reasons" style="margin-left: 20px;" id="textInput" >
  <option id="time" value="time">Not enough time to focus on programme</option>
  <option id="low" value="low">Target too low</option>
  <option id="special" value="special">Special circumstances this week</option>
  <option id="all" value ="all">All of the above</option>
</select>
                                 
                                 <input type="hidden" name="food_price" id="txtHiddenFoodPrice" />
                                 <input type="hidden" name="waste_measurement" id="txtHiddenWasteMeasurement" />
                                 <input type="hidden" name="target_value2" id="txtHiddenTarget" />
                                 <input type="hidden" name="week_number"  id="txtHiddenWeek"/>
                                 <input type="hidden" name="date"  id="txtHiddenDate"/>
                                 <input type="hidden" name="id" value="${SKUSER.id}" />                          
                                 <input type="hidden" name="name" value="${SKUSER.name}" />                               
                                 <input type="hidden" name="recommendation1" id="2ndrecommendation1" />
                                 <input type="hidden" name="recommendation2" id="2ndrecommendation2" />
                                 <input type="hidden" name="recommendation3" id="2ndrecommendation3" />
                                 
                                <br> 
                                 <div>
                                 <button class="btn btn-lg btn-success btn-block hide" style="height:50px; width:285px; margin-left:20px; background-color:#73f480; color:#05386B; font-family:Helvetica, sans-serif;" id="btnReasons" onclick="submitReasons()" type="submit">Submit this week's details</button>
                                </div>
                                
</form>      
                                  
                            </div>
                        </div>
                    </div>
                </div>

                     <br>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7" style="padding-left: 35px;">
                            <div class="card shadow mb-4" style="height: 490px; width: 120%; margin-left:20px;" id="down">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary" style="color:#05386B; font-family:Helvetica, sans-serif;">Current Progress:</h6>
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
                    <h2 class="h3 mb-0 text" style="color:#05386B; font-family:Helvetica, sans-serif; padding-left:20px;" >This week's target spend was € <input type="text" style="color:#05386B; font-family:Helvetica, sans-serif;" name="lastTarget" id="txtLastTarget" value="<%=rs.getString("target_value")%>"></h2>
        <%
            }   }
        catch(Exception e){
}   %>                 

<script type="text/javascript">

//If datapoints have been made by the previous scriptlet, a line graph is made of these datapoints
window.onload = function() {
    var plan = document.getElementById("txtPlan").value;
    if(plan === null){
    document.location = "start_program.jsp";
}

            
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

<script>
    var prev_handler = window.onload;
window.onload = function () {
    if (prev_handler) {
        prev_handler();
    }
    
            var recommendation1 = document.getElementById("txtGroRec").value;    
            var recommendation2 = document.getElementById("txtWasteRec").value;
            var recommendation3 = document.getElementById("txtUserRec").value;
            var output1;
            var output2;
            var output3;
       
       
        if (recommendation1 === 'stock'){
            output1 = "Check your stock before going shopping";
        }
        else if (recommendation1 === 'list'){
            output1 = "Make a grocery list before going shopping";
        }
         else if (recommendation1 === 'freezer'){
            output1 = "Invest in a freezer to keep food longer";
        }
         else if (recommendation1 === 'substitute'){
            output1 = "Try a cheaper good instead of your usual";
        }
        else {
            output1 = "Consider a compost bin";
        }
        
        
        if (recommendation2 === 'organic'){
            output2 = "Try organic food";
        }
        else if (recommendation2 === 'cheaper'){
            output2 = "Most food has cheaper versions";
        }
        
         if (recommendation3 === 'assess'){
            output3 = "Your food purchases are much too high";
        }
        else if (recommendation3 === 'well'){
            output3 = "You're doing well";
        }
        
         document.getElementById("txtDisplayRec1").value = output1;
         document.getElementById("txtDisplayRec2").value = output2;
         document.getElementById("txtDisplayRec3").value = output3;
        
    };
    
   
            
          
         
    </script>
    
   


<br>
<br>
<br>
<script type="text/javascript">
   //This function occurs when the button to submit details is clicked
   //If the user has met their target the calculate_target function occurs
   //If the user has not met their target, a listbox and another button appear
   
    function  giveReasons(){
        
        var foodPrice = parseFloat(document.getElementById("txtFoodPrice").value);
        var lastTarget = parseFloat(document.getElementById("txtLastTarget").value);
            
        if(lastTarget < foodPrice) {
            document.getElementById('textInput').className="show";
            document.getElementById('btnReasons').className="show";
            return false;
        }
        else{
                calculate_target();
              
            }
        }

    </script>
    
    <script type="text/javascript">
        
        function submitReasons(){
            
            const _MS_PER_DAY = 1000 * 60 * 60 * 24;
  
 function dateDiffInDays(a, b) {
 const utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
  const utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

  return Math.floor((utc2 - utc1) / _MS_PER_DAY);
 }

const a = new Date(document.getElementById("txtLastDate").value),
    b = new Date(document.getElementById("txtDate").value),
    difference = dateDiffInDays(a, b);
            //sets two variables for food price and the target from last week
            //They are  both equal to the textboxes that will contain this information
            //set variables for each of the listbox items

            var foodPrice = parseFloat(document.getElementById("txtFoodPrice").value);
            var lastTarget = parseFloat(document.getElementById("txtLastTarget").value); 
            
            //maps the values of these two fields to hidden textboxes in another form
            var wasteMeasurement = parseFloat(document.getElementById("txtWasteMeasurement").value);
            var date = parseDate(document.getElementById("txtDate").value);
            var lastWeekNumber = document.getElementById("txtLastWeek").value;
            var weekNumber;
            
            var s = document.getElementById("textInput");
            var reason = s.options[s.selectedIndex].value;
            
            var x;
            
           //if statement to change value of 'reason' 
           //depending on the selected listbox item, 'reason' will be equal to one of previously stated variables
           //'reason' will be added to the target
            
            if (reason === 'time'){
                x = 1;
            }
            else if(reason === 'low'){
                x = 2;
            }
            
            else if (reason === 'special') {
                x = 0;
            }
            else{
                x = 3;
            }
            
            if(difference <=5){                 
           // Calculation to re-adjust target depending on performance
        
            var target1 = lastTarget + foodPrice; 
            var target2 = target1 /2;
            var target3 = lastTarget / 11;
            var target4 = target2 - target3;
            var target = target4 + x;
            
         if (lastWeekNumber === null){
             weekNumber === 1;
         } else {
             weekNumber === lastWeekNumber + 1;
         }
            }
         else {
            alert("Please wait at least 5 days before logging your food groceries");
            return false;
        }  
    

            //Fills the target textbox with the calculated target
            
            document.getElementById("txtTarget").value = target;
            document.getElementById("txtHiddenDate").value = date;
            document.getElementById("txtHiddenTarget").value = target;
            document.getElementById("txtHiddenFoodPrice").value = foodPrice;
            document.getElementById("txtHiddenWasteMeasurement" ).value = wasteMeasurement;
            document.getElementById("txtHiddenWeek").value = weekNumber;            
            
           setRecommendations();
        }        
        </script>
    
<script type="text/javascript">
 function calculate_target() {
     
  const _MS_PER_DAY = 1000 * 60 * 60 * 24;
  
 function dateDiffInDays(a, b) {
 const utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
  const utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

  return Math.floor((utc2 - utc1) / _MS_PER_DAY);
 }

const a = new Date(document.getElementById("txtLastDate").value),
    b = new Date(document.getElementById("txtDate").value),
    difference = dateDiffInDays(a, b);
            //sets two variables for food price and the target from last week
            //They are  both equal to the textboxes that will contain this information

            var foodPrice = parseFloat(document.getElementById("txtFoodPrice").value);
            var lastTarget = parseFloat(document.getElementById("txtLastTarget").value);
          
            //sets the last week, which can be increased by 1 for this week
            //sets the last date to check against the current date
            
            var lastWeekNumber = parseFloat(document.getElementById("txtLastWeek").value);
            var weekNumber;
            
            
           
            
            if(difference >= 5){                            
           // Calculation to re-adjust target depending on performance
        
            var target1 = lastTarget + foodPrice; 
            var target2 = target1 /2;
            var target3 = lastTarget / 11;
            var target = target2 - target3;
         
         if (lastWeekNumber === null){
             weekNumber = 1;
         } else {
             weekNumber = lastWeekNumber + 1;
         }
        }
        else {
            alert("Please wait at least 5 days before logging your food groceries");
            return false;
        }
        
            document.getElementById("txtWeekNumber").value = weekNumber;
            
             //Fills the target textbox with the calculated target
            document.getElementById("txtTarget").value = target;
            setRecommendations();
        
    } 
    
   </script>
   
   <script>
       function setRecommendations(){
          var target = parseFloat(document.getElementById("txtLastTarget").value);
          var foodPrice = parseFloat(document.getElementById("txtFoodPrice").value);
          var difference = target - foodPrice;
          var recommendation1;
          var recommendation2;
          var recommendation3;
          var wasteMeasurement = document.getElementById("txtWasteMeasurement").value;
          var motivation  = document.getElementById("txtMotivation").value ;
          
       
         
          
          
          if ( difference > 5){
                recommendation1 = "stock";
            }
            
          else if (difference <= 5 && difference > 4){
              recommendation1 = "list";
          }
          else if (difference <=4 && difference > 3) {
              recommendation1 = "freezer";
          }
          else if (difference <=3 && difference > 2) {
              recommendation1 = "substitute";
          }
              else {
                  recommendation1 = "none";
              }
          
          
          if ( motivation === 'Environmental' ){
                recommendation2 = "organic";
            }
          else if (motivation === 'Money'){
              recommendation2 = "cheaper";
          }
          
          if (wasteMeasurement >= 9){
              recommendation3 = "assess";
          }
          else if (wasteMeasurement < 9) {
              recommendation3 = "well";
          }
            
           document.getElementById("recommendation1").value = recommendation1;
          document.getElementById("2ndrecommendation1").value = recommendation1;
          document.getElementById("recommendation2").value = recommendation2;
          document.getElementById("2ndrecommendation2").value = recommendation2;
          document.getElementById("recommendation3").value = recommendation3;
          document.getElementById("2ndrecommendation3").value = recommendation3;
       }
   </script>
   
  


<div id="chartContainer" style="height: 390px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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
                       
<script>
    function togglePopup(){
  document.getElementById("popup-2").classList.toggle("active");
}

</script>

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
    
    <script src="js/jquery-2.1.1.js"></script>
<script src="js/jquery.menu-aim.js"></script> <!-- menu aim -->
<script src="js/main_1.js"></script> <!-- Resource jQuery -->

</body>
</html>