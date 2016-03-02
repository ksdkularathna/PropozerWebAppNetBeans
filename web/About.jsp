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
        <title>About</title>
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
            !function(f, b, e, v, n, t, s) {
                if (f.fbq)
                    return;
                n = f.fbq = function() {
                    n.callMethod ?
                            n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                };
                if (!f._fbq)
                    f._fbq = n;
                n.push = n;
                n.loaded = !0;
                n.version = '2.0';
                n.queue = [];
                t = b.createElement(e);
                t.async = !0;
                t.src = v;
                s = b.getElementsByTagName(e)[0];
                s.parentNode.insertBefore(t, s)
            }(window,
                    document, 'script', '//connect.facebook.net/en_US/fbevents.js');

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
                        <h2 style="padding-top: 20px;" class="title text-center">About Propozer</h2>
                        <div class="single-blog-post">

                            <p>
                            <p>Propozer is a unique, innovative and professional matchmaking service provider in Sri Lanka .  We offer you the best possible matches of grooms and brides according to your wish through our expanding proprietary network. </p>
                            <p>As a premium matchmaking service provider, our database includes a selected group of reliable candidates  who will meet your exact criteria at it best. </p>
                            <p>Propozer will definitely help you to find someone special whom you're compatible with and the one who  can build a solid and everlasting relationship with you . </p>
                            <br>
                            <br>
                            <div class="middle_cotent">
                                <h3>Why Propozer is unique and different ?</h3><br>
                                <p>“You don’t have to worry about your photo and contact information being visible to unwanted parties anymore ! 
                                    Sounds great huh.. With Propozer you can’t see any photo of the other party. You have to spot the match only 
                                    with the stated description and inner qualities. 
                                    Yep just like the newspaper ad. But remember, Your photo is also not visible to the counter party.  </p><br>
                                <p style="color: #076559;">ඔබගේ පින්තූරය සහ පුද්ගලික තොරතුරු අනවශ්‍ය පුද්ගලයින්ගේ අතට පත් වෙයි කියා බියෙන් සිටි කාලය අවසානයි ! ඒ කොහොමද ? 
                                    Propozer එකේ ඔබට අවශ්‍ය පරිදි search කලාම එන ප්‍රථිපල වල පින්තූර පෙනේනේ නැහැ. පෙනෙන්නේ අනෙක් පාර්ශවයේ තොරතුරු
                                    ටික විතරයි. ඔව්.. හරියටම පත්තරේ දැන්වීම් බලනවා වගේ. ඒ කියන්නේ ඔබේ පින්තූරයත් අනිත් අයට පෙනෙන්නේ නැහැ</p>
                                <br> <p>But once your proposal get accepted, both parties can see each other’s photos. Cool right.. If you don’t like the appearance you 
                                    can still move on without feeling bad since your contact information are not revealed yet. </p>
                                <br> <p style="color: #076559;">නමුත් ඔබ විසින් කල යෝජනාවට අනෙක් පාර්ශවයේ කැමැත්ත ලැබුනොත්, එතැන් සිට  දෙදෙනාටම එකිනෙකාගේ  පින්තූර බලන්න පුළුවන්. ඔබ පින්තූරයට අකමැති නම් කිසිම හිත් රිදීමක්‌ නැතිව වෙන අතක් බලා ගන්න උනත් පුළුවන්, මොකද තවම ඔබගේ contact information
                                    (නම, දුරකථන අංක, ඊ මේල් ආදිය) අනිත් කෙනා දන්නේ නැති නිසා.</p>
                                <br> <p>With the chat facility you can get to know the person more and share your content information. </p>
                                <br> <p style="color: #076559;">පින්තූරය සහ තොරතුරු හිතට වැදුන නම්, Propozer චැට් පහසුකම පාවිච්චි කරලා වඩා හොදින් දෙන්නට දෙන්න අදුන ගන්න පුලවන්. </p><br>

                            </div><br>
                            <div class="table-responsive">
                                <table class="table" id="customers" align="center">
                                    <tr>
                                        <th scope="col" ><img src="images/home/1.png" alt="" /></th>
                                        <th scope="col"><img src="images/home/2.png" alt="" /></th>
                                        <th scope="col"><img src="images/home/3.png" alt="" /></th>
                                        <th scope="col"><img src="images/home/4.png" alt="" /></th>
                                        <th scope="col"><img src="images/home/5.png" alt="" /></th>
                                    </tr>
                                    <tr>
                                        <td>1.Signup with facebook</td>
                                        <td>2.Make your own profile</td>
                                        <td>3.Search for your soulmates</td>
                                        <td>4.Send requests</td>
                                        <td>5.Share your thoughts</td>
                                    </tr>
                                </table>
                            </div>

                        </div>



                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="left-sidebar">


                    </div>
                </div>

            </div>    

            <div class="row">
                <div class="col-sm-2">
                    <div class="left-sidebar"></div>
                </div>
                <div class="col-sm-8">
                    <hr>
                    <h1><span></span></h1>

                    <div class="recommended_items"><!--Freatures-->


                        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">	
                                    <div class="col-sm-4">
                                        <div style="font-family: monospace;" class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">

                                                    <h4 style="color: #ff5c6c; font-weight: normal;">Connecting Hearts Online...</h4>
                                                    <p>The No. 1 & Most Successful <b>Sri Lankan</b> Matrimonial Website.<br>
                                                        Best place to find your life partner. <br>
                                                        Free and easy profile registration. <br>
                                                        nstant messenger with member. <br> </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div style="font-family: monospace;" class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">

                                                    <h4 style="color: #ff9f0a;font-weight: normal;">Our Promise...</h4>
                                                    <p>
                                                        100% confidential and professional service <br>
                                                        We will never publish your <b>photos</b>  and <b>signature</b> without your permission. <br>
                                                        Safe and secure site. 100% privacy guaranteed.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div style="font-family: monospace;" class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">

                                                    <h4 style="color: #1ab63a; font-weight: normal;" >We Strives to...</h4>
                                                    <p>Provide exemplary service <b>24 hours</b> a day. <br>
                                                        Protect our member's privacy vigorously.<br>
                                                        Offer our services in a safe, friendly and courteous manner. </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div><!--/Features-->            





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
