<%-- 
    Document   : Signup
    Created on : Jun 5, 2015, 12:54:26 PM
    Author     : Anushka Isuru
--%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet">
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
    <style>

        .accordion-toggle{ font-weight: normal;}
        .accordion-toggle strong{
            color: #1a9efb;
            font-weight: normal;

        }

        .faqHeader {
            font-size: 24px;
            margin: 20px;
            color: #1a9efb;
        }
        .faqHeader1 {
            font-size: 24px;
            margin: 0px 20px 20px 20px;

            color: #1a9efb;
        }
        .panel-heading [data-toggle="collapse"]:after {

            font-family: 'Glyphicons Halflings';
            content: "\e072"; /* "play" icon */
            float: right;
            color: #1a9efb;
            font-size: 14px;
            line-height: 22px;
            /* rotate "play" icon from > (right arrow) to down arrow */
            -webkit-transform: rotate(-90deg);
            -moz-transform: rotate(-90deg);
            -ms-transform: rotate(-90deg);
            -o-transform: rotate(-90deg);
            transform: rotate(-90deg);
        }

        .panel-heading [data-toggle="collapse"].collapsed:after {

            /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
            -ms-transform: rotate(90deg);
            -o-transform: rotate(90deg);
            transform: rotate(90deg);
            color: #767575;
        }
    </style>
        
        
    </head>
    <body>

        <script src="js/FB_SDK_signup.js"></script>
        
   
             <%@ include file="header.jsp" %>
       

        

  <section id="level_1" ><!--Home Body Section 1-->
     </section><!--/Home Body Section 1-->

    <div class="header-middle2"><!--Language button-->
        <div class="container" >
            <div class="row">
                <h2 style="padding-top: 20px" class="title text-center">FAQ</h2>
                <div class="col-sm-6">
                    <div class="shop-menu pull-right">

                    </div>
                </div>

                  <div class="col-sm-4">
                    <div class="btn-group pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default language" onClick="replaceContentInContainer('faq_English','faq_Sinhala')" >
                                සිංහල
                            </button>

                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-default language" onClick="replaceContentInContainer('faq_English','faq_English_Hide')">
                                English
                            </button>

                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="shop-menu pull-right">

                    </div>
                </div>
            </div>
        </div>
    </div><!--/Language button-->






    <section>
        <div class="container"  >
            <div class="row">
                <div class="col-sm-2">
                    <div class="left-sidebar">

                    </div>
                </div>

                <div class="col-sm-8" style="margin-top: 0px; padding-top: 0px;">
                    <div class="blog-post-area"  style="margin-top: 0px; padding-top: 0px;">

                        <div class="panel-group"  id="faq_English"> <!--FAQ English version [[CURRENTLY DISPLAY]]-->
                            <div class="faqHeader1">General Questions</div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" >How I become a member of <strong>Propozer</strong> ?</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        All you have to do is register yourself using your Facebook account. By using "Singup with facebook" button on top of the homepage you can easily register in <strong>Propozer</strong>.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">How much money do I have to pay for membership ?</a>
                                    </h4>
                                </div>
                                <div id="collapseTen" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        It is absolutely FREE of cost. Submit your profile is absolutely free of cost.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">How <strong>Propozer</strong> works ?</a>
                                    </h4>
                                </div>
                                <div id="collapseEleven" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ol>
                                            <li>Register an account using facebook.</li>
                                            <li>Fill your profile. (Make sure all the information are correct)</li>
                                            <li>Search for a partner. (Use the filter options as your interest)</li>
                                            <li>Analyse anonymous search results and send requests for them.</li>
                                            <li>If member accept your request, only profile pictures will be shared between two of you.</li>
                                            <li>Also you can chat with accepted members.</li>
                                            <li>If you feel that you got the right partner both of you can share your identification.</li>
                                            <li>Then tell us your success story.. Happy Journey !!!</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>


                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">How <strong>Propozer</strong> differ from others ?</a>
                                    </h4>
                                </div>
                                <div id="collapseTwelve" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ol>
                                            <li>100% free</li>
                                            <li>Full professional service</li>
                                            <li>100% confidential user information. (we will newer share even your photo to public)</li>
                                            <li>Cool and calm environment for the users.</li>

                                        </ol>

                                    </div>
                                </div>
                            </div>


                            <div class="faqHeader">Propozer Profiles</div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Is my personal information safe ?</a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Our major promise is to give 100% confidential service for our members. We never share member's photos or signature without their permission.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Which information will be displayed to other party from my profile ?</a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">

                                        Any one can view only some of your details. They cannot view your photo, name, work place, email etc (Can't view any of information which can guess your identification).
                                        If a member accepts request of another member, only profile pictures will be shared between them. Further, accepted members can share their name and work place if they want.

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">How <strong>Propozer</strong> manage fake accounts ?</a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        We follow basic security steps to verify user details when user registering. Users can complain about fake account,  <strong>Propozer</strong> team will analysis those accounts and will take appropriate actions.
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">What is the purpose behind Instant Messenger, how do i get benefit from it ?</a>
                                    </h4>
                                </div>
                                <div id="collapseSix" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        This application is the fastest way of communicating to other members of the site who accepts your proposal request.
                                        It lists all the members who are accepted. When you send message, recipient will receive message and would reply.
                                        This is best way to share your interest with members.

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">How will I know if a member has accepted/declined my propose request ?</a>
                                    </h4>
                                </div>
                                <div id="collapseEight" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        You will be notified via notification when a member accepts your propose request.
                                        What you want to do, login to your account and select the 'Notifications' option under second menu to know how many members have accepted your interest.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">How do I improve my chances of finding a match ?</a>
                                    </h4>
                                </div>
                                <div id="collapseNine" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Try to give a clear self-description. Enter your expectations clearly and completely. Add your photo to your profile as profiles with photos get a better response.
                                    </div>
                                </div>
                            </div>

                            <div class="faqHeader">Additional</div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">I haven't facebook account, so how I register on <strong>Propozer</strong> ?</a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Go Contact_Us page and leave us a message. Then <strong>Propozer</strong> team will contact you and after verifying your details they will create an account for you.

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">My question is not answered in FAQ, what should I do ?</a>
                                    </h4>
                                </div>
                                <div id="collapseSeven" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Contact Us, we will have it answered within two working days.
                                    </div>
                                </div>
                            </div>
                        </div><!--/FAQ English version [[CURRENTLY DISPLAY]]-->

                        <div class="panel-group" id="faq_Sinhala" style="display:none">
                                     <div class="faqHeader1">මුලික ගැටළු</div>
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><strong>Propozer</strong>හි ගිණුමක් අරබන්නේ කෙසේද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseOne" class="panel-collapse collapse in">
                                             <div class="panel-body">
                                                 අපගේ ප්‍රධාන පිටුවේ ඇති "Singup with facebook" බොත්තම ක්ලික් කිරීම මගින් ඔබගේ Facebook ගිණුම හරහා පහසුවෙන් නව ගිණුමක් සදහා ඇති විශේෂ පිටුව වෙතට පිවිසිය හැක.
                                                 පළමු වතාවේදී පමණක් Facebook ගිණුම හරහා ප්‍රවේශ වීම සිදුවන අතර පසුව ඔබ කැමති පරිශීලක නාමයක් හා මුරපදයක් ගිණුම සදහා තෝරාගත හැක.
                                             </div>
                                         </div>
                                     </div>
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">සාමජිකත්වය සදහා මුදල් ගෙවීමක් අවශ්‍යද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseTen" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 නැත, සේවාව සම්පුර්ණයෙන් නොමිලේ ලබාදෙන්නකි.
                                             </div>
                                         </div>
                                     </div>
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">සහකරුවෙකු සොයාගැනීම සදහා  වූ <strong>Propozer</strong> ක්‍රියාවලිය කෙසේද?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseEleven" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 <ol>
                                                     <li>පළමුව Facebook ගිණුමක් හරහා වෙබ් අඩවියේ ලියාපදිංචිවන්න.</li>
                                                     <li>ගිණුම සදහා වූ සියලු විස්තර නිවැරදිව හා අවංකව සම්පුර්ණ කරන්න</li>
                                                     <li>ඔබට අවශ්‍ය සහකරු සදහා සෙවුමක් අරබන්න. සෙවුමේ ඇති විකල්ප භාවිතා කරමින් වඩාත්ම ගැලපෙන ප්‍රතිපල තෝරාගන්න.</li>
                                                     <li>නිර්නාමික ප්‍රතිපල අධ්‍යනය කර සුදුසු අයවලුන් සදහා යෝජනාවක් යවන්න.</li>
                                                     <li>යවන ලද යෝජනා එම පාර්ශවයන් විසින් පිළිගත්තේ නම් ඔබ දෙදෙනාගේ චයාරුප බැලීමට අවසර හිමිවේ.</li>
                                                     <li>යෝජනා පිළිගත් පාර්ශවයන් සමග  පණිවිඩ හුවමාරුවත් සංවාදයේ යෙදීමටත් පහසුකම්.</li>
                                                     <li>විස්තර ගැලපීමෙන් හා පණිවිඩ හුවමාරුවෙන් පසු කැමති නම් දෙදෙනාගේ අනන්‍යතාවයන් හුවමාරු කරගත හැක.</li>
                                                     <li>ඔබගේ සාර්ථකත්වය අපත් සමග බෙදාගන්න. සුබපැතුම්..!</li>
                                                 </ol>
                                             </div>
                                         </div>
                                     </div>





                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve"><strong>Propozer</strong> හි වෙනස ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseTwelve" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 <ol>
                                                     <li>සම්පුර්ණයෙන්ම නොමිලේ.</li>
                                                     <li>විශිෂ්ට කාර්යක්ෂම සේවාව. </li>
                                                     <li>සාමාජික දත්ත සම්පුර්ණයෙන්ම රහසිගතව සුරක්ෂිත කිරීම.</li>
                                                     <li>ආකර්ශනීය අතුරුමුහුණත් .</li>

                                                 </ol>

                                             </div>
                                         </div>
                                     </div>






                                     <div class="faqHeader">ගිණුම් පිළිබද ගැටළු</div>
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">මාගේ පෞද්ගලික දත්ත ආරක්ශිතද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseTwo" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 <strong>Propozer</strong> හි සාමාජිකයන්ගේ පෞද්ගලික දත්ත අවභාවිතයෙන් වැලැක්වීම අපගේ මුලිකම පොරොන්දුවකි. සාමාජිකයන්ගේ චායාරුප හෝ ඔවුන්ගේ අනන්‍යතාවයන් කිසිම විටෙක ප්‍රසිද්ධ නොකරන අතර, සාමාජිකයන් අතර පමණක් දෙපාර්ශවයේ  කැමැත්තෙන් අනන්‍යතාවයන් හුවමාරු කිරීම සිදුවේ.
                                             </div>
                                         </div>
                                     </div>
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">වෙනත් පාර්ශවයන් සදහා දර්ශනය වන මාගේ ගිණුම් තොරතුරු මොනවද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseThree" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 ඕනෑම පාර්ශවයකින් සිදුකරන ගැලපෙන  සෙවුමකින් ඔබගේ යම් විස්තර ප්‍රමාණයක් දර්ශනය කරගත හැකිය. නමුත්  එම විස්තරය  තුල ඔබගේ අනන්‍යතාවය නිර්ණය සදහා වන කිසිදු තොරතුරක් අඩංගු වන්නේ නැත. <br>

                                                 ඔබ යවන ලද යෝජනාවක් පිළිගන්නා  ලද පාර්ශවයකට පමණක් ඔබගේ චයාරුපය දර්ශනය වන අතර, වැඩි දුරටත් ඔබේ  කැමත්ත පරිදි  ඔබගේ අනන්‍යතාවය එම පාර්ශවයට දර්ශනය කල හැක.

                                             </div>
                                         </div>
                                     </div>
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><strong>Propozer</strong>හි ව්‍යාජ ගිණුම් පැවතිය හැකිද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseFive" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 නව ගිණුමක්  පද්ධතියට එකතු  කරගන්නා  සෑම අවස්ථාවකම මුලික ආරක්ෂක පියවර අනුගමනය කරමින් පුද්ගල අනන්‍යතාවය තහවුරු කරගැනීමට අප කටයුතු කරන අතර,  ව්‍යාජ ගිණුම් පිළිබද ඕනෑම විටක අපහට පැමිණිලි කල හැක. <strong>Propozer</strong> කණ්ඩායම එම ගිණුම් ගැන විමර්ශනය කර අවශ්‍ය පියවර ගනු ලබයි.
                                                 <br />
                                             </div>
                                         </div>
                                     </div>

                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">සාමාජිකයෙකු මාගේ යෝජනාව පිළිගෙන තිබේනම් මා එය දෑන ගන්නේ කෙසේද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseEight" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 සාමාජිකයෙකු ඔබේ යෝජනාව පිළිගෙන තිබේ නම් එය පණිවිඩයක් මගින් ඔබට නිවේදනය කරනු ලබයි. ඔබගේ ගිණුමේ මුලික පිටුවේ දෙවැනි මෙනුව තුල පිළිගත් යෝජනා පිළිබද සියලු විස්තර ප්‍රදර්ශනය වේ.
                                         </div>
                                     </div>
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">මාගේ ගැලපීම් අවස්ථා වැඩි කර ගන්නේ කෙසේද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseNine" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 ඔබගේ ගිණුම සදහා පැහැදිලි අවංක ස්වයං විස්තරයක් ලබා දෙන්න. පැහැදිලිව සහ සම්පූර්ණයෙන්ම ඔබේ බලාපොරොත්තු ඇතුල් කරන්න. වඩා හොද ප්‍රතිචාරයක් ලබාගත හැකි ජායාරුපයක් එකතු කරන්න.
                                             </div>
                                         </div>
                                     </div>

                                     <div class="faqHeader">වෙනත් ගැටළු </div>

                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Facebook ගිණුමක් නොමැති මා <strong>Propozer</strong> හි සාමාජිකත්වය ලබා ගන්නේ කෙසේද ? </a>
                                             </h4>
                                         </div>
                                         <div id="collapseFour" class="panel-collapse collapse">
                                             <div class="panel-body">

                                                 Contact Us පිටුව තුලින් අප හට පණිවිඩයක් තබන්න. <strong>Propozer</strong> කණ්ඩායම ඔබව නැවත සම්බන්ද කර ඔබගේ අනන්‍යතාවය සහතික කරගත් පසු ඔබ වෙනුවෙන් ගිණුමක්  නිර්මාණය කිරීමට කටයුතු කරවී.
                                                 </div>
                                         </div>
                                     </div>

                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             <h4 class="panel-title">
                                                 <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">මෙම පිටුව තුල මාගේ පැනයට පිළිතුරු නැත. මා කුමක් කල යුතුද ?</a>
                                             </h4>
                                         </div>
                                         <div id="collapseSeven" class="panel-collapse collapse">
                                             <div class="panel-body">
                                                 Contact Us පිටුව තුලින් අප හට පණිවිඩයක් තබන්න. සිංහල, දමිල, English ඕනෑම භාෂාවකින්  ඔබේ පැනයට පිළිතුරු හැකි ඉක්මනින් සැපයීමට අප බැදී සිටියි.
                                             </div>
                                         </div>
                                     </div>
                                 </div><!--/FAQ Sinhala version [[CURRENTLY HIDE]]-->






                    </div><!--/FAQ Sinhala version [[CURRENTLY HIDE]]-->

                        <div class="panel-group" style="display:none" id="faq_English_Hide">
                            <div class="faqHeader1">General Questions</div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" >How I become a member of <strong>Propozer</strong> ?</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        All you have to do is register yourself using your Facebook account. By using "Singup with facebook" button on top of the homepage you can easily register in <strong>Propozer</strong>.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">How much money do I have to pay for membership ?</a>
                                    </h4>
                                </div>
                                <div id="collapseTen" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        It is absolutely FREE of cost. Submit your profile is absolutely free of cost.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">How <strong>Propozer</strong> works ?</a>
                                    </h4>
                                </div>
                                <div id="collapseEleven" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ol>
                                            <li>Register an account using facebook.</li>
                                            <li>Fill your profile. (Make sure all the information are correct)</li>
                                            <li>Search for a partner. (Use the filter options as your interest)</li>
                                            <li>Analyse anonymous search results and send requests for them.</li>
                                            <li>If member accept your request, only profile pictures will be shared between two of you.</li>
                                            <li>Also you can chat with accepted members.</li>
                                            <li>If you feel that you got the right partner both of you can share your identification.</li>
                                            <li>Then tell us your success story.. Happy Journey !!!</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>


                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">How <strong>Propozer</strong> differ from others ?</a>
                                    </h4>
                                </div>
                                <div id="collapseTwelve" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ol>
                                            <li>100% free</li>
                                            <li>Full professional service</li>
                                            <li>100% confidential user information. (we will newer share even your photo to public)</li>
                                            <li>Cool and calm environment for the users.</li>

                                        </ol>

                                    </div>
                                </div>
                            </div>






                            <div class="faqHeader">Propozer Profiles</div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Is my personal information safe ?</a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Our major promise is to give 100% confidential service for our members. We never share member's photos or signature without their permission.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Which information will be displayed to other party from my profile ?</a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">

                                        Any one can view only some of your details. They cannot view your photo, name, work place, email etc (Can't view any of information which can guess your identification).
                                        If a member accepts request of another member, only profile pictures will be shared between them. Further, accepted members can share their name and work place if they want.

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">How <strong>Propozer</strong> manage fake accounts ?</a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        We follow basic security steps to verify user details when user registering. Users can complain about fake account,  <strong>Propozer</strong> team will analysis those accounts and will take appropriate actions.
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">What is the purpose behind Instant Messenger, how do i get benefit from it ?</a>
                                    </h4>
                                </div>
                                <div id="collapseSix" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        This application is the fastest way of communicating to other members of the site who accepts your proposal request.
                                        It lists all the members who are accepted. When you send message, recipient will receive message and would reply.
                                        This is best way to share your interest with members.

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">How will I know if a member has accepted/declined my propose request ?</a>
                                    </h4>
                                </div>
                                <div id="collapseEight" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        You will be notified via notification when a member accepts your propose request.
                                        What you want to do, login to your account and select the 'Notifications' option under second menu to know how many members have accepted your interest.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">How do I improve my chances of finding a match ?</a>
                                    </h4>
                                </div>
                                <div id="collapseNine" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Try to give a clear self-description. Enter your expectations clearly and completely. Add your photo to your profile as profiles with photos get a better response.
                                    </div>
                                </div>
                            </div>

                            <div class="faqHeader">Additional</div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">I haven't facebook account, so how I register on <strong>Propozer</strong> ?</a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Go Contact_Us page and leave us a message. Then <strong>Propozer</strong> team will contact you and after verifying your details they will create an account for you.

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">My question is not answered in FAQ, what should I do ?</a>
                                    </h4>
                                </div>
                                <div id="collapseSeven" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        Contact Us, we will have it answered within two working days.
                                    </div>
                                </div>
                            </div>
                        </div><!--FAQ Copy of English version [[CURRENTLY HIDE]]-->



                </div>

                <div class="col-sm-2">
                    <div class="left-sidebar">


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
