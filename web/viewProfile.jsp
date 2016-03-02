<%-- 
    Document   : viewProfile
    Created on : Jul 10, 2015, 11:10:36 PM
    Author     : Sampath Dhananjaya
--%>

<%@page import="com.hib.mappings.Userrequests"%>
<%@page import="com.hib.mappings.User"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.hib.servlets.HibSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        String propose_id = request.getParameter("propose_id");
        User user = null;
        User proposal = null;
        try {
            user = (User) request.getSession().getAttribute("loguser");
        } catch (Exception e) {
            user = null;
            e.printStackTrace();
        }
        HibSession hib = new HibSession();
        if (propose_id != null) {
            Query q1 = hib.session.createQuery("from User where iduser='" + propose_id + "'");
            proposal = (User) q1.uniqueResult();

        }
    %>
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Propozer is a unique, Confidential, innovative and professional way of finding partners. We offer you the best possible matches of grooms and brides according to your wish. Join FREE!" />
        <meta name="keywords" content="find love, find a girlfriend, find a boy friend, propozer, proposal, place foe love, wedding, matchmaking, matchmaking service, matrimonial, life partner, Astrology Matching, Matrimonial, Matrimony, Sri lankan Matrimonial, Srilanka Matrimonials, free matrimonial site, matrimonial sites Sri Lanka, matrimonial lk, matrimonial websites, bridegroom, Online Matrimonials" />
        <meta name="author" content="metatags generator">
        <title>Profile Details</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="css/sweetalert.css">
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
        <!-- Alert Js -->
        <script src="js/alert/sweetalert-dev.js"></script>   

        <script type="text/javascript">
            // loading scrip from member.jsp
            function msg() {

                swal({title: "Sweet!", text: "Before Proposing, Please login to your Propozer Account or Sign Up today!", imageUrl: "images/logo_icon.png"});
            }
            jQuery(document).ready(function($) {
                alert("dfs");
                $("#header_top").load("member.jsp #header_top");

                $("#shop-menu_pull-right").load("member.jsp #shop-menu_pull-right");

                $("#footer").load("member.jsp #footer");
            });

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
            function propose(url, proposal_id) {
                //alert("ajax");
                xmlHttp = getXMLHTTPRequest();
                if (xmlHttp == null) {
                    alert("No Ajax Object in DOM");
                } else {
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    //alert();
            <%if (user != null) {%>
                    xmlHttp.send('user_id=<%=user.getIduser()%>&proposal_id=' + proposal_id);
            <%}%>
                    //alert("send");
                    xmlHttp.onreadystatechange = function() {
                        if (xmlHttp.readyState == 4) {
                            var res = xmlHttp.responseText;
                            if (res != "" || res != null) {
                                //alert(res);
                            }

                        }

                    }
                }
            }

        </script>


    </head><!--/head-->

    <body>

        <header>
            <%@ include file="header.jsp" %>
        </header><!--/header-->


        <section ><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 ">

                    </div>
                    <div class="col-sm-6 ">
                        <div class="login-form" ><!--Profile form-->
                            <h2><%=proposal.getUserNameId()%></h2>

                            <div class="profile_form" id="profile_form">
                                <form action="http://propozer.com/prof/?want_page=edit_page" method="post" enctype="application/x-www-form-urlencoded" class="search_form">
                                    <table class="table">
                                        <tbody>


                                            <tr><td style="color: #bab7b6">Country Live In</td><td style="color: #bab7b6" colspan="2"><%=proposal.getCountry()%></td></tr>
                                            <tr><td style="color: #bab7b6">City Live In</td><td style="color: #bab7b6" colspan="2"><%=proposal.getCity()%></td></tr>

                                            <tr><th colspan="3"  style="text-align: center;color: #a6bffb; height: 60px;">Basic Information</th></tr>
                                            <tr><td width="20%" style="color: #bab7b6">Gender</td>
                                                <td width="30%">
                                                    &nbsp<%=proposal.getGender()%>

                                                </td>


                                                </td>
                                            </tr>
                                            <tr><td style="color: #bab7b6">Height</td><td colspan="2"><%=proposal.getHeight()%></td></tr>
                                            <tr><td style="color: #bab7b6">Marital Status</td><td colspan="2"><%=proposal.getMaritalStatus()%></td></tr>
                                            <tr><td style="color: #bab7b6">Religion</td><td colspan="2"><%=proposal.getReligion()%></td></tr>
                                            <tr><td style="color: #bab7b6">Mother Tongue</td><td colspan="2"><%=proposal.getMothertongue()%></td></tr>
                                            <tr><th colspan="3" style="text-align: center;color: #a6bffb;height: 60px;height: 60px;">About My Career</th></tr>
                                            <tr><td style="color: #bab7b6">Profession</td><td colspan="2"><%=proposal.getProfession()%></td></tr>
                                            <tr><td style="color: #bab7b6">Income (per month)</td><td colspan="2"><%=proposal.getIncome()%></td></tr>

                                            <tr><th colspan="3" style="text-align: center;color: #a6bffb;height: 60px; height: 60px;">About Education</th></tr>
                                            <tr><td style="color: #bab7b6">Education Level</td><td colspan="2"><%=proposal.getEducationStatus()%></td></tr>
                                            <tr><th colspan="3" style="text-align: center;color: #a6bffb;height: 60px;">About Me... </th></tr>
                                            <tr><td style="color: #bab7b6">I am...</td><td colspan="2">"<%=proposal.getYourself()%>"</td></tr>
                                            <tr><td style="color: #bab7b6">About Family Background</td><td colspan="2">"<%=proposal.getBackground()%>"</td></tr>
                                            <tr><td style="color: #bab7b6">About Education</td><td colspan="2">"<%=proposal.getEducationLevel()%>"</td></tr>
                                            <tr><td style="color: #bab7b6">Looking for</td><td colspan="2">"<%=proposal.getExpectations()%>"</td></tr>
                                            <%
                                                Boolean proposeStatus = false;
                                                if (user != null) {
                                                    Query q2 = hib.session.createQuery("from Userrequests where userId='" + proposal.getIduser() + "' AND user='" + user.getIduser() + "'");
                                                    Userrequests existproposal = (Userrequests) q2.uniqueResult();
                                                    if (existproposal != null) {
                                                        proposeStatus = true;
                                                    } else {
                                                        proposeStatus = false;
                                                    }
                                                }

                                            %>
                                            <tr><td></td>
                                                <%if (user == null) {%>
                                                <td><a onclick="msg()" class="btn btn-default add-to-cart"><i class="fa fa-heart"></i>Propose</a>
                                                </td>
                                                <%} else if (user != null && proposeStatus) {%>                                              
                                                <td><a href="" onclick="propose('removeProposal', '<%=proposal.getIduser()%>')" class="btn btn-default add-to-cart"><i class="fa fa-times"></i>Unpropose</a>                                                
                                                </td>
                                                <%} else {%>                                                
                                                <td><a href="" onclick="propose('addProposal', '<%=proposal.getIduser()%>')" class="btn btn-default add-to-cart"><i class="fa fa-heart"></i>Propose</a>                                                
                                                </td>
                                                <%}%>
                                            </tr>

                                        </tbody>
                                    </table>

                                </form>
                            </div>

                        </div><!--/Profile form-->
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


        <%@ include file="footer.jsp" %>
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
<%
    hib.transaction.commit();
    hib.session.close();
%>