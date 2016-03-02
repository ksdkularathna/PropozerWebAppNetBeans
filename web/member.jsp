<%-- 
    Document   : member
    Created on : Jun 20, 2015, 12:22:38 PM
    Author     : Sampath Dhananjaya
--%>


<%@page import="com.hib.mappings.Userthreads"%>
<%@page import="com.hib.mappings.Chatmessages"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="com.hib.mappings.Userrequests"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.hib.servlets.HibSession"%>
<%@page import="com.hib.mappings.User"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("loguser") == null) {
        response.sendRedirect("index.jsp");
    } else {
        User user = (User) request.getSession().getAttribute("loguser");
        String msg = "";
        if (user.getCaste() == null) {
            response.sendRedirect("Validation.jsp");
        } else if (user.getFname() == null) {
            if (user.getFbProfile() == null) {
                response.sendRedirect("createProfile_1.jsp");
            } else {
                response.sendRedirect("createProfile.jsp");}

                    }
        if (request.getParameter("msg") == null) {
            msg = "";
        } else {
            msg = request.getParameter("msg");
        }
   // User user = (User) request.getSession().getAttribute("loguser");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title><%=user.getUserNameId()%></title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="css/prf_pic_crop.css" type="text/css" />
        <link rel="stylesheet" href="css/sweetalert.css">
        <link href="css/modal.css" rel="stylesheet">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <meta name="description" content="Propozer is a unique, Confidential, innovative and professional way of finding partners. We offer you the best possible matches of grooms and brides according to your wish. Join FREE!" />
        <meta name="keywords" content="find love, find a girlfriend, find a boy friend, propozer, proposal, place foe love, wedding, matchmaking, matchmaking service, matrimonial, life partner, Astrology Matching, Matrimonial, Matrimony, Sri lankan Matrimonial, Srilanka Matrimonials, free matrimonial site, matrimonial sites Sri Lanka, matrimonial lk, matrimonial websites, bridegroom, Online Matrimonials" />
        <meta name="author" content="metatags generator">
        <!-- Alert Js -->
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
    <script src="js/alert/sweetalert-dev.js"></script>      

    <style type="text/css">
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

            function initMember() {

                /* document.getElementById("fname").value = "<%=user.getFname()%>";
                
                 document.getElementById("city").value = "<%=user.getCity()%>";
                 document.getElementById("height").value = "<%=user.getHeight()%>";
                 document.getElementById("age").value = "<%=user.getAge()%>";
                 
                 document.getElementById("religion").value = "<%=user.getReligion()%>";
                 document.getElementById("m_tongue").value = "<%=user.getMothertongue()%>";
                 document.getElementById("edu_level").value = "<%=user.getEducationLevel()%>";
                 document.getElementById("yourself").value = "<%=user.getYourself()%>";
                 document.getElementById("background").value = "<%=user.getBackground()%>";
                 document.getElementById("edu_status").value = "<%=user.getEducationStatus()%>";
                 document.getElementById("expectation").value = "<%=user.getExpectations()%>";
                 document.getElementById("gender").value = "<%=user.getGender()%>";
                 document.getElementById("profession").value = "<%=user.getProfession()%>";
                 document.getElementById("income").value = "<%=user.getIncome()%>";
                 document.getElementById("user_id").value = "<%=user.getIduser()%>";
                 */
            }

// FB SDK
            function statusChangeCallback(response) {

                console.log('statusChangeCallback');
                console.log(response);
                // The response object is returned with a status field that lets the
                // app know the current login status of the person.
                // Full docs on the response object can be found in the documentation
                // for FB.getLoginStatus().
                if (response.status === 'connected') {

                    // Logged into your app and Facebook.
                    // var pro_pic = document.getElementById('profile-pic');

                    FB.api('/me', function(response) {
                        if (response.name == '<%=user.getFbProfile()%>') {
                            // pro_pic.innerHTML = '<img src="https://graph.facebook.com/' + response.id + '/picture?width=359&height=359">';                                 
                            document.getElementById('fb_username').value = response.name;
                            document.getElementById('fb_email').value = response.email;
                            document.getElementById('pro_pic').value = 'https://graph.facebook.com/' + response.id + '/picture?width=359&height=359';
                            document.getElementById("pro_pic_form").submit();

                        } else {
                            swal("Propozer Alert!", "Please log into Facebook");

                        }
                    });

                } else if (response.status === 'not_authorized') {
                    // The person is logged into Facebook, but not your app.

                    swal("Oops...", "User is not authorized!", "error");
                    // Display the login button


                } else {
                    // The person is not logged into Facebook, so we're not sure if
                    // they are logged into this app or not.
                    swal("Propozer Alert!", "Please log into Facebook");
                    document.getElementById('loginButton').style.display = 'block';
                }
            }

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.

            function checkLoginState() {

                FB.getLoginStatus(function(response) {
                    statusChangeCallback(response);
                });

            }

            function logout() {
                FB.logout(function(response) {
                    // user is now logged out
                });

            }
            window.fbAsyncInit = function() {
                FB.init({
                    appId: '1457398941225553',
                    cookie: true, // enable cookies to allow the server to access 
                    // the session
                    xfbml: true, // parse social plugins on this page
                    version: 'v2.2' // use version 2.2
                });

                // Now that we've initialized the JavaScript SDK, we call 
                // FB.getLoginStatus().  This function gets the state of the
                // person visiting this page and can return one of three states to
                // the callback you provide.  They can be:
                //
                // 1. Logged into your app ('connected')
                // 2. Logged into Facebook, but not your app ('not_authorized')
                // 3. Not logged into Facebook and can't tell if they are logged into
                //    your app or not.
                //
                // These three cases are handled in the callback function.

                /* FB.getLoginStatus(function (response) {
                 statusChangeCallback(response);
                 });*/
                document.getElementById('loginButton').style.display = 'none';

            };

// Load the SDK asynchronously
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));


    </script>
