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
    User user = null;
    try {
        user = (User) request.getSession().getAttribute("loguser");
        request.setAttribute("userid", user.getIduser());
        if (user.getCaste() != null) {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        user = null;
        //e.printStackTrace();
    }
    String err = "";
    String newuser = "";
    if (request.getParameter("err") == null) {
        err = "";
    } else {
        err = request.getParameter("err");
    }
    if (request.getParameter("newuser") == null) {
        newuser = "";
    } else {
        newuser = request.getParameter("newuser");
    }
%>

<!DOCTYPE html>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validation</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
    </head>
    <body>

        <script src="js/FB_SDK_signup.js"></script>

        <header>
            <%@ include file="header.jsp" %>
        </header><!--/header-->



        <section id="form"><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 ">

                    </div>
                    <div class="col-sm-4 ">
                        <div class="login-form"><!--login form-->
                            <h1><%=newuser%></h1>
                            <h2>Please help verify your email address</h2>
                            <form action="initLogin" method="post">
                                <p id="status" style="color: #ff3333"></p>
                                <table class='table' style="margin-bottom: 0px; border: none; border-bottom: none;">
                                    <tr>
                                        <td> <input type="password" name="key" placeholder="Enter key code here" required/>
                                        <label style="color: #ff3333"><%=err%></label>
                                        </td>
                                        <td>
                                            <input id="username" type="hidden" value="<%=newuser%>" name="username" required>
                                        </td>
                                    </tr>
                                    <tr> <span style="font-size: x-small; color: silver">* Your account verification code has being sent to your Email (Eg : adc23)</span> </tr>                                
                                        <td>  <button  type="submit" class="btn btn-default pull-right" >Submit</button> </td>
                                        
                                </table>                                
                                
                            </form>
                                        <a href="resendKey?username=<%=newuser%>" style="padding-bottom: 10px; float: left;">Resend the key code</a>
                        </div><!--/login form-->
                    </div>
                    <div class="col-sm-2">

                    </div>
                </div>
            </div>
        </section><!--/form-->




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



    </body>
</html>
