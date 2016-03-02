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
        <title>Disclaimers</title>
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
                            <h2 style="padding-top: 20px;" class="title text-center">Disclaimers</h2>
                            <div class="single-blog-post">
                               
                                <ol>
                                    <li>Propozer.lk is not responsible for any incorrect or inaccurate Content/listing posted on the Site or in connection with the Propozer.lk Service, whether caused by Users, Members or by any of the equipment or programming associated with or utilized in the Service, nor for the conduct of any User and/or Member of the Propozer.lk Service whether online or offline.
                                        <br>

මෙම අඩවියේ හෝ ඊට සම්බන්ධ වෙනත් අඩවි වල  පලවන වැරදි සහ සාවද්‍ය තොරතුරු සම්බන්ධයෙන් Propozer.lk වගකීමක් දරනු නොලැබේ. 
 </li><br>
 <li>Propozer.lk assumes no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, User and/or Member communications or any communications by Propozer.lk to its Members.<br>

Propozer.lk සාමාජිකයන්ට අදාළ තොරතුරු නැති වීමක්, අස්ථාන ගත වීමක්, සොරකම් කිරීමක්, අනවසරෙන් ලග තබාගනිමක් හෝ සන්නිවේදනයේදී සිදුවන ප්‍රමාදයන් පිළිබද වගකීමක් ගනු නොලැබේ.
 </li><br>
 <li>Propozer.lk is not responsible for any problems or technical malfunction of any telephone network or lines, computer on-line-systems, servers or providers, computer equipment, software, failure of email or players on account of technical problems or traffic congestion on the Internet or at any web site or combination thereof, including injury or damage to Users and/or Members or to any other person's computer related to or resulting and/or in connection with the Propozer.lk Service.<br>

පරිගණක හෝ අන්තර්ජාල භාවිතයේදී ඇතිවන කිසිඳු දෝෂයකට Propozer.lk බැදී නොසිටියි.

 </li><br>
 <li>The exchange of matchmaking profile(s) through or by "Propozer.lk" is not a matrimonial offer and/or recommendation from/by Propozer.lk. Propozer.lk shall not be responsible for any loss or damage to any individual arising out of, or subsequent to, any relations (including but not limited to matrimonial relations) established pursuant to the use of Propozer.lk. <br>

මෙහිදී සිදුවන යෝජනා නුවමරු සදහා Propozer.lk විසින් වේදිකාවක් පමණක් සපයා දෙන අතර එතුලින් ඇතිවන සම්බන්ධතා පිලිබඳ කිසිදු අකාරයේ වගකීමක් Propozer.lk දරනු නොලැබේ. 
 </li><br>
 <li>The Site and the Service are provided "AS-IS" and Propozer.lk expressly disclaims any warranty of fitness for a particular purpose or non-infringement. Propozer.lk cannot guarantee and does not promise any specific results from use of the Site and/or the Propozer.lk Service. <br>

Propozer.lk විසින් මෙම වෙබ් අඩවිය භාවිතයෙන් අනිවාර්යයෙන් සහකරුවෙකු ලැබෙන බව සහතික නොකරන බව සලකන්න.
 </li><br>
                                    <li>Propozer.lk expressly disclaims any liability or responsibility whatsoever and howsoever arising as a result of any Content/listing posted on the Site / made available to Propozer.lk by any Members or the users of the Site or any third party.
                                        <br>
Propozer.lk වෙත පැමිණෙන සාමාජිකයන් හෝ වෙනත් පුද්ගලයින් විසින් ඇතුලත් කර ප්‍රදර්ශනය කරනු ලබන කිසිදු තොරතුරක වගකීමක් ගනු නොලැබේ.
 </li><br>
                                    <li>Propozer.lk does not assume any responsibility or liability for any illegal Content posted on the Site by any Members, users or any third party.
                                        <br>
Propozer.lk වෙත පැමිණෙන සාමාජිකයන් විසින් පල කරනු ලබන හෝ සිදුකරනු ලබන කිසිදු නීත්‍යනුකුල නොවන ක්‍රියාවක වගකීම Propozer.lk  ගනු නොලැබේ.  
 </li><br>
                                    <li>All liability, whether civil or criminal arising out of any Content that is Posted on the Site will be of that Member / user / third party who has Posted such Content and Propozer.lk reserves its right to claim damages from such Member/ user / third party that it may suffer as a result of such Content Posted on the Site. Propozer.lk does not claim ownership of Content you submit or make available for inclusion on the Service.
                                        <br>
සාමාජිකයෙකු හෝ වෙනත් පුද්ගලයෙකු විසින් ඇතුලත් කල තොරතුරක් හෝ චැට් කිරීමේදී සිදුකල ක්‍රියාවකින් Propozer.lk වෙත යම හානියක් සිදු වුවහොත් එයට අදාළ සම්පූර්ණ අලභානිය එම සාමාජිකයා හෝ අදාළ වෙනත් පුද්ගලයාගෙන් ලබා ගැනීමට අයිතිය Propozer.lk සතුය.
 </li><br>
                                   

                                </ol>  

                                

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