</head><!--/head-->

<body>
    <%if (user.getActivateStatus() == false) {%>
    <div class="alert alert-success fade in" style="margin-bottom: 0px">
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="fa fa-times"></i>
        </button>
        <strong>Welcome to Propozer!</strong> Your account is being reviewed by the propozer team and will be activated within 24 hours.
    </div>
    <%}%>

    <%@ include file="header.jsp"%>

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left" id="uer_menu_i">

                        <ul class=" nav navbar-nav collapse navbar-collapse">

                            <%
                                HibSession hib = new HibSession();
                                Query q1 = hib.session.createQuery("from Userrequests ur where ur.userId='" + user.getIduser() + "'AND ur.acceptance=false ORDER BY ur.iduserRequests DESC");
                                List<Userrequests> pro_list = q1.list();
                                int pro_num = pro_list.size();

                            %>
                            <li class="dropdown"><a href="#" ><i class="fa fa-user" style="color: #1a9efb"></i> Proposals </i><%if (pro_num != 0) {%><span style="background-color: #ee5d53; padding: 2px 7px 2px 7px; color: #ffffff;"> <b><%=pro_num%></b></span><%}%></a>
                                <ul role="menu" class="sub-menu" id="sub-menu_proposal">
                                    <%for (Userrequests proposal : pro_list) {%>
                                    <li><a href="#proposal" data-toggle="tab" onclick="getProposal('viewProposalAjax.jsp', '<%=proposal.getUser().getIduser()%>'), disableMenubar()"><%=proposal.getUser().getUserNameId()%></a></li>
                                        <%}%>
                                        <%if (pro_list.size() == 0) {%>
                                    <li><a data-toggle="tab">No new proposals</a></li>                                      
                                        <%}%>  
                                </ul>

                            </li>
                            <%
                                Query q2 = hib.session.createQuery("from Userrequests ur where ur.userId='" + user.getIduser() + "'AND ur.acceptance=true ORDER BY ur.iduserRequests DESC");
                                List<Userrequests> accepted_list = q2.list();
                            %>
                            <li class="dropdown"><a href="#" ><i class="fa fa-star" style="color: #1a9efb"></i>Accepted </i><%if (accepted_list.size() != 0) {%><span style="background-color: #ee5d53; padding: 2px 7px 2px 7px; color: #ffffff;"> <b><%=accepted_list.size()%></b></span><%}%></a>
                                <ul role="menu" class="sub-menu" id="sub-menu_accepted">
                                    <%for (Userrequests proposal : accepted_list) {%>
                                    <li id="a<%=proposal.getIduserRequests()%>"><a href="#proposal" data-toggle="tab" onclick="getProposal('viewProposalAjax.jsp', '<%=proposal.getUser().getIduser()%>'), disableMenubar()"><%if (!proposal.isReceiverVisibility()) {%><%=proposal.getUser().getUserNameId()%><%} else {%><%=proposal.getUser().getFname()%> <%=proposal.getUser().getUserNameId()%><%}%></a></li>
                                        <%}%>
                                        <%if (accepted_list.size() == 0) {%>
                                    <li><a data-toggle="tab">No accepted proposals</a></li>                                      
                                        <%}%>
                                </ul>
                            </li>
                            <%
                                Query q3 = hib.session.createQuery("select distinct cm.userthreads from Chatmessages cm where cm.userByMsgTo='" + user.getIduser() + "'AND cm.seen=false ORDER BY cm.msgId DESC");
                                List<Userthreads> inbox = q3.list();
                            %>
                            <li class="dropdown"><a href="chatRoom.jsp"><i class=" fa fa-envelope" style="color: #1a9efb"></i>  Inbox </i><%if (inbox.size() != 0) {%><span style="background-color: #ee5d53; padding: 2px 7px 2px 7px; color: #ffffff;"> <b><%=inbox.size()%></b></span><%}%></a>
                                <ul role="menu" class="sub-menu" id="sub-menu_accepted">
                                    <%for (Userthreads chat_thread : inbox) {
                                            Query q4;
                                            if (chat_thread.getUserByUser1().getIduser().toString().equals(user.getIduser().toString())) {
                                                q4 = hib.session.createQuery("from Userrequests ur where ur.userId='" + user.getIduser() + "'AND ur.acceptance=true AND ur.user='" + chat_thread.getUserByUser2().getIduser() + "'");
                                            } else {
                                                q4 = hib.session.createQuery("from Userrequests ur where ur.userId='" + user.getIduser() + "'AND ur.acceptance=true AND ur.user='" + chat_thread.getUserByUser1().getIduser() + "'");
                                            }
                                            Userrequests proposal = (Userrequests) q4.uniqueResult();
                                    %>
                                    <li><a href="chatRoom.jsp?thread_id=<%=chat_thread.getIduserThreads()%>" onclick=""> <%if (!proposal.isReceiverVisibility()) {%><%=proposal.getUser().getUserNameId()%><%} else {%><%=proposal.getUser().getFname()%> <%=proposal.getUser().getUserNameId()%><%}%></a></li>
                                        <%}%>
                                        <%if (inbox.size() == 0) {%>
                                    <li><a data-toggle="tab">No new messages</a></li>                                      
                                        <%}%>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">

                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->


