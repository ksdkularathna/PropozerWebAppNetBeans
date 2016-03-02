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
        <title>Terms and Conditions</title>
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
                            <h2 style="padding-top: 20px;" class="title text-center">Terms and Conditions</h2>
                            <div class="single-blog-post">
                               
                                <ol>
                                    <li>Propozer.lk reserves the right in it's sole discretion to review the activity & status of each account & block the account of a member based on such review. <br>
Propozer.lk වෙබ් අඩවියේ පවතින ඕනෑම ගිණුමක්  හෝ ක්‍රියාකාරකමක් පරික්ශා කිරීමට හා අවශ්‍ය විටක ඕනෑම ගිණුමක් අත්හිටවීමේ බලය Propozer.lk සතුය.
                                    </li><br>
                                    <li>You hereby confirm that as on date of this registration, you do not have any objection to receiving emails, messages and calls from Propozer.lk and members of Propozer.lk as long as you are a registered member of Propozer.lk. 
                                        <br>
Propozer.lk වෙබ් අඩවිය හෝ එහි සාමාජිකයන් විසින් එවනු ලබන ඊ මේල් හෝ දුරකථන ඇමතුම් සදහා ඔබගේ විරෝධයක් නොමැති බව සනාත කරමි 
</li><br>
                                    <li>Multiple profiles of the same person are not allowed on Propozer.lk. Propozer.lk reserves the right to deactivate all multiple profiles without any refund of subscription fees.
   <br>
එකම පුද්ගලයෙකු හට ගිණුම කිහිපයක් Propozer.lk තුල සෑදීමට අවකාශ නැති අතර එවැනි ගිණුම අත්හිටුවීමට Propozer.lk හට සම්පුර්ණ බලය ඇත.
 </li><br>
                                    <li>Except for the purpose of promoting/advertising your profile for matchmaking purposes, you cannot engage in advertising to, or solicitation of, other Members to buy or sell any products or services through the Service. You will not transmit any chain letters or junk email to other Propozer.lk Members. Although Propozer.lk cannot monitor the conduct of its Members off the Propozer.lk Site, it is also a violation of these rules to use any information obtained from other members in order to harass, abuse, or harm another person, or in order to contact, advertise to, solicit, or sell to any Member without their prior explicit consent.
                                        <br>
Propozer.lk වෙබ් අඩවියේ ඔබහේ විස්තර ඇතුළු කිරීමට ඇති ස්ථාන වල  වෙනත් කිසිදු අයුරකින් හානිදායක, අසභ්‍ය, අශීලාචාර, ලිංගික, හිංසාකාරී, නිගරු, අපවාදාත්මක, අශෝභන, තර්ජනාත්මක,  ජාතිවාදී, ආගම්වාදී, අශ්ශීල, නීති විරෝධී හෝ කිසිදු නීතියක් උල්ලංඝනය වන කිසිදු පණිවිඩයක් හෝ කරුණක් යැවීමට හෝ කිසිදු දුරකථන අංකයක් හෝ විද්‍යත් ලිපිනයක් පල කිරීමට මෙම වෙබ් අඩවිය යොදා නොගන්නා බවට ඔබ එකඟතාව පළ කර සිටින අතර, එය උල්ලංඝනය කරන අයෙකුහට සීමා පැනවීමට, නැවත පැමීනීමට නොහැකි ලෙස කටයුතු කිරීම හෝ සම්පූර්ණයෙන් නතර කිරීමේ අයිතිය Propozer.lk සතුය.  
 </li><br>
                                    <li>In order to protect Propozer.lk and/or our Members from any abuse / misuse, Propozer.lk reserves the right to take appropriate steps as it deems appropriate in its sole discretion in order to protect interest of other Members.
                                        <br>
Propozer.lk හරහා එහි සිටින කිසිදු සාමාජිකයෙකුට හිරිහැර, තර්ජන අපවාද නැගීම නොකළ යුතුය. එවන් ආවස්තාවකදී අදාළ පුද්ගලයින්ගේ ගිණුම අත්හිටුවීමට Propozer.lk හට බලය ඇත.
 </li><br>
                                    <li>You cannot use any automated processes, including IRC Bots, EXE's, CGI or any other programs/scripts to view content on or communicate / contact / respond / interact with Propozer.lk and/or its members.
                                        <br>
කිසිදු අයුතු ආකාරයකින් සාමාජිකයන්ගේ තොරතුරු ලබා ගැනීමට ඔබට අයිතියක් නැත.
 </li><br>
                                    
 <li>Propozer.lk reserves the right to screen communications/advertisements that you may send to other Member(s) and also regulate the same by deleting unwarranted/obscene communications/advertisements at any time at its sole discretion without prior notice to any Member.<br>
ඔබ චැට් පහසුකම භාවිතා කරන විට එමගින් කිසිඳු ආකාරයක වෙළඳ දැන්වීම් ප්‍රචාරයක් සිදු කල නොහැක.
 </li><br>
                                  
                                  <li>Propozer.lk Members who subscribe to the Propozer.lk Select Service hereby, unconditionally and irrevocably confirm that you have read terms and conditions and agree to abide by them.
                                      <br>
Propozer.lk හි ලියාපදිංචි වන සාමාජිකයෙකු ලෙස ඉහත සදහන් කොන්දේසි සියල්ල කියව බලා එම සියල්ලටම එකග වන බව මෙයින් සනාත කරමි. 
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
