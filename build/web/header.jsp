<%-- 
    Document   : member
    Created on : Jun 20, 2015, 12:22:38 PM
    Author     : Anushka Isuru
--%>
<%@page import="com.hib.mappings.User"%>


<div id="header_top" class="header_top" style="height: 40px"><!--header_top-->
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="social-icons pull-left">
                    <ul class="nav navbar-nav">
                        <li><a href="https://www.facebook.com/propozer"><i class="fa fa-facebook"></i></a></li>
                        <!--   <li><a href="#"><i class="fa fa-twitter"></i></a></li> -->
                        <li><a href="https://plus.google.com/u/0/101400905630792632105/posts"><i class="fa fa-google-plus"></i></a></li>
                    </ul>
                </div>
            </div>

            <div class="col-sm-9">
                <div class="contactinfo pull-right">
                    <ul class="nav navbar-nav">                                              

                        <%if (user == null) {%>

                        <li>
                            <div id="login" class="btn-group" style="padding-bottom: 7px;">

                                <button  onclick="login_box()" class="btn btn-default usa">Login</button>

                            </div>
                        </li>
                        <%} else {%>
                        <%if (user.getFname() != null && user.getUserNameId() != null) {%>
                        <li style="padding-top: 15px; padding-right: 5px; font-size: 11px;"> <%=user.getFname()%>  (<%=user.getUserNameId()%>) </li>
                            <%}%>
                        <li>
                            <%if (user.getFbProfile() != null) {%>
                            <div id="fb_signups" class="btn-group" style="padding-bottom: 0px; padding-top: 11px; padding-left: 5px; padding-right: 10px;">
                                <fb:login-button  scope="public_profile,email" id="loginButton" onlogin="checkLoginState()">Login to facebook</fb:login-button>
                            </div>
                            <%}%>
                        </li>
                        <li>
                            <div id="login" class="btn-group" style="padding-bottom: 7px;">
                                <form action="logout" method="post"> 
                                    <button type="submit" class="btn btn-default usa">Logout</button>
                                </form>
                            </div>
                        </li>



                        <%}%>


                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!--/header_top-->

<div class="header-middle"><!--header-middle-->
    <div class="container">
        <div class="row" style="padding-bottom: 0; margin-bottom: 0">
            <div class="col-sm-5" style="padding-bottom: 0; margin-bottom: 0">
                <div class="logo pull-left" style="padding-bottom: 0; margin-bottom: 0">
                    <a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
                </div>
            </div>
            <div class="col-sm-7">


                <div id="shop-menu_pull-right" class="shop-menu pull-right" style=" top:0px; ">
                    <ul class="nav navbar-nav">

                        <%if (user != null && user.getFbProfile() == null && user.getFname() == null) {%>
                        <li><a href="createProfile_1.jsp"><i class="fa "></i>Create Profile</a></li>                                                                                            
                            <%}%> 
                            <%if (user != null && user.getFname() == null && user.getFbProfile() != null) {%>
                        <li><a href="createProfile.jsp"><i class="fa "></i>Create Profile</a></li>
                            <%}%>    
                            <%if (user != null && user.getFname() != null) {%>
                        <li><a href="member.jsp"><i class="fa "></i>My Profile</a></li>
                            <%}%>                 
                            <%if (user == null) {%>
                        <li><a href="Signup_choocer.jsp"><i class="fa "></i>Sign Up</a></li>
                            <%}%>
                        <li><a href="About.jsp"><i class="fa "></i>About</a></li>
                        <li><a href="FAQ.jsp"><i class="fa "></i>FAQ</a></li>
                        <li><a href="Contact.jsp"><i class="fa "></i>Contact Us</a></li>


                    </ul>


                </div>

            </div>
        </div>
    </div>
</div><!--/header-middle-->