</header><!--/header-->



<section id="slider"><!--slider-->
</section><!--/slider-->


<section>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="left-sidebar">

                    <div class="price-range"><!--profile picture-->

                        <%
                            if (user.getPropicture() != null) {
                                byte[] bytes = user.getPropicture();
                                String image_string = new String(bytes, "ISO-8859-1");

                        %>                          
                        <div id="profile-pic" class="shipping text-center" style="border: 1px solid #c4c2b9; height: 359px; width: 359px;">
                            <img src="<%=image_string%>" style="height: 100%; width: 100%; object-fit: contain"/>                   
                        </div>
                        <%} else {%>
                        <div id="profile-pic" class="shipping text-center" style="border: 1px solid #c4c2b9; height: 359px; width: 359px;">
                            <img src="images/home/prmoofile_pic.jpg" style="height: 100%; width: 100%; object-fit: contain">
                        </div>
                        <%}%>
                        <form action="addProfilePic" id="pro_pic_form" method="post">                               

                            <%if (user.getFbProfile() != null) {%>
                            <a data-toggle="modal" href="#myModal" class="btn btn-primary btn-large" style="margin-left: 45px">Custom profile pic</a>
                            <a class="btn btn-primary btn-large" onclick="checkLoginState()">Get FB profile pic</a> <br/><br/>
                            <%} else if (user.getFbProfile() == null) {%>
                            <a data-toggle="modal" href="#myModal" class="btn btn-primary btn-large" style="margin-left: 100px">Change profile pic</a>
                            <%}%>
                            <input type="hidden" name="user_id" value="<%=user.getIduser()%>"/>
                            <input type="hidden" name="pro_pic" id="pro_pic" />

                        </form>
                    </div><!--/profile picture-->


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

            <div class="col-sm-8 padding-right">


                <div class="category-tab shop-details-tab"><!--category-tab-->
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs" id="navbar">
                            <li class="active"><a href="#news" id="nav1" data-toggle="tab" onclick="disableProposals()">General</a></li>
                            <li><a href="Search.jsp" onclick="disableProposals()">Search</a></li>                                                          
                            <li><a href="#tagProfile" data-toggle="tab" onclick="disableProposals()">Edit Profile</a></li>
                            <li><a href="#tagFeedBack" data-toggle="tab" onclick="disableProposals()">Feedback</a></li>
                            <li><a href="#tagSuccessStory" data-toggle="tab" onclick="disableProposals()">Success Story</a></li>
                            <li><a href="#tagFakeReport" data-toggle="tab" onclick="disableProposals()">Report Fake Profile</a></li>                                
                        </ul>
                    </div>
                    <div class="tab-content">

                        <div class="tab-pane fade" id="proposal">                               
                        </div>
                        <div class="tab-pane fade active in" id="news" >

                            <div id="general">

                                <div class="col-sm-7">
                                    <div class="product-information"><!--/product-information-->
                                        <img src="images/home/new1.png" class="newarrival" alt="" />
                                        <h2>Guidelines for adding photos to your profile</h2>



                                        <p><b><i class="fa fa-angle-right"></i></b> Smile.. Your matches are more likely to respond. </p>
                                        <p><b><i class="fa fa-angle-right"></i></b> Close up and full view. </p>
                                        <p><b><i class="fa fa-angle-right"></i></b> Add recent and clear photos. </p>
                                        <hr>
                                        <p align="center"><b style="color: #ff574b">Don't</b></p>
                                        <a href=""><img src="images/home/photo_guide.jpg" class="share img-responsive"  alt="" /></a>
                                    </div><!--/product-information-->
                                </div>
                                <div class="col-sm-4">
                                    <div class="price-range" ><!--price-range-->

                                        <div class="well">
                                            <img style="height: 250px; width: 300px;" src="images/home/facebook-poster.png" class="newarrival" alt="" />

                                        </div>
                                    </div>
                                </div><!--/price-range-->

                            </div>

                            <div id="propose_data" style="display: none">

                            </div>

                        </div>


                        <div class="tab-pane fade" id="tagProfile" >
                            <div class="reviews">
                                <div class="col-sm-12">

                                    <a style="padding-bottom: 10px; float: right;" onclick="change_password_modal()">Change password</a>

                                    <!-- Change password Modal 1-->
                                    <div class="modal fade custom-Modals" id="change_password" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">

                                                    <h4 class="modal-title">Change Password</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>The <span style="color:#e2335b;" >Propozer</span> recommend a strong password with different characters. It will increase your account security</p>
                                                    <form>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="control-label">Current Password</label>
                                                            <input onclick="enableTextFiled()" type="text" class="form-control" id="current_password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="control-label">New Password</label>
                                                            <input onfocus="checkPassword('checkPassword')" onclick="checkPassword('checkPassword')" type="password" class="form-control" id="new_password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="control-label">Confirm Password</label>
                                                            <input type="password" class="form-control" id="confirm_password">
                                                        </div>
                                                    </form>

                                                </div>
                                                <div class="modal-footer">

                                                    <button style="border-radius: 2px;  padding-top: 0px; padding-bottom: 0px; " onclick="savePassword(), resetModel()" type="button" id="save_btn" class="btn btn-default">Save</button>
                                                    <button style="border-radius: 2px;  padding-top: 0px; padding-bottom: 0px; " type="button" class="btn btn-default " onclick="resetModel()" data-dismiss="modal">Close</button>   

                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->

                                    <form action="editProfile" method="post" onsubmit="msg()" class="form">
                                        <table class="table">
                                            <tbody>
                                                <tr><th colspan="3" ><p style="color: #f0583f; text-align: center;padding-bottom: 18px;padding-top: 18px;">Your Identification&nbsp&nbsp<i style="font-weight: normal; font-size: smaller;">(will not share without your permission)</i></p></th></tr>
                                            <tr><td>Name</td><td colspan="2"><input name="fname" id="fname" height="Array" type="text" value="<%=user.getFname()%>" width="" required></td></tr>
                                            <tr><th colspan="3" ><p style="color: #f0583f; text-align: center;padding-bottom: 18px;padding-top: 18px;">The details given  bellow <i style="font-weight: normal; font-size: smaller;">(Your inner qualities)</i> will be shown to other users<i style="font-weight: normal; font-size: smaller;"></i></p></th></tr>
                                            <tr><th colspan="3" style="text-align: center;padding-bottom: 18px;padding-top: 18px;">Tell Us Where You Are From</th></tr>
                                            
                                            <tr><td>City you live</td><td colspan="2"><select class="" name="city" id="city" required >
                                                        <option selected="selected" value="<%=user.getCity()%>" hidden="hidden"><%=user.getCity()%></option>
                                                        <option value="">None</option>
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
                                                        <option value="Vavuniya">Vavuniya</option></select></td></tr>

                                            <tr><th colspan="3" style="text-align: center;padding-bottom: 18px;padding-top: 18px;">Basic Information</th></tr>
                                            <tr><td width="40%">Your Gender</td>
                                                <td>
                                                    <select name="gender" id="gender" required>
                                                        <option selected="selected" value="<%=user.getGender()%>" hidden="hidden"><%=user.getGender()%></option>
                                                        <option value="" hidden></option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option></select>
                                                </td>

                                            </tr>
                                            <tr><td>Height</td><td colspan="2"><select class="" name="height" id="height" required>
                                                        <option selected="selected" value="<%=user.getHeight()%>" hidden="hidden"><%=user.getHeight()%></option>
                                                        <option value="" hidden>Select Height</option><option value="90.0">3ft0in - 90 cm</option><option value="92.5">3ft1in - 92.5 cm</option><option value="95.0">3ft2in - 95 cm</option><option value="97.5">3ft3in - 97.5 cm</option><option value="100.0">3ft4in - 100 cm</option><option value="102.5">3ft5in - 102.5 cm</option><option value="105.0">3ft6in - 105 cm</option><option value="107.5">3ft7in - 107.5 cm</option><option value="110.0">3ft8in - 110 cm</option><option value="112.5">3ft9in - 112.5 cm</option><option value="115.0">3ft10in - 115 cm</option><option value="117.5">3ft11in - 117.5 cm</option><option value="120.0">4ft0in - 120 cm</option><option value="122.5">4ft1in - 122.5 cm</option><option value="125.0">4ft2in - 125 cm</option><option value="127.5">4ft3in - 127.5 cm</option><option value="130.0">4ft4in - 130 cm</option><option value="132.5">4ft5in - 132.5 cm</option><option value="135.0">4ft6in - 135 cm</option><option value="137.5">4ft7in - 137.5 cm</option><option value="140.0">4ft8in - 140 cm</option><option value="142.5">4ft9in - 142.5 cm</option><option value="145.0">4ft10in - 145 cm</option><option value="147.5">4ft11in - 147.5 cm</option><option value="150.0">5ft0in - 150 cm</option><option value="152.5">5ft1in - 152.5 cm</option><option value="155.0">5ft2in - 155 cm</option><option value="157.5">5ft3in - 157.5 cm</option><option value="160.0">5ft4in - 160 cm</option><option value="162.5">5ft5in - 162.5 cm</option><option value="165.0">5ft6in - 165 cm</option><option value="167.5">5ft7in - 167.5 cm</option><option value="170.0">5ft8in - 170 cm</option><option value="172.5">5ft9in - 172.5 cm</option><option value="175.0">5ft10in - 175 cm</option><option value="177.5">5ft11in - 177.5 cm</option><option value="180.0">6ft0in - 180 cm</option><option value="182.5">6ft1in - 182.5 cm</option><option value="185.0">6ft2in - 185 cm</option><option value="187.5">6ft3in - 187.5 cm</option><option value="190.0">6ft4in - 190 cm</option><option value="192.5">6ft5in - 192.5 cm</option><option value="195.0">6ft6in - 195 cm</option><option value="197.5">6ft7in - 197.5 cm</option><option value="200.0">6ft8in - 200 cm</option><option value="202.5">6ft9in - 202.5 cm</option><option value="205.0">6ft10in - 205 cm</option><option value="207.5">6ft11in - 207.5 cm</option><option value="210.0">7ft0in - 210 cm</option><option value="212.5">7ft1in - 212.5 cm</option><option value="215.0">7ft2in - 215 cm</option><option value="217.5">7ft3in - 217.5 cm</option><option value="220.0">7ft4in - 220 cm</option><option value="222.5">7ft5in - 222.5 cm</option></select></td></tr>
                                            <tr><td>Age</td><td colspan="2"><select class="" name="age" id="age" required>
                                                        <option selected="selected" value="<%=user.getAge()%>" hidden="hidden"><%=user.getAge()%></option>
                                                        <option value="" hidden>Select Age</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option><option value="64">64</option><option value="65">65</option></select></td></tr>
                                            
                                            <tr><td>Religion</td><td colspan="2"><select class="" name="religion" id="religion" required>
                                                        <option selected="selected" value="<%=user.getReligion()%>" hidden="hidden"><%=user.getReligion()%></option>
                                                        <option value="" hidden>Select Option</option>
                                                        <option value="Buddhist">Buddhist</option>
                                                        <option value="Catholic">Catholic</option>
                                                        <option value="Islam">Islam</option>
                                                        <option value="Hindu">Hindu</option>
                                                        <option value="Other">Other</option>
                                                    </select></td></tr>

                                            <tr><td>Mother Tongue</td><td colspan="2"><select class="" name="m_tongue" id="m_tongue" required>
                                                        <option selected="selected" value="<%=user.getMothertongue()%>" hidden="hidden"><%=user.getMothertongue()%></option>
                                                        <option value="" hidden>Select Option</option>
                                                        <option value="Sinhala">Sinhala</option>
                                                        <option value="Tamil">Tamil</option>
                                                        <option value="English">English</option>
                                                        <option value="Other">Other</option></select></td></tr>
                                            <tr><th colspan="3" style="text-align: center;padding-bottom: 18px;padding-top: 18px;">About Your Career</th></tr>
                                            
                                            <tr><td>Profession</td><td colspan="2"><input class="" value="<%=user.getProfession()%>" name="profession" id="profession" height="Array" type="text" width="" required></td></tr>                                           
                                            <tr><td>Income per month</td><td colspan="2"><select class="" name="income" id="income"  required>
                                                        <option selected="selected" value="<%=user.getIncome()%>" hidden="hidden"><%=user.getIncome()%></option>
                                                        <option value="" hidden="hidden">Select income</option>
                                                        <option value="Studying">Studying</option>
                                                        <option value="10 000-30 000 LKR">10 000 - 30 000 LKR</option>
                                                        <option value="30 000-50 000 LKR">30 000 - 50 000 LKR</option>
                                                        <option value="50 000-80 000 LKR">50 000 - 80 000 LKR</option>
                                                        <option value="80 000-100000 LKR">80 000 - 100 000 LKR</option>
                                                        <option value="100000-150000 LKR">100 000 - 150 000 LKR</option>
                                                        <option value="150000-200000 LKR">150 000 - 200 000 LKR</option>
                                                        <option value="200000-300000 LKR">200 000 - 300 000 LKR</option>
                                                        <option value=">300.000 LKR">Greater than 300 000 LKR</option>
                                                    </select></td></tr>
                                            <tr><th colspan="3" style="text-align: center;padding-bottom: 18px;padding-top: 18px;">About Your Education</th></tr>
                                            <tr><td>Education Level</td><td colspan="2"><select class="" name="edu_level" id="edu_level" required> 
                                                        <option selected="selected" value="<%=user.getEducationLevel()%>" hidden="hidden"><%=user.getEducationLevel()%></option>
                                                        <option value="" hidden>Select Option</option>
                                                        <option value="Passed A/L">Passed A/L  
                                                        </option><option value="Passed O/L">Passed O/L</option>
                                                        <option value="Bachelors">Bachelors</option>
                                                        <option value="Masters">Masters</option>
                                                        <option value="Doctorate">Doctorate</option>
                                                        <option value="Other">Other</option>
                                                    </select></td></tr>
                                            <tr><td>College/University</td><td colspan="2"><input class="" value="<%=user.getWorkplace()%>" name="workplace" id="workplace" height="Array" type="text" width=""></td></tr>
                                            <tr><th colspan="3" style="text-align: center;padding-bottom: 18px;padding-top: 18px;">Let Them Know About You (100 – 500 words)</th></tr>
                                            <tr><td>My Self</td><td colspan="2"><textarea required name="yourself" class="" id="yourself" rows="" cols="" maxlength="499" placeholder="How you look like , Your Qualities & Characteristics, Likes & dislikes, Hobbies and any other thing that tells about your personality" required><%=user.getYourself()%></textarea></td></tr>
                                            <tr><td>My Family</td><td colspan="2"><textarea required name="background" class="" id="background" rows="" cols="" maxlength="499" placeholder="About your parents & siblings"><%=user.getBackground()%></textarea></td></tr>
                                            <tr><td>Education and Work</td><td colspan="2"><textarea required name="edu_status" class="" id="edu_status" rows="" cols="499" maxlength="" placeholder="Your educational qualifications, school or university. Where you currently work and what you like to do in future" required><%=user.getEducationStatus()%></textarea></td></tr>
                                            <tr><td>I'm looking for</td><td colspan="2"><textarea required name="expectation" class="" id="expectation" rows="" cols="" maxlength="499" placeholder="Appearance, qualities and traits of your future partner. education and what you expect them to be" required><%=user.getExpectations()%></textarea></td></tr>



                                            <tr><td><input name="user_id" value="<%=user.getIduser()%>" id="user_id" type="hidden"/>
                                                    <input name="fb_profile" id="fb_username" type="hidden" />
                                                    <input name="fb_email" id="fb_email" type="hidden" />
                                                </td><td colspan="2">

                                                    <button type="submit" class="btn btn-default">Submit</button></td></tr>
                                            </tbody>
                                        </table>

                                    </form>                                      
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="tagSuccessStory" >

                            <div class="reviews">
                                <div class="col-sm-12">
                                    <ul>
                                        <li><a href=""><i class="fa fa-calendar-o"></i>Success Story</a></li>
                                    </ul>

                                    <form action="addStory" method="post" onsubmit="msg()">
                                        <span>
                                            <input name="topic" type="text" placeholder="Topic" required/>
                                            <input  name="partner_id" type="text" placeholder="ID of the Partner" required/>
                                            <input type="hidden" name="user_id" value="<%=user.getIduser()%>"/>                                            
                                        </span>
                                        <textarea name="details" required></textarea>
                                        <button type="submit" class="btn btn-default pull-right">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>



                        </div>

                        <div class="tab-pane fade" id="tagFakeReport"  >
                            <div class="reviews">
                                <div class="col-sm-12">
                                    <ul>

                                        <li><a href=""><i class="fa fa-trash-o"></i>Report user</a></li>

                                    </ul>

                                    <form action="addFakeProfiles" method="post" onsubmit="msg()">
                                        <span>
                                            <input name="fake_id" type="text" placeholder="Fake User ID" required/>
                                            <input type="hidden" name="user_id" value="<%=user.getIduser()%>" />                                                                                       
                                        </span>
                                        <textarea name="details" required></textarea>

                                        <button type="submit" class="btn btn-default pull-right">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tagFeedBack" >
                            <div class="reviews">
                                <div class="col-sm-12">
                                    <ul>
                                        <li><a href=""><i class="fa fa-calendar-o"></i>Feedback</a></li>

                                    </ul>

                                    <p><b>Tell us your feedback to improve our service</b></p>

                                    <form action="addFeedBack" method="post" onsubmit="msg()">
                                        <span>
                                            <input type="hidden" name="user_id" value="<%=user.getIduser()%>"/>                                                                                                                                  
                                        </span>
                                        <textarea name="feedback" required></textarea>
                                        <button type="submit" class="btn btn-default pull-right">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="tagHelp" >
                            <div class="reviews">
                                <div class="col-sm-12">
                                    <ul>
                                        <li><a href=""><i class="fa fa-headphones"></i>For Help</a></li>

                                    </ul>

                                    <p><b>Tell us your problem</b></p>

                                    <form action="addHelp" method="post" onsubmit="msg()">
                                        <span>
                                            <input type="text" name="topic" placeholder="Topic" required/>
                                            <input type="hidden" name="user_id" value="<%=user.getIduser()%>"/>                                                                                                                                  
                                        </span>
                                        <textarea name="details" required></textarea>
                                        <button type="submit" class="btn btn-default pull-right">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/category-tab-->


            </div>
        </div>
    </div>
