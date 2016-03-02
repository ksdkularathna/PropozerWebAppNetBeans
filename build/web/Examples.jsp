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
    String gender = "Female";
    try {
        user = (User) request.getSession().getAttribute("loguser");
        request.setAttribute("userid", user.getIduser());
        if (user.getGender().equals("Male")) {
            gender = "Female";
        } else {
            gender = "Male";
        }
    } catch (Exception e) {
        user = null;
        e.printStackTrace();
    }
%>

<!DOCTYPE html>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examples</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
<meta name="description" content="Propozer is a unique, Confidential, innovative and professional way of finding partners. We offer you the best possible matches of grooms and brides according to your wish. Join FREE!" />
        <meta name="keywords" content="find love, find a girlfriend, find a boy friend, propozer, proposal, place foe love, wedding, matchmaking, matchmaking service, matrimonial, life partner, Astrology Matching, Matrimonial, Matrimony, Sri lankan Matrimonial, Srilanka Matrimonials, free matrimonial site, matrimonial sites Sri Lanka, matrimonial lk, matrimonial websites, bridegroom, Online Matrimonials" />
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

        <script src="js/FB_SDK_signup.js"></script>

        

        <section id="level_1" ><!--Home Body Section 1-->
        </section><!--/Home Body Section 1-->



        <section id="slider"><!--slider-->
        </section><!--/slider-->


        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                    </div>

                    <div class="col-sm-9 padding-right">


                        <div class="category-tab shop-details-tab"><!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#example1" data-toggle="tab">Example1</a></li>
                                    <li><a href="#example2" data-toggle="tab">Example2</a></li>
                                    <li><a href="#example3" data-toggle="tab">Example3</a></li>
                                    <li><a href="#example4" data-toggle="tab">Example4</a></li>
                                    <li><a href="#example5" data-toggle="tab">Example5</a></li>
                                    <li><a href="#example6" data-toggle="tab">Example6</a></li>
                                    <li><a href="#example7" data-toggle="tab">Example7</a></li>
                                    <li><a href="#example8" data-toggle="tab">Example8</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">




                                <div class="tab-pane fade active in" id="example1" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">General</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>I am honest, very family oriented, and love sports . I love to play cricket and spend time hanging out with friends.
                                            My favorite singer is Kasun Kalhara. However I'm open to listening to anything original.
                                            In my free time I enjoy surfing Facebook, reading, and most of all sleeping.
                                            I have my mother who is a retired teacher. Unfortunately my father is not among us anymore.
                                            And my only sister is still studying.</p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>My dreams are to flourish in my career and eventually own my own business one day.
                                            In the mean time I enjoy working in the [industry] and am lucky to have a job considering the economy these days.</p>
                                        <br> <p><b>I’m Looking For</b></p>
                                        <p>
                                            I'm looking for a woman I can vibe with on a spiritual and intellectual level.
                                            Someone who is teach me new things and inspire me.
                                        </p>
                                    </div>

                                </div>

                                <div class="tab-pane fade" id="example2" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">General – Sinhala</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>මම ගොඩක් යාලුවෝ ආශ්‍රය කරන, සින්දු අහන්න කැමති කෙනෙක්. මගේ ප්‍රියතම ගායකයා කසුන් කල්හාර.
                                            ඒ වගේම මම ක්‍රික්කෙට් වලටත් ගොඩක් ආසයි. මට ගොඩක් යාලුවෝ ඉන්නේ මම අනෙක් අයට හොදින් ඇහුන්කන් දෙන නිසා කියලා තමා මට හිතෙන්නේ.
                                            මගේ අම්මා විශ්‍රාමික ගුරුවරියක්. තාත්තා රජයේ සේවකයෙක්. ඉන්න එකම නංගි තවම ඉගෙන ගන්නවා. </p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>මම දැනට ලංකාවේ  ප්‍රධාන පෙලේ පෞද්ගලික සමාගමක ගණකාධිකාරවරයෙක්  විදිහට වැඩ කරනවා.
                                            මම ජපුරේ කළමනාකරණය ඉගෙන ගත්තේ. පාසැල් ගියේ මිනුවන්ගොඩ නාලන්ද විද්‍යාලයට. </p><br>
                                        <p><b>I’m Looking For</b></p>
                                        <p>මම කැමති බොහොම චාම් ගතිගුණ තියෙන ලස්සන හදවතක් තියෙන කෙනෙකුට. හොදට ඉගෙන ගෙන තියෙනවනම් ගොඩක් හොදයි.</p>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="example3" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">Light-Hearted and Silly</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>I may not be a supermodel, but at least I smell nice… well, that's what my grandma tells me.
                                            On my days off, you'll either find me playing Candy crush or cuddling my 6-month-old nephew Dineth. </p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>I spend my time working as part-time chef.
                                            Cooking is one of my greatest passions in life and I dream of one day starting my own restaurant.
                                            Ultimately, I'd like to be known for serving the most delicious pizza and fried rice with meat balls.</p><br>
                                        <p><b>I’m Looking For</b></p>
                                        <p>I'm looking for a partner-in-crime who enjoys the outdoors and isn't afraid to step
                                            on the dancefloor from time-to-time. Don't worry if you have 'two left feet' ;).</p>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="example4" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">Genuine and Modest</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>I'm the type of person who likes to seize opportunities and make the most of every day.
                                            I am very close to my family and I make sure to spend at least one day a week doing something fun with my sisters.
                                            Whether we're watching a movie, playing guitar or cooking , we always have an amazing time together.</p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>I'm 28 years old and work as a customer executive 
                                            Hemas hospital. I can honestly say that I love my job because it gives me the opportunity
                                            to connect with people on a daily basis.
                                            I work the night shift, which sometimes gets a bad rap, but it also comes with many lifestyle bonuses. 
                                        </p><br>
                                        <p><b>I’m Looking For</b></p>
                                        <p>Above all else, I value honesty and kindness in a partner,
                                            so if you’re a genuine person with a lust for life, sends me a message!</p>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="example5" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">Goofy and Sarcastic</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>I tie my own shoes, brush my own hair, and make my own bed... (well, only if my amma isn't at home.) During the day,
                                            I can be found sitting in an office cubicle, 
                                            feverishing tapping my phone with hopes of getting a new high score on Candy Crush. </p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>Well I work in a place where I get to use my mouth a lot.
                                            Yeh.. Im working in a radio station. Talking to majority of the Sri Lankans.</p><br>
                                        <p><b>I’m Looking For</b></p>
                                        <p>I wish to have a cute girl who would love me and care for me.
                                            If you also like to play Candycrush that will be a bonus.</p>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="example6" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">Simple, Funny and To-The-Point</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>1. Sarcastic, sophisticated, sensitive and free-spirited. Also a fan of All blacks. <br>
                                            2. Nomadic Adventurer. I've set foot on 5 continents and have a thirst for exploring more. I hope to one day go vacationing on Mars as I've heard the mountains are glorious.
                                        </p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>1.	A wizard in the Office. My subordunate once told me that I was his idol...
                                            Ok, maybe not, but I'm sure he'd love to work with me as he feels the 
                                            sound leadership qualities in me..</p><br>
                                        <p><b>I’m Looking For</b></p>
                                        <p>1. Intelligent, sweet, down-to-earth and adventurous. <br>
                                            2. I'm attracted to people who set big goals and put all their effort into pursuing them..<br>
                                            3. A non-smoker... or at least trying to quit. As open-minded as I am. I can't stand their smell and don't want to be around smoke all the time.<br>
                                            4. Pet-friendly. My cat Blakie loves to meet new people.<br>
                                        </p>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="example7" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">Sincere and Sweet</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>I thought it would be fun to try out this online dating thing, as many of my friends have recommended it. 
                                            So without further ado, here are a few tidbits about myself. Family is very important to me, and 
                                            I make it a point to have dinner with my folks at least twice a week. 
                                            It has always been a dream of mine to have a large family of my own one day - the more kids the merrier.</p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>I spend my days working as a Social Media director at a nationwide travel agency. In a nutshell,
                                            this means I get to fly across the country and make posts about our company on Twitter, Instagram and Facebook.
                                            The traveling is exciting, however the nature of my job has sorta, kinda turned me into an internet addict.
                                            9 times out of 10, when I enter an unfamiliar building, the first thought that comes to my mind is:
                                            "Does this place have wi-fi?". 
                                            Fortunately, I find time to play baseball twice a week, which keeps me from turning into a potato.</p><br>
                                        <p><b>I’m Looking For</b></p>
                                        <p>Anyway, if you're not allergic to musicians or a clever sense of humor, feel free to send me a message!</p>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="example8" >
                                    <div class="col-sm-12" style="padding-left: 10px">
                                        <h3 style="text-align: center;">Straight forward and Down-to the-Earth</h3>

                                        <p><b>Myself & Family</b></p>
                                        <p>Travelling is also a major passion of mine, and I spend a lot of my free-time planning out future adventures.
                                            I would love to travel through South America sometime, especially Argentina.
                                            Something about the culture just speaks to me... not to mention, they make fantastic wine.</p><br>
                                        <p><b>Work & Education</b></p>
                                        <p>I'm a graduate of Moratuwa University, where I graduated in engineering. And reading is my biggest hobby... 80% 
                                            of the time you'll find me with my nose deep in a book.
                                            I am currently engage in a private firm which specializes in construction.</p><br>
                                        <p><b>I’m Looking For</b></p>
                                        <p>As for the kind of woman I'm looking for... she knows what she wants out of life and has her finances in check.
                                            She enjoys the outdoors, tries to eats healthy and likes to take a midnight stroll from time-to-time.</p>
                                    </div>

                                </div>



                            </div>
                        </div><!--/category-tab-->



                    </div>
                </div>
            </div>
        </section>




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
        <script src="js/main.js"></script>
        <script src="js/my.js"></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-70139440-1', 'auto');
  ga('send', 'pageview');

</script>

    </body>
</html>
