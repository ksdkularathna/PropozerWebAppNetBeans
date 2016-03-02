<%-- 
    Document   : login
    Created on : Aug 12, 2015, 11:32:28 AM
    Author     : Sampath Dhananjaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Backup Login</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

 
</head><!--/head-->

<body>
	<header id="header"><!--header-->
        <div id="header_top"></div>

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row" style="padding-bottom: 0; margin-bottom: 0">
                        <div class="col-sm-5" style="padding-bottom: 0; margin-bottom: 0">
                            <div class="logo pull-left" style="padding-bottom: 0; margin-bottom: 0">
                                <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                            </div>
                         </div>
                        <div class="col-sm-7">

                                    <div class="btn-group pull-left" >  <!--Sign up and login-->
                                        <!--
                                                <button onClick="replaceContentInContainer('target', 'replace_target')">Replace it</button>
                                                <div id="target">My content will be replaced</div>
                                                <div id="replacementss" style="display:none">
                                                    <span id="replace_target"><a href="http://address.com">superlink</a></span>
                                                </div>
                                         -->
                                           
                                    </div><!--Sign up and login END-->

                                    <div id="shop-menu_pull-right"></div>

                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->


    </header><!--/header-->


    <section id="form"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-2 col-sm-offset-1">

                </div>
                <div class="col-sm-5 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2>Backup Login</h2>
                        <p>Check your email account and enter the details<a href="index.jsp" style="color: #0083C9;padding-left: 90px">Home Page</a></p>
                        <%String msg=request.getParameter("err");%>
                        <label style="color: #ff3333"><%if(msg!=null){%><%=msg%><%}%></label>
                        <form action="backupLogin" method="post">
                            <input type="text" name="username" placeholder="User Name"/>
                            <input type="password" name="keycode" placeholder="Enter the keycode"/>						
                            <button type="submit" style="border-right: 0px" class="btn btn-default">Login</button>
                            
                        </form><br>
                        <p style="color: #ff3333">Please make sure to change your password after the login</p>
                    </div><!--/login form-->
                </div>
                <div class="col-sm-2">

                </div>
            </div>
        </div>
    </section><!--/form-->


	<section id="slider"><!--slider-->
    </section><!--/slider-->


    <section id="level_1" ><!--Home Body Section 1-->
     </section><!--/Home Body Section 1-->




    <section id="do_action">
    </section>



	<footer id="footer"><!--Footer-->
    </footer><!--/Footer-->
	
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-70139440-1', 'auto');
  ga('send', 'pageview');

</script>
  
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script src="js/my.js"></script>
</body>
</html>