</section>









<section id="level_1" ><!--Home Body Section 1-->
</section><!--/Home Body Section 1-->




<section id="do_action">
</section>

<script>
    function change_password_modal() {

        resetModel();
        $('#change_password').modal('toggle');
    }

</script>


<%@ include file="footer.jsp" %>
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
            document.getElementById("pro_pic").value = img;
            document.getElementById("pro_pic_form").submit();
        });
    }

    function msg() {

        swal({title: "", text: "Done", type: "success", timer: 3000, showConfirmButton: false});

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
    function checkPassword(url) {
        //alert("ajax");
        var current_password = document.getElementById("current_password").value;
        var confirm_password = document.getElementById("confirm_password");
        xmlHttp = getXMLHTTPRequest();
        if (xmlHttp == null) {
            alert("No Ajax Object in DOM");
        } else {
            xmlHttp.open("POST", url, true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            //alert(current_password);

            xmlHttp.send('user_id=<%=user.getIduser()%>&current_password=' + current_password);
            //alert("send");

            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res.toString() != 'ok') {
                        document.getElementById("new_password").setAttribute('disabled', 'disabled');
                        document.getElementById("confirm_password").setAttribute('disabled', 'disabled');
                        document.getElementById("save_btn").setAttribute('disabled', 'disabled');
                        var errorMsg = $('<span id="error" style="color:red">Current password is incorrect. Please enter the correct password</span>');
                        errorMsg.insertAfter(confirm_password);
                    }

                }

            }
        }
    }
    function savePassword() {
        var current_password = document.getElementById("current_password").value;
        var confirm_password = document.getElementById("confirm_password").value;
        if (current_password != '' && confirm_password != '') {
            xmlHttp = getXMLHTTPRequest();
            if (xmlHttp == null) {
                alert("No Ajax Object in DOM");
            } else {
                xmlHttp.open("POST", 'changePassword', true);
                xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                //alert(current_password);

                xmlHttp.send('userlogin_id=<%=user.getUserlogin().getLoginId()%>&new_password=' + confirm_password + '&current_password=' + current_password);
                //alert("send");

                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState == 4) {
                        var res = xmlHttp.responseText;
                        if (res.toString() == 'ok') {
                            $('#change_password').modal('hide');
                            msg();
                        } else {
                            alert("Password did not match !");
                        }

                    }

                }
            }
        } else {
            alert("Please enter the necessary details");
        }
    }
    function enableTextFiled() {
        document.getElementById("new_password").removeAttribute('disabled');
        document.getElementById("confirm_password").removeAttribute('disabled');
        document.getElementById("save_btn").removeAttribute('disabled');
        var errorCont = document.getElementById("error");
        if (errorCont != null) {
            errorCont.remove();
        }
    }
    function resetModel() {
        document.getElementById("new_password").value = "";
        document.getElementById("confirm_password").value = "";
        document.getElementById("current_password").value = "";
    }

    function getProposal(url, proposal_id) {
        //alert("ajax");
        xmlHttp = getXMLHTTPRequest();
        if (xmlHttp == null) {
            alert("No Ajax Object in DOM");
        } else {
            xmlHttp.open("POST", url, true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            //alert(proposal_id);
            xmlHttp.send('user_id=<%=user.getIduser()%>&proposal_id=' + proposal_id);
            //alert("send");

            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    //alert("received");
                    document.getElementById("proposal").innerHTML = res;
                }

            }
        }
    }
    function acceptProposal(url, proposal_id, acceptance) {
        //alert("ajax");
        xmlHttp = getXMLHTTPRequest();
        if (xmlHttp == null) {
            alert("No Ajax Object in DOM");
        } else {
            xmlHttp.open("POST", url, true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            //alert(proposal_id);
            xmlHttp.send('user_id=<%=user.getIduser()%>&proposal_id=' + proposal_id + '&acceptance=' + acceptance);
            //alert("send");
            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 'e1') {
                        sweetAlert("Oops...", "Something went wrong!, Please try again", "error");
                    }
                    setTimeout(refreshMember, 2000);
                }

            }
        }
    }
    function removeProposal(url, proposal_id) {
        //alert("ajax");
        xmlHttp = getXMLHTTPRequest();
        if (xmlHttp == null) {
            alert("No Ajax Object in DOM");
        } else {
            xmlHttp.open("POST", url, true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            //alert();
            xmlHttp.send('user_id=<%=user.getIduser()%>&proposal_id=' + proposal_id);
            //alert("send");
            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 'r1') {
                        sweetAlert("Okay,try another,", "Proposal Removed!", "success");
                    }
                    else if (res == 'r2') {
                        sweetAlert("Oops...", "Proposal already have deleted!", "error");
                    }
                    setTimeout(refreshMember, 2000);

                }

            }
        }
    }
    function refreshMember() {
        window.location = 'member.jsp';
    }
    function showName(url, proposal_id, p_id, visibility) {

        if (visibility == 'false') {
            xmlHttp = getXMLHTTPRequest();
            if (xmlHttp == null) {
                alert("No Ajax Object in DOM");
            } else {
                xmlHttp.open("POST", url, true);
                xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xmlHttp.send('user_id=<%=user.getIduser()%>&proposal_id=' + proposal_id + '&visibility=' + visibility);
                //alert("send");
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState == 4) {
                        var res = xmlHttp.responseText;
                        if (res == 'n2') {
                            sweetAlert("Hidden!", "Now your name is NOT visible to this person!", "success");
                            setTimeout(refreshMember, 2000);
                        }
                        else if (res == 'e1') {
                            sweetAlert("Oops...", "Something went wrong!, Please try again", "error");
                            setTimeout(refreshMember, 2000);
                        }

                        //window.location='member.jsp';
                    }
                }
            }
        } else {
            swal({title: "Are you sure?", text: "Now your name is visible to this person", type: "warning", showCancelButton: true, confirmButtonColor: "#e2335b", confirmButtonText: "Yes, Show it!", closeOnConfirm: false},
            function() {
                xmlHttp = getXMLHTTPRequest();
                if (xmlHttp == null) {
                    alert("No Ajax Object in DOM");
                } else {
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    xmlHttp.send('user_id=<%=user.getIduser()%>&proposal_id=' + proposal_id + '&visibility=' + visibility);
                    //alert("send");
                    xmlHttp.onreadystatechange = function() {
                        if (xmlHttp.readyState == 4) {
                            var res = xmlHttp.responseText;
                            if (res == 'n2') {
                                swal("Invisible!", "Now your name is NOT visible to this person!", "success");
                                setTimeout(refreshMember, 2000);
                            }
                            else if (res == 'e1') {
                                sweetAlert("Oops...", "Something went wrong!, Please try again", "error");
                                setTimeout(refreshMember, 2000);
                            }
                            //refreshProposal(p_id);
                            //window.location='member.jsp';
                        }
                    }
                }
                sweetAlert("Showed!", "Your name is visible only to this person.", "success");
                setTimeout(refreshMember, 2000);
            });
            //alert("ajax");


        }
    }

    function disableMenubar() {
        var menu = document.getElementById('navbar');
        var menu_elements = menu.getElementsByTagName('li');
        for (var i = 0; i < menu_elements.length; i++) {
            menu_elements[i].classList.remove("active");
        }
    }
    function disableProposals() {

        var proposal_menu = document.getElementById('sub-menu_proposal');
        var list1 = proposal_menu.getElementsByTagName('li');
        for (var i = 0; i < list1.length; i++) {
            list1[i].classList.remove("active");
        }
        var accepted_menu = document.getElementById('sub-menu_accepted');
        var list2 = accepted_menu.getElementsByTagName('li');
        for (var i = 0; i < list2.length; i++) {
            list2[i].classList.remove("active");
        }

    }

    function showProposalPic(img_url) {

        swal({title: "Congratulations!", text: "Go to the Accepted list to find more details", imageUrl: img_url});
    }

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
<script src="js/cropbox.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>


</body>
</html>
<%
        hib.transaction.commit();
        hib.session.close();
    }%>