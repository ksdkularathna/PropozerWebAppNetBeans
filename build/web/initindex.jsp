<%-- 
    Document   : newindex
    Created on : Jul 7, 2015, 10:51:38 PM
    Author     : Anushka Isuru
--%>

<%@page import="com.hib.mappings.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%
        User user = null;
        try {
            user = (User) request.getSession().getAttribute("loguser");
            request.setAttribute("userid", user.getIduser());
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
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>PROPOZER - Home</title>

        <!-- CSS -->
        <link href="css/intro_1.css" rel="stylesheet">
        <link href="css/home_slider.css" rel="stylesheet">
        <link href="css/home_login.css" rel="stylesheet">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="css/sweetalert.css">

        <!-- Alert Js -->
        <script src="js/alert/sweetalert-dev.js"></script>      
        <meta name="description" content="Propozer is a unique, Confidential, innovative and professional way of finding partners. We offer you the best possible matches of grooms and brides according to your wish. Join FREE!" />
        <meta name="keywords" content="find love, find a girlfriend, find a boy friend, propozer, proposal, place for love, wedding, matchmaking, matchmaking service, matrimonial, life partner, Astrology Matching, Matrimonial, Matrimony, Sri lankan Matrimonial, Srilanka Matrimonials, free matrimonial site, matrimonial sites Sri Lanka, matrimonial lk, matrimonial websites, bridegroom, Online Matrimonials" />
        <meta name="author" content="metatags generator">

        <!-- popup boxes display when mouse over them -->
        <style type="text/css">
            .popup {
                position: absolute !important;
                background: #e0e0e0;
                border: 2px solid;
                border-color: #e1335a;
                padding: 8px;
                display: none;
                border-radius: 8px;
                font-size: 12px;
                font-family: Verdana,Tahoma,Arial,sans-serif ;
                opacity: 0.9;
                text-align: center;


            }

        </style>

        <script type="text/javascript">
            function initSearch() {
                sweetAlert("Sign up Successful !", "Please check your email for the verfication code ", "success");
                document.getElementById("city").value = "Any";
                document.getElementById("age_from").value = "Any";
                document.getElementById("age_to").value = "Any";
                document.getElementById("m_status").value = "Any";
                document.getElementById("religion").value = "Any";
                document.getElementById("edu_level").value = "Any";

            <%if (err.equals("")) {
                } else {%>
                document.getElementById('login_error').innerHTML = '<%=err%>';
                login_active(); // Activate login Dropdown

            <%}%>
                //alert("done");
            }
        </script>

    <body id="language-english" onload="initSearch()" style="background-color: white;">

        <ul class="cb-slideshow">
            <li><span></span><div><h3> </h3></div></li>

        </ul>


        <div id="back" style="background-size: contain;position: absolute; height:660px; width:100%; -webkit-background-size:cover;-moz-background-size: cover;-o-background-size:cover;background-size:cover;">
        </div>

        <div id="wrapper">
            <div id="header" >

                <nav style="position:fixed; right: 120px; top: 0; z-index: 1000;">
                    <ul>
                        <%if (user == null) {%>
                        <li id="login" class="item login">
                            <a id="login-trigger" href="#">
                                Log in <span>▼</span>
                            </a>
                            <div id="login-content">

                                <form action="initLogin" method="post">
                                    <fieldset id="inputs">
                                        <label id="login_error" style="color: white; font-weight: bold;"></label> 
                                        <input id="username" type="text" value="<%=newuser%>" name="username" placeholder="Enter your Email" required>
                                        <input id="password" type="password" name="key" placeholder="Enter the verification key">
                                    </fieldset>
                                    
                                    <fieldset id="actions">
                                        <input type="submit" id="submit" value="Log in">

                                    </fieldset>
                                </form>
                            </div>
                        </li>
                        <%} else if (user != null) {%>
                        <li class="item login" style="padding:0px;">

                            <a href="member.jsp" id="login-trigger"  >My Profile |</a>                           
                            <div class="box">
                            </div>
                        </li> 

                        <li class="item login" style="padding:0px;">

                            <a href="logout" id="login-trigger" style="font-weight: normal" >Logout</a>                            
                            <div class="box">
                            </div>
                        </li>                       
                        <%}%>

                    </ul>
                </nav>



            </div><!-- /#header -->

            <div id="main">

                <div id="left" style="padding-top: 8px;">
                    <a id="logo" href="index.jsp"><img src="img/new%20logo.png" alt="Propozer |Find Your Better Half|" height="56" width="274"></a>

                </div>
                <div id="left" style="padding-left: 20px;">
                    <h1 style="font-weight: 400; font-size:22px; ">No More Waiting, Find Your Better Half... In Secret</h1>
                </div>

                <div id="right" class="registration">
                    <form action="basicSearch" method="post" class="form form-register">
                        <div class="alternative">
                            <%if (user == null) {%>
                            <ul><li class="fb">
                                    <div class="ButtonGroup">

                                        <div class="ButtonGroup-buttons">                                            
                                            <a class="connect-vk" href="signup_1.jsp">
                                                <i class="Icon"></i>
                                                <span>Sign up with <span style="font-weight: bold !important; padding-right: 0px !important; ">Email</span></span>
                                            </a>

                                        </div>
                                    </div>
                                    <div class="ButtonGroup">

                                        <div class="ButtonGroup-buttons">                                            
                                            <a class="connect-fb" href="signup.jsp">
                                                <i class="Icon"></i>
                                                <span>Sign up with <span style="font-weight: bold !important; padding-right: 0px !important; ">Facebook</span></span>
                                            </a>

                                        </div>
                                    </div>



                                    <em>We will never post anything to your facebook account.</em>
                                </li>
                            </ul>
                            <%}%>
                            <div class="or">

                                <span style="font-weight: bold;">I am looking for...</span> 

                            </div>
                        </div>
                        <div id="form_fields">
                            <div class="row">
                                <label class="label" for="sex">Gender</label>
                                <div class="field field-sex">

                                    <label class="female"><input id="Male" name="gender" value="Female" type="radio" required> <i></i> Woman</label>
                                    <label class="male"><input id="Female" name="gender" value="Male" type="radio" required> <i></i> Man</label>
                                </div>
                                <span class="error"><i></i><span></span></span>
                                <i class="valid "></i>
                            </div>

                            <div class="row">
                                <label class="label" for="cities">City</label>
                                <div class="field field-age awesome-select">
                                    <div class="placeholder">
                                        <div class="fld">&nbsp;</div>
                                        <a><i></i></a>
                                    </div>
                                    <select class="fld real-select" name='city' data-target=".placeholder .fld" id='city'>
                                        <option selected="selected" value='Any'>Any
                                        </option><option value='Ampara'>Ampara
                                        </option><option value='Anuradhapura'>Anuradhapura
                                        </option><option value='Badulla'>Badulla
                                        </option><option value='Batticaloa'>Batticaloa
                                        </option><option value='Colombo'>Colombo
                                        </option><option value='Galle'>Galle
                                        </option><option value='Gampaha'>Gampaha
                                        </option><option value='Hambantota'>Hambantota
                                        </option><option value='Jaffna'>Jaffna
                                        </option><option value='Kalutara'>Kalutara
                                        </option><option value='Kandy'>Kandy
                                        </option><option value='Kegalle'>Kegalle
                                        </option><option value='Kilinochchi'>Kilinochchi
                                        </option><option value='Kurunegala'>Kurunegala
                                        </option><option value='Mannar'>Mannar
                                        </option><option value='Matale'>Matale
                                        </option><option value='Matara'>Matara
                                        </option><option value='Moneragala'>Moneragala
                                        </option><option value='Mullaitivu'>Mullaitivu
                                        </option><option value='Nuwara Eliya'>Nuwara Eliya
                                        </option><option value='Polonnaruwa'>Polonnaruwa
                                        </option><option value='Puttalam'>Puttalam
                                        </option><option value='Ratnapura'>Ratnapura
                                        </option><option value='Trincomalee'>Trincomalee
                                        </option><option value='Vavuniya'>Vavuniya</option></select>


                                </div>
                                <span class="error"><i></i><span></span></span>
                                <i class="valid"></i>
                            </div>

                            <div class="row">
                                <label class="label" for="m_status">Marital Status</label>
                                <div class="field field-age awesome-select">
                                    <div class="placeholder">
                                        <div class="fld">&nbsp;</div>
                                        <a><i></i></a>
                                    </div>

                                    <select class="fld real-select" name="m_status" id="m_status" data-target=".placeholder .fld">
                                        <option selected="selected" value="Any" selected="selected">Any</option>
                                       
                                        <option value="Single" >Single</option>
                                        <option value="Divorced">Divorced</option>
                                        <option value="Widowed">Widowed</option>

                                    </select>

                                </div>
                                <span class="error"><i></i><span></span></span>
                                <i class="valid"></i>
                            </div>

                            <div class="row">
                                <label class="label" for="edu_lvl">Education</label>
                                <div class="field field-age awesome-select">
                                    <div class="placeholder">
                                        <div class="fld">&nbsp;</div>
                                        <a><i></i></a>
                                    </div>

                                    <select  class="fld real-select" name='edu_level' id='edu_level' data-target=".placeholder .fld">
                                        <option selected="selected" value='Any'>Any</option>
                                        <option value='Passed A/L'>Passed A/L
                                        </option><option value='Passed O/L'>Passed O/L
                                        </option><option value='Bachelors'>Bachelors
                                        </option><option value='Masters'>Masters
                                        </option><option value='Doctorate'>Doctorate
                                        </option><option value='Other'>Other
                                    </select>

                                </div>
                                <span class="error"><i></i><span></span></span>
                                <i class="valid"></i>
                            </div>
                            <div class="row">
                                <label class="label" for="religion">Religion</label>
                                <div class="field field-age awesome-select">
                                    <div class="placeholder">
                                        <div class="fld">&nbsp;</div>
                                        <a><i></i></a>
                                    </div>
                                    <select class="fld real-select" data-target=".placeholder .fld" name='religion' id='religion'>
                                        <option selected="selected" value='Any'>Any</option>
                                        <option value='Buddhist'>Buddhist
                                        </option><option value='Catholic'>Catholic
                                        </option><option value='Islam'>Islam
                                        </option><option value='Hindu'>Hindu
                                        </option><option value='Other'>Other
                                        </option></select>


                                </div>
                                <span class="error"><i></i><span></span></span>
                                <i class="valid"></i>
                            </div>



                            <input name="country" value="42094" type="hidden">



                            <div class="row">
                                <label class="label" for="sex">Age</label>


                                <label class="female">
                                    <div class="field field-age awesome-select" >
                                        <div class="placeholder" style="width:60px;">
                                            <div class="fld" style="width:18px;">&nbsp;</div>
                                            <a><i></i></a>
                                        </div>
                                        <select class="fld real-select" data-target=".placeholder .fld" style="width: 50px" name='age_from' id='age_from'><option selected="selected" value='Any'>Any</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option><option value='32'>32</option><option value='33'>33</option><option value='34'>34</option><option value='35'>35</option><option value='36'>36</option><option value='37'>37</option><option value='38'>38</option><option value='39'>39</option><option value='40'>40</option><option value='41'>41</option><option value='42'>42</option><option value='43'>43</option><option value='44'>44</option><option value='45'>45</option><option value='46'>46</option><option value='47'>47</option><option value='48'>48</option><option value='49'>49</option><option value='50'>50</option><option value='51'>51</option><option value='52'>52</option><option value='53'>53</option><option value='54'>54</option><option value='55'>55</option><option value='56'>56</option><option value='57'>57</option><option value='58'>58</option><option value='59'>59</option><option value='60'>60</option><option value='61'>61</option><option value='62'>62</option><option value='63'>63</option><option value='64'>64</option><option value='65'>65</option></select>
                                    </div>

                                </label>
                                <label class="male">

                                    <div class="field field-age awesome-select" >
                                        <div class="placeholder" style="width:60px;">
                                            <div class="fld" style="width:18px;">&nbsp;</div>
                                            <a><i></i></a>
                                        </div>
                                        <select class="fld real-select" data-target=".placeholder .fld" style="width: 50px" name='age_to' id='age_to'><option selected="selected" value='Any'>Any</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option><option value='32'>32</option><option value='33'>33</option><option value='34'>34</option><option value='35'>35</option><option value='36'>36</option><option value='37'>37</option><option value='38'>38</option><option value='39'>39</option><option value='40'>40</option><option value='41'>41</option><option value='42'>42</option><option value='43'>43</option><option value='44'>44</option><option value='45'>45</option><option value='46'>46</option><option value='47'>47</option><option value='48'>48</option><option value='49'>49</option><option value='50'>50</option><option value='51'>51</option><option value='52'>52</option><option value='53'>53</option><option value='54'>54</option><option value='55'>55</option><option value='56'>56</option><option value='57'>57</option><option value='58'>58</option><option value='59'>59</option><option value='60'>60</option><option value='61'>61</option><option value='62'>62</option><option value='63'>63</option><option value='64'>64</option><option value='65'>65</option></select>
                                    </div>




                                </label>

                                <span class="error"><i></i><span></span></span>
                                <i class="valid "></i>
                            </div>


                            <p class="legal">
                                By clicking "Search" below, You can see results as your interest.
                                <br>But you cannot propose them until become a member of <a href="About.jsp" tabindex="-1">Propozer.lk</a>. <br>
                            </p>

                            <div class="actions">
                                <button type="submit" class="btn green big" id="btn_submit"><span><span ">Search</span></span></button>
                            </div>
                        </div>

                    </form></div><!-- /#right -->











                <div id="girlsz" style="height:0px; padding-top: 490px ;padding-left: 90px;">

                    <table class="table"  align="left" >
                        <tr>
                            <td style="padding-right: 27px;"><img src="images/h1.png" alt="Propozer |Find Your Better Half|" height="118" width="120" data-tooltip="#foo1" >
                                <div class="popup" id="foo1">
                                    Go through the details and sport the best match.
                                </div>
                            </td>
                            <td style="padding-right: 27px;"><img src="images/h2.png" alt="Propozer |Find Your Better Half|" height="118" width="120" data-tooltip="#foo2">
                                <div class="popup" id="foo2">
                                    Make a proposal, Once it get accepted,<br> both parties can see their photos.
                                </div>
                            </td>
                            <td style="padding-right: 0px;"><img src="images/h3.png" alt="Propozer |Find Your Better Half|" height="118" width="120" data-tooltip="#foo3"></td>
                        </tr>


                        <div class="popup" id="foo3">
                            Now it's time for a chat. <br>Get to know each other and share your thoughts.
                        </div>
                    </table>

                </div><!-- /#text -->

                <div id="girls" style="height:100px; padding-top:0px;padding-left: 670px;">
                    <h2 style="color:#ffffff; text-shadow: 0 1px 0 #333; font-weight:normal;">
                        <i class="flag flag-lk"></i>100% Free and Easy profile registration
                    </h2>

                </div><!-- /#text -->
            </div><!-- /#main -->  

            <div id="bottom" style="margin-top:50px; padding: 30px 20px 10px 20px; background-color: #f8f8f8;opacity: 0.8;">
                <div id="text" style="padding-left: 15px;">
                    <h2 style="color:#e2335b;">Propozer Protect Privacy!!</h2>

                    <h3>Your Privacy is our Concern </h3>
                    <div style="padding: 10px; padding-left: 5px;">
                        <table class="table" id="customers" align="center" >
                            <tr></tr>
                            <tr >
                            <p class="middle_font" style="margin-bottom:20px;">
                      Your photos will not be displayed in the search results. If some one wants to see your photos,
                      first he/she will have to propose to you and you will have to accept it. <br>
                            Your name or contact details will not be displayed anywhere in the site. You can use our chat facility to get to know him/her more and 
                            share contact information only if you feel safe...</p>
                            </tr>
                            <tr><br>
                                Learn more about <a href="About.jsp"><i>Propozer.lk</i></a> 
                            </tr>
                           

               
                        </table>

                    </div>
                    <br>
                  
                        <br>

                    </p>






                </div><!-- /#text -->

                <div id="right_bottom" style="width:520px; padding-top: 30px;">

                    <div id="about" style="width:300px;">

                        <!-- Overlays -->
                       <iframe width="462" height="260" src="https://www.youtube.com/embed/ejj44R749xA" frameborder="0" allowfullscreen></iframe>

                    </div>
                </div>




                <div id="bottomfeet" style="width: 100%; height: 130px;  padding-bottom: 50px; padding-top: 320px;">

                    <table>
                        <tr>
                            <td style="width: 340px; height: 100px; padding: 10px;">
                                <div class="companyinfo">
                                    <h2><span>Propozer</span>.lk</h2><br>
                                    <p> Confidential, innovative and professional way of finding partners.</p>
                                </div>
                                </div>
                            </td>

                            <td style="width: 200px; height: 100px;">
                                <div>
                                    <img style="display: block;
                                         height: 61px;
                                         margin-bottom: 10px;
                                         border: 2px solid #CCCCC6;
                                         border-radius: 3px;" src="images/home/iframe1.png" alt="" />
                                </div>


                            </td>


                            <td style="width: 200px; height: 100px;">

                                <div>
                                    <img style="display: block;
                                         height: 61px;
                                         margin-bottom: 10px;
                                         border: 2px solid #CCCCC6;
                                         border-radius: 3px;" src="images/home/iframe2.png" alt="" />
                                </div>


                            </td>
                            <td style="width: 200px; height: 100px; ">


                                <div>
                                    <img style="display: block;
                                         height: 61px;
                                         margin-bottom: 10px;
                                         border: 2px solid #CCCCC6;
                                         border-radius: 3px;" src="images/home/iframe3.png" alt="" />
                                </div>


                            </td>
                            <td style="width: 200px; height: 100px; ">


                                <div>
                                    <div class="address" >
                                        <img src="images/home/map.png" alt="Sri Lanka" />
                                        <p style="left: 40px;" >The Best place to find<br> a partner in Sri Lanka!</p>
                                    </div>
                                </div>


                            </td>
                        </tr>

                    </table>



                </div>

            </div>
            <div id="footer" style="background-color: #ffffff; margin-top: 30px; padding: 10px; opacity: 0.7;">
                <ul class="navigation">
                  
                    <li><a href="FAQ.jsp">FAQ</a></li>
                    <li class="sep"></li>
                    <li><a href="Contact.jsp">Contact Us</a></li>
                    <li class="sep"></li>
                    <li><a href="Terms&Conditions.jsp">Terms & Conditions</a></li>
                    <li class="sep"></li>
                    <li><a href="Disclaimers.jsp">Disclaimers</a></li>
                    <li class="sep"></li>
                    <li><a href="Copyright_Policy.jsp">Copyright Policy</a></li>
                    <li class="sep"></li>
                    <li><a href="About.jsp">About Us</a></li>
                </ul><!-- /.navigation -->

                <p>
                    All rights are reserved. 2016 © propozer.lk    
            </div><!-- /#footer -->

        </div><!-- /#wrapper -->



        <!-- /Overlays -->

        <!-- JS -->

        <script src="js/fb/jquery.js"></script>
        <script type="text/javascript" src="js/fb/intro.js"></script>
        <script src="js/my.js"></script>


        <script> // login dropdownmenu
                                        $("img").hover(function(e) {
                                            $($(this).data("tooltip")).css({
                                                left: e.pageX - 180,
                                                top: e.pageY + 1
                                            }).stop().show(300);
                                        }, function() {
                                            $($(this).data("tooltip")).hide();
                                        });


                                        function forget_password() {
                                            swal({
                                                title: "Forgot your Password ?",
                                                text: 'Enter your Email',
                                                type: 'input',
                                                showCancelButton: true,
                                                closeOnConfirm: false,
                                                animation: "slide-from-top",
                                                inputPlaceholder: "Username or FB name",
                                            },
                                                    function(inputValue) {
                                                        if (inputValue === false)
                                                            return false;

                                                        if (inputValue === "") {
                                                            swal.showInputError("Enter your Username or Facebook name");
                                                            return false;
                                                        } else {
                                                            checkUser(inputValue);
                                                        }

                                                        //swal("Nice!", 'Recovery link sent to: ' + inputValue, "success");

                                                    });

                                        }
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
                                        function checkUser(user_input) {
                                            //alert("ajax");                                   
                                            xmlHttp = getXMLHTTPRequest();
                                            if (xmlHttp == null) {
                                                alert("No Ajax Object in DOM");
                                            } else {
                                                xmlHttp.open("POST", 'checkUser', true);
                                                xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                                //alert();
                                                xmlHttp.send('input_name=' + user_input);
                                                //alert("send");
                                                xmlHttp.onreadystatechange = function() {
                                                    if (xmlHttp.readyState == 4) {
                                                        var res = xmlHttp.responseText;
                                                        //alert(res);
                                                        if (res == "fail") {
                                                            swal.showInputError("Username or facebook name is not valid");
                                                        }
                                                        if (res == "ok") {
                                                            swal("Nice!", 'Account Recovery details sent to your email account', "success");
                                                            setTimeout(redirect, 3000);
                                                        }


                                                    }
                                                }
                                            }
                                        }

                                        $(document).ready(function() {

                                            $('#login-trigger').click(function() {
                                                $(this).next('#login-content').slideToggle();
                                                $(this).toggleClass('active');

                                                if ($(this).hasClass('active'))
                                                    $(this).find('span').html('&#x25B2;');
                                                else
                                                    $(this).find('span').html('&#x25BC;');
                                            });
                                            if (window.location.hash === '#active_login') {
                                                login_active();
                                                document.getElementById("username").focus();
                                            }
                                            if (window.location.hash === '#active_login_user')// signup.java line no 75
                                            {
                                                login_active();
                                                document.getElementById("password").focus();
                                            }
                                        });

                                        function login_active() {
                                            document.getElementById("password").focus();
                                            $('#login-trigger').next('#login-content').slideToggle();
                                            $(this).toggleClass('active');

                                            if ($(this).hasClass('active'))
                                                $(this).find('span').html('&#x25B2;');
                                            else
                                                $(this).find('span').html('&#x25BC;');

                                        }
                                        function redirect() {
                                            window.location = 'login.jsp';
                                        }


        </script>

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



    </body></html>