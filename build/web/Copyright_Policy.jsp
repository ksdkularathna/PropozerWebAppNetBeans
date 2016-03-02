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

<!DOCTYPE html>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Copyright Policy</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <meta name="description" content="Propozer is a unique, Confidential, innovative and professional way of finding partners. We offer you the best possible matches of grooms and brides according to your wish. Join FREE!" />
        <meta name="keywords" content="find love, find a girlfriend, find a boy friend, propozer, proposal, place for love, wedding, matchmaking, matchmaking service, matrimonial, life partner, Astrology Matching, Matrimonial, Matrimony, Sri lankan Matrimonial, Srilanka Matrimonials, free matrimonial site, matrimonial sites Sri Lanka, matrimonial lk, matrimonial websites, bridegroom, Online Matrimonials" />
        <meta name="author" content="metatags generator">
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

    </head>
    <body>

        <script src="js/FB_SDK.js"></script>

        <header>
            <%@ include file="header.jsp" %>
        </header><!--/header-->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="left-sidebar">

                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="blog-post-area">
                            <h2 style="padding-top: 20px;" class="title text-center">Copyright Policy</h2>
                            <div class="single-blog-post">
                               
                                <ul>
                                    <li>Propozer.lk owns and retains all proprietary rights in the Propozer.lk Site and the Propozer.lk Service. 
                                        The Site contains the copyrighted material, trademarks, and other proprietary information of Propozer.lk,
                                        and its licensors. Except for that information which is in the public domain such as member profile or for
                                        which permission has been obtained from the user, you cannot copy, modify, publish, transmit, distribute,
                                        perform, display, or sell any such proprietary information. Any such act or an attempted act on your part
                                        shall constitute a violation of this Agreement and your membership is liable to be terminated forthwith by 
                                        Propozer.lk without refund of any of your unused Subscription fees. We also reserve our 
                                        right to take legal action (civil and/or criminal) wherever applicable for any violations </li><br>
                                    <br>
                                    <br>
                                    Propozer.lk හට Propozer.lk වෙබ් අඩවිය සහ එයට අයත් සේවාවන් වල අයිතිය සතුය. මම අඩවියට අයත් කිසිදු ලාංචනයක්, තොරතුරක් (මෙහි සාමාජිකයන් විසින් පල කරනලද තොරතුරු හැර) අනවසරෙන් උපුටා ගැනීම, වෙනස් කිරීම, පල කිරීම, බෙදා හැරීම හෝ විකිණීම  සපුරා තහනම්ය. එවැනි අවස්තාවකදී නීතිමය ක්‍රියාමාර්ග ගැනීමේ අයිතිය Propozer.lk සතුය.
                                </ul>  

                                

                            </div>



                        </div>
                    </div>

                  

                </div>    

                

            </div>


        </section>



        <section id="slider"><!--slider-->
        </section><!--/slider-->


        <section id="level_1" ><!--Home Body Section 1-->
        </section><!--/Home Body Section 1-->




        <section id="do_action">
        </section>


        <footer id="footer"><!--Footer-->
            <%@ include file="footer.jsp" %>
        </footer><!--/Footer-->
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
