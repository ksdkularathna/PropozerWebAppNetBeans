<%-- 
    Document   : Signup
    Created on : Jun 5, 2015, 12:54:26 PM
    Author     : Anushka Isuru
--%>
<%@page import="org.hibernate.Hibernate"%>
<%@page import="com.hib.mappings.Userrequests"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.hib.servlets.HibSession"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@page import="com.hib.mappings.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user;
    String gender = "";
    try {
        user = (User) request.getSession().getAttribute("loguser");
        request.setAttribute("userid", user.getIduser());
        if (user.getGender() != null) {
            if (user.getGender().equals("Male")) {
                gender = "Female";
            } else {
                gender = "Male";
            }
        }
    } catch (Exception e) {
        user = null;
        //e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up with facebook</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">
        <meta name="description" content="Propozer is a unique, Confidential, innovative and professional way of finding partners. We offer you the best possible matches of grooms and brides according to your wish. Join FREE!" />
        <meta name="keywords" content="find love, find a girlfriend, find a boy friend, propozer, proposal, place foe love, wedding, matchmaking, matchmaking service, matrimonial, life partner, Astrology Matching, Matrimonial, Matrimony, Sri lankan Matrimonial, Srilanka Matrimonials, free matrimonial site, matrimonial sites Sri Lanka, matrimonial lk, matrimonial websites, bridegroom, Online Matrimonials" />
        <meta name="author" content="metatags generator">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');

fbq('init', '1690242791257903');
fbq('track', "PageView");</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1690242791257903&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
        <style> 
            /* Password Validation */    
            #form label{float:left; }
            #error_msg{color:darkgrey; }
            #error_msg2{color:#ff3333; }
        </style>
        <script type="text/javascript">
            function getXMLHTTPRequest() {
                var xmlhttp;
                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xmlhttp = new ActiveObject("Microsoft.XMLHTTP");
                } else {
                    alert("Browser Dosent Support Ajax");
                }
                return xmlhttp;
            }

            function checkUserName(url) {
                //alert("ajax");
                var username = document.getElementById('username').value;
                var fb_username = document.getElementById('fb_username').value;
                //alert(fb_username);
                xmlHttp = getXMLHTTPRequest();
                if (xmlHttp == null) {
                    alert("No Ajax Object in DOM");
                } else {
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    // alert(username);
                    xmlHttp.send('username=' + username + '&fb_username=' + fb_username);
                    //alert("send");

                    xmlHttp.onreadystatechange = function() {
                        if (xmlHttp.readyState == 4) {
                            var res = xmlHttp.responseText;
                            //alert(res);
                            if (res == 'yes') {
                                show_msg1();
                            }
                            if (res == 'yes_fb') {
                                show_msg2();
                            }
                        }

                    }
                }
            }
            function show_msg1() {
                var sub_button = document.getElementById("fbSubmit");
                sub_button.setAttribute('disabled', 'disabled');
                var errorMsg2 = $('<span id="error_msg2">Username exists. Please choose another</span>');
                var confirmBox = document.getElementById("confirm_password");
                var exist_error = document.getElementById("error_msg2");
                if (exist_error == null) {
                    errorMsg2.insertAfter(confirmBox);
                }
            }
            function show_msg2() {
                var sub_button = document.getElementById("fbSubmit");
                sub_button.setAttribute('disabled', 'disabled');
                var errorMsg2 = $('<span id="error_msg2">This FB profile has an account. Please choose another</span>');
                var confirmBox = document.getElementById("confirm_password");
                var exist_error = document.getElementById("error_msg2");
                if (exist_error == null) {
                    errorMsg2.insertAfter(confirmBox);
                }
            }
            function hide_msg() {
                //alert("dfdfdf");
                var sub_button = document.getElementById("fbSubmit");
                sub_button.removeAttribute('disabled');
                var $errorCont2 = document.getElementById("error_msg2");
                if ($errorCont2 != null) {
                    $errorCont2.remove();
                }
            }
        </script>


    </head>
    <body>
        <script src="js/FB_SDK_signup_1.js"></script>       
        <header>
            <%@ include file="header.jsp" %>
        </header><!--/header-->

        <section id="form"><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <div id="profile-pic" class="shipping text-center" style="border: 1px solid #c4c2b9; height: 359px; width: 359px;"><!--shipping-->
                            <!--Load facebook profile picture here-->
                        </div>
                    </div>
                    <div class="col-sm-4 col-sm-offset-1">
                        <div class="login-form"><!--login form-->
                            <h1>Hello ! Welcome to Propozer</h1>
                            <h2>Please Sign Up Before Get Started</h2>
                            <%
                                String err = "";

                                if (request.getParameter("err") == null) {
                                    err = "";
                                } else {
                                    err = request.getParameter("err");
                                }
                            %>

                            <p style="color: #ff3333"><%=err%></p>
                            <form action="signup" method="post">
                                <p id="status" style="color: #ff3333"></p>
                                <table class='table' style="margin-bottom: 0px; border: none; border-bottom: none;">
                                    <tr>
                                        <td> <input type="text" id="username" onclick="hide_msg()" name="username" placeholder="Choose User Name" required/></td>

                                    </tr>
                                    <tr>
                                        <td> <input id="password" type="password" placeholder="Choose Password" onclick="checkUserName('checkUserName')" required /></td>

                                    </tr>
                                    <tr>
                                        <td><input id="confirm_password" type="password" name="password" placeholder="Confirm Password"  required /></td>

                                    </tr>
                                    <input type="hidden" id="fb_email" name="fb_email" />
                                    <input type="hidden" id="fb_username" name="fb_profile" />
                                    <input type="hidden" id="pro_pic" name="pro_pic" />
                                    <tr>
                                        <td>  <button id="fbSubmit" type="submit" class="btn btn-default pull-right" >Sign Up</button> </td>

                                    </tr>
                                </table>

                            </form>

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
            <%@ include file="footer.jsp" %>
        </footer><!--/Footer-->


        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/my.js"></script>


        <!-- Modal 1-->
        <div class="modal fade custom-Modals" id="fbModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" onclick="window.location = 'index.jsp'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Please Login to Your Facebook Account</h4>
                    </div>
                    <div class="modal-body">
                        <p>The <span style="color:#e2335b;" >Propoze</span> only alllows registration via your Facebook account. It Seems like this browser haven't any logged in Facebook account.
                            Please log in to your Facebook account! </p>
                    </div>
                    <div class="modal-footer">

                        <div id="fb_signup" class="btn-group" style="padding-right: 0px;">
                            <fb:login-button scope="public_profile,email" onlogin="checkLoginState()"  id="loginButton"  >Sign up with facebook</fb:login-button>
                            <button style="border-radius: 2px; margin-right: 10px; padding-top: 0px; padding-bottom: 0px; " type="button" class="btn btn-default " onclick="window.location = 'index.jsp'" data-dismiss="modal">Close</button>   

                        </div> 

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- Modal 2-->
        <div class="modal fade custom-Modals" id="fbModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" onclick="window.location = 'index.jsp'" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"><span style="color:#e2335b;" >Facebook Authorization Failed</span></h4>
                    </div>
                    <div class="modal-body">
                        <p>Seems like you have deleted or altered facebook permissions in <span style="color:#e2335b;" >Propoze</span> App in your Facebook account.
                            Please reassign permissions by clicking the FB button below!</p>
                    </div>
                    <div class="modal-footer">

                        <div id="fb_signup" class="btn-group" style="padding-right: 0px;">
                            <fb:login-button scope="public_profile,email" onlogin="checkLoginState()"  id="loginButton"  >Assign permissions</fb:login-button>
                            <button style="border-radius: 2px; margin-right: 10px; padding-top: 0px; padding-bottom: 0px; " type="button" class="btn btn-default " onclick="window.location = 'index.jsp'" data-dismiss="modal">Close</button>   

                        </div> 

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <script>
            (function(i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function() {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-70139440-1', 'auto');
            ga('send', 'pageview');

            $('#fbModal1').modal({
                backdrop: 'static',
                keyboard: false
            })
            $('#fbModal2').modal({
                backdrop: 'static',
                keyboard: false
            })

        </script>

    </body>
</html>
