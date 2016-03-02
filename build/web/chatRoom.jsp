<%-- 
    Document   : chatRoom
    Created on : Sep 23, 2015, 9:28:19 AM
    Author     : Sampath Dhananjaya
--%>

<%@page import="com.hib.mappings.Userthreads"%>
<%@page import="com.hib.mappings.Userrequests"%>
<%@page import="java.util.List"%>
<%@page import="com.hib.mappings.User"%>
<%@page import="com.hib.servlets.HibSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("loguser") == null) {
        response.sendRedirect("index.jsp");
    } else {
        User user = (User) request.getSession().getAttribute("loguser");
        String msg = "";
        String thread_id = null;

        if (request.getParameter("msg") == null) {
            msg = "";
        } else {
            msg = request.getParameter("msg");
        }
        if (request.getParameter("thread_id") != null) {
            thread_id = request.getParameter("thread_id");
        }

   // User user = (User) request.getSession().getAttribute("loguser");

%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Proposal Chat </title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/chat-style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <meta name="description" content="Propozer is a unique, Confidential, innovative and professional way of finding partners. We offer you the best possible matches of grooms and brides according to your wish. Join FREE!" />
        <meta name="keywords" content="find love, find a girlfriend, find a boy friend, propozer, proposal, place foe love, wedding, matchmaking, matchmaking service, matrimonial, life partner, Astrology Matching, Matrimonial, Matrimony, Sri lankan Matrimonial, Srilanka Matrimonials, free matrimonial site, matrimonial sites Sri Lanka, matrimonial lk, matrimonial websites, bridegroom, Online Matrimonials" />
        <meta name="author" content="metatags generator">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
          <script src="js/chat.js"></script>
        <![endif]-->
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

        <script>
            var current_thread = null;
            var current_msgid = "0";
            function initConversation() {
                getConversation('getChatContentAjax.jsp', '<%=thread_id%>', '<%=user.getIduser()%>');
                setTimeout(updateChat, 3000);
            }
            function send() {
                var msg = document.getElementById('chatbox').value;
                addAMessage('addMessage', '<%=user.getIduser()%>', current_thread, msg);
                document.getElementById('chatbox').value = "";
                //setTimeout(chatScroll,2000);
            }
            function updateChat() {
                updateConversation('updateChatContentAjax.jsp', '<%=user.getIduser()%>', current_thread, current_msgid);
                //alert(current_thread);
                
                setTimeout(updateChat, 2000);
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

            function getConversation(url, thread_id, user_id) {
                current_thread = thread_id;
                //alert("current thread : "+current_thread);
                xmlHttp = getXMLHTTPRequest();
                if (xmlHttp == null) {
                    alert("No Ajax Object in DOM");
                } else {
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    //alert(thread_id + " " + user_id);
                    if (thread_id != 'null') {
                        xmlHttp.send('thread_id=' + thread_id + '&user_id=' + user_id);
                        //alert("get sent");
                    }
                    //alert("get sent");

                    xmlHttp.onreadystatechange = function () {
                        if (xmlHttp.readyState == 4) {
                            var res = xmlHttp.responseText;
                            //alert("received");
                            document.getElementById("conversation").innerHTML = res;
                            current_msgid = document.getElementById("c_no").value;

                            //alert("returning msg_id in get :" + current_msgid);
                            //alert("res");
                        }

                    }
                }
            }
            function updateConversation(url, user_id, thread_id, msg_id) {
                //alert("update");               
                //alert(thread_id);
                //alert(user_id);
                //alert(msg_id);
                var c_no = document.getElementById('c_no');
                if (c_no != null) {
                    c_no.remove();
                }
                xmlHttp = getXMLHTTPRequest();
                if (xmlHttp == null) {
                    alert("No Ajax Object in DOM");
                } else {
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    if (thread_id != 'null') {
                        xmlHttp.send('thread_id=' + thread_id + '&msg_id=' + msg_id + '&user_id=' + user_id);
                        //alert("update");
                    }
                    //alert("update");
                    xmlHttp.onreadystatechange = function () {
                        if (xmlHttp.readyState == 4) {
                            var res = xmlHttp.responseText;
                            document.getElementById("conversation").innerHTML += res;                          
                            var new_msgid = document.getElementById("c_no").value;
                            if (new_msgid != current_msgid) {
                                chatScroll();
                            }
                            current_msgid = new_msgid;                          
                            //alert("returning msg_id in update :" + current_msgid);
                            //alert(res);
                            
                        }

                    }
                }
            }
            function chatScroll(){
                var chat_div = document.getElementById("conversation");
                chat_div.scrollTop = chat_div.scrollHeight;
            }
            function addAMessage(url, user_id, thread_id, msg) {
                //alert(user_id);
                //alert(thread_id);
                //alert(msg);
                xmlHttp = getXMLHTTPRequest();
                if (xmlHttp == null) {
                    alert("No Ajax Object in DOM");
                } else {
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    xmlHttp.send('thread_id=' + thread_id + '&msg=' + msg + '&user_id=' + user_id);
                    //alert("add");

                    xmlHttp.onreadystatechange = function () {
                        if (xmlHttp.readyState == 4) {
                            var res = xmlHttp.responseText;
                            //updateChat();
                            

                        }

                    }
                }  
            }
           
              //Auto scroll code.....
              //  var elem = document.getElementById('chat-body');
              //  elem.scrollTop = elem.scrollHeight;

        </script>

    </head>

    <body onload="initConversation()">

        <section id="container" class="">
            <!--header start  <img src="images/home/logo.png" alt="Propozer.lk" style="width: 50%;" >   -->
            <header class="header white-bg">
                
                <!--logo<img class="logo" src="images/home/chat-logo.png" alt="Propozer.lk"  > start-->
 <a class="logo" href="index.jsp"><img src="images/home/chat-logo.png" alt="Propozer |Find Your Better Half|" ></a>

                <!--logo   <a href="index.html" class="logo" >Flat<span>lab</span></a>   end-->

                <div class="top-nav ">
                    <ul class="nav pull-right top-menu">

                        <!-- user login dropdown start-->
                        <li class="dropdown" >
                            <a href="member.jsp">

                                <span class="username">Back to My Profile</span>

                            </a>

                        </li>
                        <!-- user login dropdown end -->
                    </ul>
                </div>
            </header>
            <!--header end-->
            <!--sidebar start-->
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                        <li>
                            <i class="fa fa-envelope"></i>
                            <span>Chat List</span>
                        </li>
                        <%
                            HibSession hib = new HibSession();

                            List<Userthreads> thread_list = hib.session.createQuery("from Userthreads where userByUser1='" + user.getIduser() + "' or userByUser2='" + user.getIduser() + "'").list();
                            if (thread_list != null) {
                                for (Userthreads thread : thread_list) {

                        %>
                        <li class="sub-menu">
                            <a href="#" onclick="getConversation('getChatContentAjax.jsp', '<%=thread.getIduserThreads()%>', '<%=user.getIduser()%>')">
                                <%
                                    String friend = null;
                                    String image_string = null;
                                    Userrequests conversation = null;
                                    if (!user.getIduser().equals(thread.getUserByUser1().getIduser())) {
                                        if (thread.getUserByUser1().getPropicture() != null) {
                                            byte[] bytes = thread.getUserByUser1().getPropicture();
                                            image_string = new String(bytes, "ISO-8859-1");
                                        }
                                        conversation = (Userrequests) hib.session.createQuery("from Userrequests where userId='" + user.getIduser() + "' and user='" + thread.getUserByUser1().getIduser() + "'").uniqueResult();
                                        if (conversation != null) {
                                            if (conversation.isReceiverVisibility()) {
                                                friend = thread.getUserByUser1().getFname()+" "+"("+thread.getUserByUser1().getUserNameId()+")";
                                            } else {
                                                friend = thread.getUserByUser1().getUserNameId();
                                            }
                                        }
                                    } else {
                                        if (thread.getUserByUser2().getPropicture() != null) {
                                            byte[] bytes = thread.getUserByUser2().getPropicture();
                                            image_string = new String(bytes, "ISO-8859-1");
                                        }
                                        conversation = (Userrequests) hib.session.createQuery("from Userrequests where userId='" + user.getIduser() + "' and user='" + thread.getUserByUser2().getIduser() + "'").uniqueResult();
                                        if (conversation != null) {
                                            if (conversation.isReceiverVisibility()) {
                                                friend = thread.getUserByUser2().getFname()+" "+"("+thread.getUserByUser2().getUserNameId()+")";
                                            } else {
                                                friend = thread.getUserByUser2().getUserNameId();
                                            }
                                        }
                                        //friend = thread.getUserByUser2();
                                    }
                                    if (image_string != null) {
                                %>
                                <img src="<%=image_string%>">
                                <%} else {%>
                                <img src="img/chat-avatar.jpg">
                                <%}%>
                                <span><%=friend%></span>
                            </a>
                        </li>
                        <%}
                            }%>


                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <div class="chat-room">
                        <!-- chat content-->
                        <aside class="mid-side" >

                            <div id="conversation" class="chat-body">


                            </div>
                            <div class="footer1">
                                <!-- Adding Smileys-->

                                <div id="dpop" style="visibility: hidden; padding-bottom: 4px;">

                                    <table  class="popup">
                                        <tbody>

                                            <tr>
                                                <td class="left"></td>
                                                <td><table class="popup-contents">
                                                        <tbody>
                                                            <tr>
                                                                <td><img class="facemood" src="images/emoticons/Smile.png" title="Smile" onclick="appendText('chatbox', ':-) ');" border="0" />
                                                                    <img class="facemood" src="images/emoticons/Angel.png" title="Angel" onclick="appendText('chatbox', ':> ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Open-mouthed.png" title="Open-mouthed" onclick="appendText('chatbox', ':-D ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Winking.png" title="Winking" onclick="appendText('chatbox', ';-) ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Loved.png" title="Loved" onclick="appendText('chatbox', ':X ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Tongue.png" title="Tongue" onclick="appendText('chatbox', ':-P ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Nothing.png" title="Nothing" onclick="appendText('chatbox', ':^) ');" border="0" />

                                                                    <img class="facemood" src="images/emoticons/Hot.png" title="Hot" onclick="appendText('chatbox', ':-B ');" border="0" />
                                                                    <img class="facemood" src="images/emoticons/Sad.png" title="Sad" onclick="appendText('chatbox', ':-( ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Worried.png" title="Worried" onclick="appendText('chatbox', ':-S ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Crying.png" title="Crying" onclick="appendText('chatbox', ':-C ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Surprise.png" title="Surprise" onclick="appendText('chatbox', ':-O ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Angry.png" title="Angry" onclick="appendText('chatbox', ':-@ ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Sleepy.png" title="Sleepy" onclick="appendText('chatbox', ':-Z ');" border="0" />

                                                                    <img class="facemood" src="images/emoticons/Like.png" title="Like" onclick="appendText('chatbox', '(y) ');" border="0" />
                                                                    <img class="facemood" src="images/emoticons/Heart.png" title="Heart" onclick="appendText('chatbox', '<3 ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Propozer.png" title="Propozer" onclick="appendText('chatbox', '[logo] ');" border="0" />
                                                                    <img class="facemood"  src="images/emoticons/Kiss.png" title="Kiss" onclick="appendText('chatbox', '{} ');" border="0" />




                                                                <td>
                                                            </tr>


                                                        </tbody>
                                                    </table></td>

                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- Adding Smileys END-->
                                <div class="row">
                                    <div class="chat-txt" style="margin-bottom: 5px;">
                                        <textarea class="form-control" id="chatbox" autofocus></textarea>
                                    </div>
                                    <div class="btn-group">
                                        <button type="button" id="imotion-btn" class="btn btn-white" onclick="javascript:openImotion();"><i class="fa fa-meh-o"></i></button>

                                    </div>
                                    <div class="chat-btn">
                                        <button class="btn btn-danger" id="send" onclick="send()">Send</button>
                                    </div>
                                </div>
                            </div>
                        </aside>
                        <!-- chat content end-->
                        <!-- add content-->
                        <aside class="right-side">


                        </aside>
                        <!-- add content end-->
                    </div>
                    <!-- page end-->
                </section>
            </section>
            <!--main content end-->
            <!--footer start-->

            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/chat.js"></script>


        <!--common script for all pages-->
        <script src="js/common-scripts.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-70139440-1', 'auto');
  ga('send', 'pageview');
  
  $("#chatbox").keyup(function(event){
    if(event.keyCode == 13){
        $("#send").click();
        
    }
});

</script>

    </body>
</html>
<%hib.transaction.commit();
        hib.session.close();
    }%>
