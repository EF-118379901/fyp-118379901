<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    
   <link href="css/signin.css" rel="stylesheet">
    
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">



 
    <style>
        
        body { 
         background-image: url('img/Border_Left.png'), url('img/Border_Right.png');
         background-repeat: no-repeat, no-repeat;
         background-attachment: fixed, fixed;
         background-position: left center, right center; 
         text-align: center;
        
         footer{
             position: relative;
             right: 0;
             bottom:0;
             left:0;
                 
         }
        
/*Navbar colour change code got from Medium.com- Bootstrap 4 Navbar Examples*/
        navbar-custom {
        background-color: #21bf76;
        }

/* change the brand and text color */
.navbar-custom .navbar-brand,
.navbar-custom .navbar-text {
    color: rgba(255,255,255,.8);
}

/* change the link color */
.navbar-custom .navbar-nav .nav-link {
    color: rgba(255,255,255,.5);
}

/* change the color of active or hovered links */
.navbar-custom .nav-item.active .nav-link,
.navbar-custom .nav-item:hover .nav-link {
    color: #ffffff;
}
#frmAddUser {
    width:90%;
    background-color: #bdd2ff;
    border: 1px solid white;
    margin: 50px auto 0;
    padding: 1em;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    text-align: center;
}
        }
 
    </style>
    <!-- Custom styles for this template -->
  
  </head>
  
  <body>
        
       <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Waste to Wallet</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp"></a>
            <span class="sr-only">(current)</span>
          </li>
         
           <li class="nav-item">
            <a class="nav-link" href="signup.jsp"></a>
          </li> 
      </div>
    </div>
  </nav>
      
 
      
<!--      <br/>-->
<div class="container">
        
<form class="form-signin" method="POST" action='UserHandler' name="frmAddUser"><input
type="hidden" name="action" value="insert" />
<table>
<tr>
<!--<td>User ID</td>-->
<td><input type="text" class="form-control" placeholder="User ID"name="id" /></td>
</tr>
<tr>
<!--<td>Name</td>-->
<td><input type="text" class="form-control" placeholder="Username" name="name" /></td>
</tr>
<tr>
<!--<td>Motivation</td>-->
<td><input type="text" class="form-control" placeholder="Motivation" name="motivation" /></td>
</tr>
<tr>
<!--<td>Goal</td> -->
<td><input type="text" class="form-control" placeholder="Savings Goal" name="goal" /></td>
</tr>
<tr>
<!--<td>Password</td> -->
<td><input type="text" class="form-control" placeholder="Password" name="password" /></td>
</tr>
<tr>

<!--<td><input type="submit" value="Sign-Up" /></td> -->
<td><button class="btn btn-lg btn-warning btn-block" input type="submit">Sign-Up</button></td>
</tr>
</table>
</form>
    <p><a href="UserHandler?action=listUsers"></a></p>
    </div>
</div
  
  
        
 

<!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--<script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script> -->
    </body>
    
</html>
