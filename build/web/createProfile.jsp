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
    try {
        user = (User) request.getSession().getAttribute("loguser");
        request.setAttribute("userid", user.getIduser());
    } catch (Exception e) {
        user = null;
        e.printStackTrace();
    }
%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create USER</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="css/jquery.idealforms.css">
        <link rel="stylesheet" href="css/prf_pic_crop.css" type="text/css" />
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">

        <style>
            level_1 {
                max-width: 780px;
                margin: 2em auto;
                font: normal 15px/1.5 'Roboto', sans-serif;
                color: #353535;
                overflow-y: scroll;
            }
            .content {
                margin: 0 30px;
            }
            .field.buttons button {
                margin-right: .5em;
            }
            #invalid {
                display: none;
                float: left;
                width: 290px;
                margin-left: 120px;
                margin-top: .5em;
                color: #CC2A18;
                font-size: 130%;
                font-weight: bold;
            }
            .idealforms.adaptive #invalid {
                margin-left: 0 !important;
            }
            .idealforms.adaptive .field.buttons label {
                height: 0;
            }
            .container1
            {
                position: absolute;
                top: 10%; left: 10%; right: 0; bottom: 0;
            }
            .action
            {
                width: 534px;
                height: 30px;
                margin: 8px 0;
            }
            .cropped>img
            {
                margin-right: 10px;
            }

        </style> 
        <script type="text/javascript">

            //pro pic script

            window.onload = function() {
                var options =
                        {
                            imageBox: '.imageBox',
                            thumbBox: '.thumbBox',
                            spinner: '.spinner',
                            imgSrc: 'staltic/img/avatar.png'
                        }
                var cropper = new cropbox(options);
                document.querySelector('#file').addEventListener('change', function() {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        options.imgSrc = e.target.result;
                        cropper = new cropbox(options);
                    }
                    reader.readAsDataURL(this.files[0]);
                    this.files = [];
                });
                document.querySelector('#btnCrop').addEventListener('click', function() {
                    var img = cropper.getDataURL();
                    document.querySelector('.cropped').innerHTML = '<img style="width: 259px; height: 259px;" src="' + img + '">';
                });
                document.querySelector('#btnZoomIn').addEventListener('click', function() {
                    cropper.zoomIn();
                });
                document.querySelector('#btnZoomOut').addEventListener('click', function() {
                    cropper.zoomOut();
                });
                document.querySelector('#btnSave').addEventListener('click', function() {
                    var img = cropper.getDataURL();

                    document.getElementById("custom_pro_pic").src = img;
                    document.getElementById("custom_pro_pic_url").value = img;

                });
            }
        </script>
    </head>
    <body>

        <script src="js/FB_SDK_signup.js"></script>

        <header>
            <%@ include file="header.jsp" %>
        </header><!--/header-->



        <section id="level_1" ><!--Home Body Section 1-->
        </section><!--/Home Body Section 1-->



        <section id="slider"><!--slider-->
        </section><!--/slider-->


        <section id="level_1" ><!--Home Body Section 1-->

            <div class="container">
                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">

                        <div class="content">
                            <div class="idealsteps-container">

                                <form action="addProfile" method="post" novalidate autocomplete="off" class="idealforms" id="userDetails">
                                    <div class="idealsteps-wrap"> 

                                        <!-- Step 1 -->

                                        <section class="idealsteps-step">
                                            <hr><p style="color: #6b6b6b; text-align: center;padding: 10px; font-weight: normal;padding-bottom: 10px;font-size: large; ">Your Identification</p><hr>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-sm-6 ">

                                                        <div class="field">
                                                            <label class="main">Your Name:</label>
                                                            <input name="fname" id="username" type="text" maxlength="75">
                                                            <span class="error"></span> </div>

                                                        <div class="field">
                                                            <label class="main">Your E-mail :</label>
                                                            <input name="email" type="email" required>
                                                            <span class="error"></span> </div>

                                                        <div class="field">
                                                            <label class="main">City you live in:</label>
                                                            <select name="city" id="city">
                                                                <option value="" hidden>Select City</option>
                                                                <option value="Ampara">Ampara</option>
                                                                <option value="Anuradhapura">Anuradhapura</option>
                                                                <option value="Badulla">Badulla</option>
                                                                <option value="Batticaloa">Batticaloa</option>
                                                                <option value="Colombo">Colombo</option>
                                                                <option value="Galle">Galle</option>
                                                                <option value="Gampaha">Gampaha</option>
                                                                <option value="Hambantota">Hambantota</option>
                                                                <option value="Jaffna">Jaffna</option>
                                                                <option value="Kalutara">Kalutara</option>
                                                                <option value="Kandy">Kandy</option>
                                                                <option value="Kegalle">Kegalle</option>
                                                                <option value="Kilinochchi">Kilinochchi</option>
                                                                <option value="Kurunegala">Kurunegala</option>
                                                                <option value="Mannar">Mannar</option>
                                                                <option value="Matale">Matale</option>
                                                                <option value="Matara">Matara</option>
                                                                <option value="Moneragala">Moneragala</option>
                                                                <option value="Mullaitivu">Mullaitivu</option>
                                                                <option value="Nuwara Eliya">Nuwara Eliya</option>
                                                                <option value="Polonnaruwa">Polonnaruwa</option>
                                                                <option value="Puttalam">Puttalam</option>
                                                                <option value="Ratnapura">Ratnapura</option>
                                                                <option value="Trincomalee">Trincomalee</option>
                                                                <option value="Vavuniya">Vavuniya</option>
                                                            </select>
                                                            <span class="error"></span>                                       
                                                        </div> 
                                                        <div class="field">
                                                            <label class="main"></label>
                                                            <input type="hidden" name="pro_picture" id="custom_pro_pic_url"/>
                                                            
                                                        </div>

                                                        <div class="field buttons">
                                                            <label class="main">&nbsp;</label>
                                                            <button type="button" class="next">Next &raquo;</button>
                                                        </div>


                                                    </div>
                                                    <div class="col-sm-4 ">

                                                        <div id="profile-pic" class="shipping text-center" style="margin-top: 0px;border: 1px solid #c4c2b9; height: 250px; width: 250px;" ><!--shipping-->
                                                            <!--Load facebook profile picture here-->
                                                            
                                                        </div>
                                                        <a data-toggle="modal" href="#myModal" class="btn btn-primary btn-large">Custom profile pic</a>
                                                        <a class="btn btn-primary btn-large" onclick="checkLoginState()">FB profile pic</a>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="myModal" role="dialog">
                                                            <div class="modal-dialog modal-lg">
                                                                <div class="modal-content">

                                                                    <div class="modal-body" style="padding-bottom: 5px; padding-top: 15px;">

                                                                        <!--Profile picture-->
                                                                        <div class="container-fluid">
                                                                            <div class="row">

                                                                                <div class="col-md-8 ">
                                                                                    <div class="login-form"><!--login form-->

                                                                                        <div class="imageBox">
                                                                                            <div class="thumbBox"></div>
                                                                                            <div class="spinner" style="display: none; background-color: #c7cac8; padding-top: 130px;">
                                                                                                <h4 style="color: #7a7877">1. <i class="fa fa-user"></i> Upload Image File... </h4>
                                                                                                <h4 style="color: #7a7877">2. <i class="fa fa-search-plus"></i> / <i class="fa fa-search-minus "></i> Adjust Image</h4>
                                                                                                <h4 style="color: #7a7877">3. Click Crop Button & Save </h4>

                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="shopper-info action">
                                                                                            <input  class="btn btn-primary" type="file" id="file" style="float:left; width: 250px">

                                                                                            <button class="btn btn-primary" type="button" id="btnCrop" value="Crop" style="float: right">
                                                                                                Crop
                                                                                            </button>
                                                                                            <button class="btn btn-primary" type="button" id="btnZoomIn" value="+" style="float: right">
                                                                                                <i class="fa fa-search-plus "></i>
                                                                                            </button>
                                                                                            <button class="btn btn-primary" type="button" id="btnZoomOut" value="-" style="float: right">
                                                                                                <i class="fa fa-search-minus "></i>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div><!--/login form-->
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <div class="cropped" style="width: 59px; height: 59px; border: 1px;">

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-4" style="padding-top: 220px;">
                                                                                    <div class="prof-picture"><!--/product-information-->

                                                                                        <h5>Guidelines for adding photos to your profile</h5>


                                                                                        <p style="font-size: 11px;"><b><i class="fa fa-angle-right"></i></b> Smile.. Your matches are more likely to respond. </p>
                                                                                        <p style="font-size: 11px;"><b><i class="fa fa-angle-right"></i></b> Close up and full view. </p>
                                                                                        <p style="font-size: 11px;"><b><i class="fa fa-angle-right"></i></b> Add recent and clear photos. </p>
                                                                                        <hr>
                                                                                        <p align="center"><b style="color: #ff574b">Don't</b></p>
                                                                                        <a href=""><img src="images/home/photo_guide.jpg" class="share img-responsive"  alt="" /></a>
                                                                                    </div><!--/product-information-->
                                                                                </div>




                                                                            </div>
                                                                        </div>
                                                                        <!--/Profile picture-->




                                                                    </div>
                                                                    <div class="modal-footer" style="margin-top: 0px; padding-top: 0px; padding-bottom: 10px; padding-right: 30px;">

                                                                        <button class="btn btn-primary" id="btnSave" data-dismiss="modal" style="margin-top: 5px; ">Save</button>
                                                                        <button class="btn btn-primary" id="btnCancel" data-dismiss="modal" style="margin-top: 5px;">Cancel</button>

                                                                    </div>
                                                                </div><!-- /.modal-content -->
                                                            </div><!-- /.modal-dialog -->
                                                        </div><!-- /.modal -->

                                                    </div>
                                                </div>
                                            </div>



                                        </section>

                                        <!-- step 2 -->

                                        <section class="idealsteps-step">

                                            <hr><p style="color: #6b6b6b; text-align: center;padding: 10px; font-weight: normal;padding-bottom: 10px;font-size: large;  ">Basic Information</p><hr>
                                            <div class="field">
                                                <label class="main">Your Gender:</label>
                                                <p class="group">
                                                    <label>
                                                        <input name="gender" checked="checked" type="radio" value="Male">
                                                        Male</label>
                                                    <label>
                                                        <input name="gender" type="radio" value="Female">
                                                        Female</label>
                                                </p>
                                                <span class="error">This field is required</span> </div>


                                            <div class="field">
                                                <label class="main">Height:</label>
                                                <select name="height" id="height">
                                                    <option value="" hidden="hidden">&ndash; Select Height &ndash;</option>
                                                    <option value="90.0">3ft0in - 90 cm</option><option value="92.5">3ft1in - 92.5 cm</option><option value="95.0">3ft2in - 95 cm</option><option value="97.5">3ft3in - 97.5 cm</option><option value="100.0">3ft4in - 100 cm</option><option value="102.5">3ft5in - 102.5 cm</option>
                                                    <option value="105.0">3ft6in - 105 cm</option><option value="107.5">3ft7in - 107.5 cm</option><option value="110.0">3ft8in - 110 cm</option><option value="112.5">3ft9in - 112.5 cm</option><option value="115.0">3ft10in - 115 cm</option><option value="117.5">3ft11in - 117.5 cm</option><option value="120.0">4ft0in - 120 cm</option>
                                                    <option value="122.5">4ft1in - 122.5 cm</option><option value="125.0">4ft2in - 125 cm</option><option value="127.5">4ft3in - 127.5 cm</option><option value="130.0">4ft4in - 130 cm</option><option value="132.5">4ft5in - 132.5 cm</option><option value="135.0">4ft6in - 135 cm</option><option value="137.5">4ft7in - 137.5 cm</option>
                                                    <option value="140.0">4ft8in - 140 cm</option><option value="142.5">4ft9in - 142.5 cm</option><option value="145.0">4ft10in - 145 cm</option><option value="147.5">4ft11in - 147.5 cm</option><option value="150.0">5ft0in - 150 cm</option><option value="152.5">5ft1in - 152.5 cm</option><option value="155.0">5ft2in - 155 cm</option>
                                                    <option value="157.5">5ft3in - 157.5 cm</option><option value="160.0">5ft4in - 160 cm</option><option value="162.5">5ft5in - 162.5 cm</option><option value="165.0">5ft6in - 165 cm</option><option value="167.5">5ft7in - 167.5 cm</option><option value="170.0">5ft8in - 170 cm</option><option value="172.5">5ft9in - 172.5 cm</option>
                                                    <option value="175.0">5ft10in - 175 cm</option><option value="177.5">5ft11in - 177.5 cm</option><option value="180.0">6ft0in - 180 cm</option><option value="182.5">6ft1in - 182.5 cm</option><option value="185.0">6ft2in - 185 cm</option><option value="187.5">6ft3in - 187.5 cm</option><option value="190.0">6ft4in - 190 cm</option>
                                                    <option value="192.5">6ft5in - 192.5 cm</option><option value="195.0">6ft6in - 195 cm</option><option value="197.5">6ft7in - 197.5 cm</option><option value="200.0">6ft8in - 200 cm</option><option value="202.5">6ft9in - 202.5 cm</option><option value="205.0">6ft10in - 205 cm</option><option value="207.5">6ft11in - 207.5 cm</option>
                                                    <option value="210.0">7ft0in - 210 cm</option><option value="212.5">7ft1in - 212.5 cm</option><option value="215.0">7ft2in - 215 cm</option><option value="217.5">7ft3in - 217.5 cm</option><option value="220.0">7ft4in - 220 cm</option><option value="222.5">7ft5in - 222.5 cm</option>
                                                </select>
                                                <span class="error"></span> </div>


                                            <div class="field">
                                                <label class="main">Age:</label>
                                                <select name="age">
                                                    <option value="" hidden="hidden">&ndash; Select Age &ndash;</option>
                                                    <option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option>
                                                    <option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
                                                    <option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option>
                                                    <option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option>
                                                    <option value="64">64</option><option value="65">65</option>
                                                </select>
                                                <span class="error"></span> </div>




                                            <div class="field">
                                                <label class="main">Religion:</label>
                                                <select name="religion">
                                                    <option value="">&ndash; Select Religion &ndash;</option>
                                                    <option value="Buddhist">Buddhist</option>
                                                    <option value="Catholic">Catholic</option>
                                                    <option value="Islam">Islam</option>
                                                    <option value="Hindu">Hindu</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                                <span class="error"></span> 
                                            </div>

                                            <div class="field">
                                                <label class="main">Mother Tongue:</label>
                                                <select name="m_tongue">
                                                    <option value="">&ndash; Select Language &ndash;</option>
                                                    <option value="Sinhala">Sinhala</option>
                                                    <option value="Tamil">Tamil</option>
                                                    <option value="English">English</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                                <span class="error"></span> </div>
                                            <div class="field buttons">
                                                <label class="main">&nbsp;</label>
                                                <button type="button" class="prev">&laquo; Prev</button>
                                                <button type="button" class="next">Next &raquo;</button>
                                            </div>
                                        </section>


                                        <!-- Step 3 -->

                                        <section class="idealsteps-step">
                                            <hr><p style="color: #6b6b6b; text-align: center;padding: 10px; font-weight: normal;padding-bottom: 10px;font-size: large; ">About Your Education and Career</p><hr>

                                            <div class="field">
                                                <label class="main">College/ University:</label>
                                                <input name="college"  type="text" maxlength="80">
                                                <span class="error"></span> </div>

                                            <div class="field">
                                                <label class="main">Education:</label>
                                                <select name="edu_level">
                                                    <option value="" hidden="hidden">&ndash; Select Level &ndash;</option>
                                                    <option value="Passed A/L">Passed A/L</option>
                                                    <option value="Passed O/L">Passed O/L</option>
                                                    <option value="Bachelors">Bachelors</option>
                                                    <option value="Masters">Masters</option>
                                                    <option value="Doctorate">Doctorate</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                                <span class="error"></span> </div>

                                            <div class="field">
                                                <label class="main">Profession:</label>
                                                <input name="profession" type="text" maxlength="40">
                                                <span class="error"></span> </div>

                                            <div class="field">
                                                <label class="main">Income per month:</label>
                                                <select name="income" >
                                                    <option value="" hidden="hidden">&ndash; Select Income &ndash;</option>
                                                    <option value="Studying">Studying</option>
                                                    <option value="10 000-30 000 LKR">10 000 - 30 000 LKR</option>
                                                    <option value="30 000-50 000 LKR">30 000 - 50 000 LKR</option>
                                                    <option value="50 000-80 000 LKR">50 000 - 80 000 LKR</option>
                                                    <option value="80 000-100000 LKR">80 000 - 100 000 LKR</option>
                                                    <option value="100000-150000 LKR">100 000 - 150 000 LKR</option>
                                                    <option value="150000-200000 LKR">150 000 - 200 000 LKR</option>
                                                    <option value="200000-300000 LKR">200 000 - 300 000 LKR</option>
                                                    <option value=">300000 LKR">Greater than 300 000 LKR</option>
                                                </select>
                                                <span class="error"></span> </div>    


                                            <div class="field buttons">
                                                <label class="main">&nbsp;</label>
                                                <button type="button" class="prev">&laquo; Prev</button>
                                                <button type="button" class="next">Next &raquo;</button>
                                            </div>
                                        </section>

                                        <!-- Step 4 -->
                                        <section class="idealsteps-step">
                                            <hr><p style="color: #6b6b6b; text-align: center;padding: 10px; font-weight: normal;padding-bottom: 10px;font-size: large; ">Let them know about you (100 – 500 words)</p><hr>
                                            <!-- Form fields -->
                                            <div class="field">
                                                <label class="main">My Self:</label>
                                                <textarea name="yourself" id="yourself" cols="30" rows="10" maxlength="499" placeholder="How you look like , Your Qualities & Characteristics, Likes & dislikes, Hobbies and any other thing that tells about your personality... etc."></textarea>
                                                <span class="error"></span> </div>
                                            <div class="field buttons">
                                                <label class="main">&nbsp;</label>
                                                <button type="button" class="prev">&laquo; Prev</button>
                                                <button type="button" class="next">Next &raquo;</button>
                                                <a target="_blank" style="padding-left: 150px ;padding-bottom: 10px; float:right ;" href='Examples.jsp' >See examples...</a>    

                                            </div>    
                                        </section>

                                        <!-- Step 5 -->
                                        <section class="idealsteps-step">
                                            <hr><p style="color: #6b6b6b; text-align: center;padding: 10px; font-weight: normal;padding-bottom: 10px;font-size: large; ">Let them know about your Family (100 – 500 words)</p><hr>
                                            <!-- Form fields -->
                                            <div class="field">
                                                <label class="main">My Family:</label>
                                                <textarea name="background" id="background"  cols="30" rows="10" maxlength="499" placeholder="About your parents & siblings... etc."></textarea>
                                                <span class="error"></span> </div>
                                            <div class="field buttons">
                                                <label class="main">&nbsp;</label>
                                                <button type="button" class="prev">&laquo; Prev</button>
                                                <button type="button" class="next">Next &raquo;</button>
                                                <a target="_blank" style="padding-left: 150px ;padding-bottom: 10px; float:right ;" href='Examples.jsp' >See examples...</a>    

                                            </div>    
                                        </section>

                                        <!-- Step 6 -->
                                        <section class="idealsteps-step">
                                            <hr><p style="color: #6b6b6b; text-align: center;padding: 10px; font-weight: normal;padding-bottom: 10px;font-size: large; ">Let them know about your Education & Works (100 – 500 words)</p><hr>
                                            <!-- Form fields -->
                                            <div class="field">
                                                <label class="main">Education and Work:</label>
                                                <textarea name="edu_status" id="edu_status" cols="30" rows="10" maxlength="499" placeholder="Your educational qualifications, school or university. Where you currently working at and what would you like to do in future... etc."></textarea>
                                                <span class="error"></span> </div>

                                            <div class="field buttons">
                                                <label class="main">&nbsp;</label>
                                                <button type="button" class="prev">&laquo; Prev</button>
                                                <button type="button" class="next">Next &raquo;</button>
                                                <a target="_blank" style="padding-left: 150px ;padding-bottom: 10px; float:right ;" href='Examples.jsp' >See examples...</a>    

                                            </div>    
                                        </section>

                                        <!-- Step 7 -->
                                        <section class="idealsteps-step">
                                            <hr><p style="color: #6b6b6b; text-align: center;padding: 10px; font-weight: normal;padding-bottom: 10px;font-size: large; ">Let them know about who are you looking.. (100 – 500 words)</p><hr>
                                            <!-- Form fields -->
                                            <div class="field">
                                                <label class="main">I'm looking for:</label>
                                                <textarea name="expectation" id="expectation" cols="30" rows="10" maxlength="499" placeholder="Appearance, qualities and traits of your future partner. education and what you expect them to be... etc." required></textarea>
                                                <span class="error"></span> 
                                            </div>

                                            <div class="field">
                                                <label class="main"></label>                                             
                                                    <label>
                                                        <input type="radio" name="terms" id="terms" checked />I agree to<a target="_blank" href="Terms&Conditions.jsp"> Terms and Conditions </a>of Propozer</label>
                                                 
                                            </div>

                                            <div class="field">
                                                <input name="user_id" value="<%=user.getIduser()%>" type="hidden">
                                            </div>

                                            <div class="field buttons">
                                                <label class="main">&nbsp;</label>
                                                <button type="button" class="prev">&laquo; Prev</button>
                                                <button type="submit" class="submit">Submit</button>
                                            </div>    
                                        </section>


                                    </div>
                                    <span id="invalid"></span>
                                </form>
                            </div>
                        </div>



                    </div>
                    <div class="col-sm-1"></div>
                </div></div>





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
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/cropbox.js"></script>


        <script src="js/form/out/jquery.idealforms.js"></script> 

        <!--<script src="js//out/jquery.idealforms.min.js"></script>--> 
        <script>

            $('form.idealforms').idealforms({
                silentLoad: false,
                rules: {
                    'username': 'required',
                    'username2': 'required name',
                    'email': 'required email',
                    'password': 'required pass',
                    'confirmpass': 'required equalto:password',
                    'date': 'required date',
                    'picture': 'required extension:jpg:png',
                    'website': 'url',
                    'hobbies[]': 'minoption:2 maxoption:3',
                    'phone': 'required phone',
                    'zip': 'required zip',
                    'options': 'select:default',
                    'fname': 'required',
                    'country': 'required',
                    'city': 'required',
                    'gender': 'required',
                    'height': 'required',
                    'age': 'required',
                    'religion': 'required',
                    'm_tongue': 'required',
                    'profession': 'required',
                    'income': 'required',
                    'edu_level': 'required',
                    'yourself': 'required',
                    'background': 'required', 'edu_status': 'required',
                    'expectation': 'required',
                    
                    
                },
                errors: {
                    'username': {
                        ajaxError: 'Username not available'
                    },
                    'fname': {
                        required: 'Your name will not share without your permission',
                    },
                    'email': {
                        required: 'This field is required for your account recovery',
                    },
                },
                onSubmit: function(invalid, e) {
                    e.preventDefault();
                    $('#invalid')
                            .show()
                            .toggleClass('valid', !invalid)
                            .text(invalid ? ('') : (document.getElementById("userDetails").submit()));

                }
            });



            $('form.idealforms').find('input, select, textarea').on('change keyup', function() {
                $('#invalid').hide();
            });

            $('form.idealforms').idealforms('addRules', {
                'comments': 'required minmax:50:200'
            });

            $('.prev').click(function() {
                $('.prev').show();
                $('form.idealforms').idealforms('prevStep');
            });
            $('.next').click(function() {
                $('.next').show();
                $('form.idealforms').idealforms('nextStep');
            });

        </script>
    </body>
</html>
