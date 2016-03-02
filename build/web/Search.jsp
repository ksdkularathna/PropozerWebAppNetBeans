<%-- 
    Document   : searchResults
    Created on : Jun 22, 2015, 9:24:46 AM
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


<html>
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
            //e.printStackTrace();
        }
    %>
    <head>
        <meta charset="utf-8">

        <title>Search</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
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
        <script src="js/jquery.js"></script>

        <style type="text/css">

            div.vertical
            {

                margin-left: -22px;
                position: absolute;
                width: 50px;
                transform: rotate(-90deg);
                -webkit-transform: rotate(-90deg); /* Safari/Chrome */
                -moz-transform: rotate(-90deg); /* Firefox */
                -o-transform: rotate(-90deg); /* Opera */
                -ms-transform: rotate(-90deg); /* IE 9 */
                font-size: x-small;
                color: #aeaaaa;
                padding: 5px;
            }

            td.vertical
            {
                height: 30px;
                line-height: 14px;
                padding-bottom: 0px;
                text-align: left;

                padding: 5px;

            }
        </style>

        <script type="text/javascript">

            function clearAll() {
                document.getElementById("city").value = "Any";
                document.getElementById("m_status").value = "Any";
                document.getElementById("edu_level").value = "Any";
                document.getElementById("religion").value = "Any";
                document.getElementById("age_from").value = "Any";
                document.getElementById("age_to").value = "Any";
                document.getElementById("height_from").value = "Any";
                document.getElementById("height_to").value = "Any";
                document.getElementById("country").value = "Any";
                document.getElementById("m_tongue").value = "Any";
            }
            function initResults() {
                document.getElementById("<%=gender%>").checked = true;
            }
            function msg() {

                swal({title: "Sweet!", text: "Before Proposing, Please login to your Propozer Account or Sign Up today!", imageUrl: "images/logo_icon.png"});
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
            function propose(url, proposal_id) {
                //alert("ajax");
                xmlHttp = getXMLHTTPRequest();
                if (xmlHttp == null) {
                    alert("No Ajax Object in DOM");
                } else {
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    //alert();
                    xmlHttp.send('user_id=<%=request.getAttribute("userid")%>&proposal_id=' + proposal_id);
                    //alert("send");
                    xmlHttp.onreadystatechange = function() {
                        if (xmlHttp.readyState == 4) {
                            var res = xmlHttp.responseText;
                            if (res != "" || res != null) {
                               // alert(res);
                                //swal(res);
                            }
                        }

                    }
                }
            }
        </script>



    </head><!--/head-->

    <body onload="initResults()">
        <script src="js/FB_SDK.js"></script>       
        <%@ include file="header.jsp"%>
        <section id="do_action">
            <div class="col-md-3 col-md-offset-9">
                <form action="searchByID" method="post">
                    <input type='text'  name='username_id' placeholder="Search by ID" style="margin-top: 9px;">                                      
                    <input type='submit' value='Search' style="margin-top: 9px;">                                       
                </form>
            </div>
        </section>
        <section><!--search resultz-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2 class="title text-center">Search</h2>
                            <div id="search-box" class="panel-group category-products" style="border: 1px; dotted:#e696aa;">
                                <form action='advanceSearch' method='post' class='search_form'>
                                    <table class='table' style="margin-bottom: 0px;">
                                        <tr><td>Gender</td><td><input type='radio' id="Female" name='gender' value="Female" required><span style="font-size: small">&nbspWoman</span> </td> <td><input type='radio' id="Male" name='gender' value="Male" required><span style="font-size: small">&nbspMan</span></td>  </tr>
                                        <tr>
                                            <td width="40%">Height</td>
                                            <td width="30%"><span style="font-size:x-small">From</span><select class='' name='height_from' id='height_from'><option selected="selected" value='Any'>Any</option><option value='90'>3ft0in - 90 cm</option><option value='92.5'>3ft1in - 92.5 cm</option><option value='95'>3ft2in - 95 cm</option><option value='97.5'>3ft3in - 97.5 cm</option><option value='100'>3ft4in - 100 cm</option><option value='102.5'>3ft5in - 102.5 cm</option><option value='105'>3ft6in - 105 cm</option><option value='107.5'>3ft7in - 107.5 cm</option><option value='110'>3ft8in - 110 cm</option><option value='112.5'>3ft9in - 112.5 cm</option><option value='115'>3ft10in - 115 cm</option><option value='117.5'>3ft11in - 117.5 cm</option><option value='120'>4ft0in - 120 cm</option><option value='122.5'>4ft1in - 122.5 cm</option><option value='125'>4ft2in - 125 cm</option><option value='127.5'>4ft3in - 127.5 cm</option><option value='130'>4ft4in - 130 cm</option><option value='132.5'>4ft5in - 132.5 cm</option><option value='135'>4ft6in - 135 cm</option><option value='137.5'>4ft7in - 137.5 cm</option><option value='140'>4ft8in - 140 cm</option><option value='142.5'>4ft9in - 142.5 cm</option><option value='145'>4ft10in - 145 cm</option><option value='147.5'>4ft11in - 147.5 cm</option><option value='150'>5ft0in - 150 cm</option><option value='152.5'>5ft1in - 152.5 cm</option><option value='155'>5ft2in - 155 cm</option><option value='157.5'>5ft3in - 157.5 cm</option><option value='160'>5ft4in - 160 cm</option><option value='162.5'>5ft5in - 162.5 cm</option><option value='165'>5ft6in - 165 cm</option><option value='167.5'>5ft7in - 167.5 cm</option><option value='170'>5ft8in - 170 cm</option><option value='172.5'>5ft9in - 172.5 cm</option><option value='175'>5ft10in - 175 cm</option><option value='177.5'>5ft11in - 177.5 cm</option><option value='180'>6ft0in - 180 cm</option><option value='182.5'>6ft1in - 182.5 cm</option><option value='185'>6ft2in - 185 cm</option><option value='187.5'>6ft3in - 187.5 cm</option><option value='190'>6ft4in - 190 cm</option><option value='192.5'>6ft5in - 192.5 cm</option><option value='195'>6ft6in - 195 cm</option><option value='197.5'>6ft7in - 197.5 cm</option><option value='200'>6ft8in - 200 cm</option><option value='202.5'>6ft9in - 202.5 cm</option><option value='205'>6ft10in - 205 cm</option><option value='207.5'>6ft11in - 207.5 cm</option><option value='210'>7ft0in - 210 cm</option><option value='212.5'>7ft1in - 212.5 cm</option><option value='215'>7ft2in - 215 cm</option><option value='217.5'>7ft3in - 217.5 cm</option><option value='220'>7ft4in - 220 cm</option><option value='222.5'>7ft5in - 222.5 cm</option></select></td>
                                            <td width="30%"><span style="font-size:x-small">To</span><select class='' name='height_to' id='height_to'><option selected="selected" value='Any'>Any</option><option value='90'>3ft0in - 90 cm</option><option value='92.5'>3ft1in - 92.5 cm</option><option value='95'>3ft2in - 95 cm</option><option value='97.5'>3ft3in - 97.5 cm</option><option value='100'>3ft4in - 100 cm</option><option value='102.5'>3ft5in - 102.5 cm</option><option value='105'>3ft6in - 105 cm</option><option value='107.5'>3ft7in - 107.5 cm</option><option value='110'>3ft8in - 110 cm</option><option value='112.5'>3ft9in - 112.5 cm</option><option value='115'>3ft10in - 115 cm</option><option value='117.5'>3ft11in - 117.5 cm</option><option value='120'>4ft0in - 120 cm</option><option value='122.5'>4ft1in - 122.5 cm</option><option value='125'>4ft2in - 125 cm</option><option value='127.5'>4ft3in - 127.5 cm</option><option value='130'>4ft4in - 130 cm</option><option value='132.5'>4ft5in - 132.5 cm</option><option value='135'>4ft6in - 135 cm</option><option value='137.5'>4ft7in - 137.5 cm</option><option value='140'>4ft8in - 140 cm</option><option value='142.5'>4ft9in - 142.5 cm</option><option value='145'>4ft10in - 145 cm</option><option value='147.5'>4ft11in - 147.5 cm</option><option value='150'>5ft0in - 150 cm</option><option value='152.5'>5ft1in - 152.5 cm</option><option value='155'>5ft2in - 155 cm</option><option value='157.5'>5ft3in - 157.5 cm</option><option value='160'>5ft4in - 160 cm</option><option value='162.5'>5ft5in - 162.5 cm</option><option value='165'>5ft6in - 165 cm</option><option value='167.5'>5ft7in - 167.5 cm</option><option value='170'>5ft8in - 170 cm</option><option value='172.5'>5ft9in - 172.5 cm</option><option value='175'>5ft10in - 175 cm</option><option value='177.5'>5ft11in - 177.5 cm</option><option value='180'>6ft0in - 180 cm</option><option value='182.5'>6ft1in - 182.5 cm</option><option value='185'>6ft2in - 185 cm</option><option value='187.5'>6ft3in - 187.5 cm</option><option value='190'>6ft4in - 190 cm</option><option value='192.5'>6ft5in - 192.5 cm</option><option value='195'>6ft6in - 195 cm</option><option value='197.5'>6ft7in - 197.5 cm</option><option value='200'>6ft8in - 200 cm</option><option value='202.5'>6ft9in - 202.5 cm</option><option value='205'>6ft10in - 205 cm</option><option value='207.5'>6ft11in - 207.5 cm</option><option value='210'>7ft0in - 210 cm</option><option value='212.5'>7ft1in - 212.5 cm</option><option value='215'>7ft2in - 215 cm</option><option value='217.5'>7ft3in - 217.5 cm</option><option value='220'>7ft4in - 220 cm</option><option value='222.5'>7ft5in - 222.5 cm</option></select></td></tr>
                                        <tr><td>Age</td><td><span style="font-size:x-small">From</span> <select class='' name='age_from' id='age_from'><option selected="selected" value='Any'>Any</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option><option value='32'>32</option><option value='33'>33</option><option value='34'>34</option><option value='35'>35</option><option value='36'>36</option><option value='37'>37</option><option value='38'>38</option><option value='39'>39</option><option value='40'>40</option><option value='41'>41</option><option value='42'>42</option><option value='43'>43</option><option value='44'>44</option><option value='45'>45</option><option value='46'>46</option><option value='47'>47</option><option value='48'>48</option><option value='49'>49</option><option value='50'>50</option><option value='51'>51</option><option value='52'>52</option><option value='53'>53</option><option value='54'>54</option><option value='55'>55</option><option value='56'>56</option><option value='57'>57</option><option value='58'>58</option><option value='59'>59</option><option value='60'>60</option><option value='61'>61</option><option value='62'>62</option><option value='63'>63</option><option value='64'>64</option><option value='65'>65</option></select></td><td><span style="font-size:x-small">To</span><select class='' name='age_to' id='age_to'><option selected="selected" value='Any'>Any</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option><option value='32'>32</option><option value='33'>33</option><option value='34'>34</option><option value='35'>35</option><option value='36'>36</option><option value='37'>37</option><option value='38'>38</option><option value='39'>39</option><option value='40'>40</option><option value='41'>41</option><option value='42'>42</option><option value='43'>43</option><option value='44'>44</option><option value='45'>45</option><option value='46'>46</option><option value='47'>47</option><option value='48'>48</option><option value='49'>49</option><option value='50'>50</option><option value='51'>51</option><option value='52'>52</option><option value='53'>53</option><option value='54'>54</option><option value='55'>55</option><option value='56'>56</option><option value='57'>57</option><option value='58'>58</option><option value='59'>59</option><option value='60'>60</option><option value='61'>61</option><option value='62'>62</option><option value='63'>63</option><option value='64'>64</option><option value='65'>65</option></select></td></tr>
                                        <tr><td>Country</td><td colspan="2"><select class="" name="country" id="country" required>
                                                    <option selected="selected" value="Any">Any</option>
                                                    <option value="Sri Lanka">Sri Lanka</option>
                                                    <option value="America">America </option>
                                                    <option value="Australia">Australia </option>
                                                    <option value="Bahrain">Bahrain </option>
                                                    <option value="Bangladesh">Bangladesh </option>
                                                    <option value="Canada">Canada </option>
                                                    <option value="Chaina">China </option>
                                                    <option value="Christmas Island">Christmas Island </option>
                                                    <option value="France">France </option>
                                                    <option value="Germany">Germany </option>
                                                    <option value="Hong Kong ">Hong Kong </option>
                                                    <option value="India">India </option>
                                                    <option value="Israel">Israel </option>
                                                    <option value="Italy">Italy </option>
                                                    <option value="Japan">Japan </option>
                                                    <option value="Korea">Korea </option>
                                                    <option value="Kuwait">Kuwait </option>
                                                    <option value="Lebanon">Lebanon </option>
                                                    <option value="Libya">Libya </option>
                                                    <option value="Malaysia">Malaysia </option>
                                                    <option value="Maldives">Maldives </option>
                                                    <option value="Qatar">Qatar </option>
                                                    <option value="Russia">Russia </option>
                                                    <option value="Saudi Arabia">Saudi Arabia </option>
                                                    <option value="Singapore">Singapore </option>
                                                    <option value="United Kingdom">United Kingdom </option>

                                                </select></td></tr>
                                        <tr><td>City</td><td colspan='2'>
                                                <select class='' name='city' id='city'>
                                                    <option selected="selected" value='Any'>Any</option>
                                                    <option value='Ampara'>Ampara
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
                                                    </option><option value='Vavuniya'>Vavuniya</option></select></td></tr>

                                        <tr><td>Marital Status</td><td colspan='2'>
                                                <select class='' name='m_status' id='m_status'>
                                                    <option selected="selected" value='Any'>Any</option>
                                                    <option value='Single'>Single</option>                                                   
                                                    </option><option value='Divorced'>Divorced
                                                    </option><option value='Widowed'>Widowed</option></select></td></tr>
                                        <tr><td>Religion</td><td colspan='2'>
                                                <select class='' name='religion' id='religion'>
                                                    <option selected="selected" value='Any'>Any</option>
                                                    <option value='Buddhist'>Buddhist
                                                    </option><option value='Catholic'>Catholic
                                                    </option><option value='Islam'>Islam
                                                    </option><option value='Hindu'>Hindu
                                                    </option><option value='Other'>Other
                                                    </option></select></td></tr>

                                        <tr><td>Speaks</td><td colspan='2'>
                                                <select class='' name='m_tongue' id='m_tongue'>
                                                    <option selected="selected" value='Any'>Any</option><option value='Sinhala'>Sinhala
                                                    </option><option value='Tamil'>Tamil
                                                    </option><option value='English'>English
                                                    </option><option value='Other'>Other</option></select></td></tr>
                                        <tr><td>Education</td><td colspan='2'>
                                                <select class='' name='edu_level' id='edu_level'>
                                                    <option selected="selected" value='Any'>Any</option>
                                                    <option value='Passed A/L'>A/L  Pass
                                                    </option><option value='Passed O/L'>O/L Pass
                                                    </option><option value='Bachelors'>Bachelors
                                                    </option><option value='Masters'>Masters
                                                    </option><option value='Doctorate'>Doctorate
                                                    </option><option value='Other'>Other
                                                    </option></select></td></tr>
                                        <tr><td></td><td colspan='2'>
                                                <input type='submit' width='' height='' class="btn btn-primary" name='submit'  value='Search' style="margin-top: 0px;">
                                                <input type='button' width='' height='' class="btn btn-primary" name='clear'  value='Clear' style="margin-top: 0px;" onclick="clearAll()">                                      
                                            </td></tr></table></form>    </div>

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right" >
                        <div class="features_items"><!--features_items-->
                            <%
                                HibSession hib = new HibSession();
                                Query q1 = hib.session.createQuery("from User where gender='" + gender + "' AND iduser!='" + request.getAttribute("userid") + "' ");
                                List<User> list = (List<User>) q1.list();
                            %>
                            <h2 class="title text-center"><%if (list.size() == 1) {%><%=list.size()%> result found<%} else {%> <%=list.size()%> results found<%}%></h2>

                            <%if (list != null) {
                                    for (User results : list) {
                                        Boolean proposeStatus = false;
                                        Query q2 = hib.session.createQuery("from Userrequests where userId='" + results.getIduser() + "' AND user='" + request.getAttribute("userid") + "'");
                                        Userrequests proposal = (Userrequests) q2.uniqueResult();
                                        if (proposal != null) {
                                            proposeStatus = true;
                                        } else {
                                            proposeStatus = false;
                                        }

                            %> 

                            <div class="col-sm-5" >

                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">

                                            <table class="table table-condensed total-result" style="margin-bottom: 0px;">
                                                <tbody>
                                                    <tr>
                                                        <td class="vertical"><div class="vertical" style="background-color: #aafb9d;">Self</div></td>
                                                        <%if (results.getYourself().length() < 90) {%>
                                                        <td>"<%=results.getYourself()%>"</td>
                                                        <td><br><br></td>
                                                            <%} else {%>
                                                        <td>"<%=results.getYourself().substring(0, 74)%>..."</td>
                                                        <%}%>
                                                    </tr>
                                                    <tr><td class="vertical"><div class="vertical" style="background-color: #fecbcc;">Family</div></td>
                                                        <%if (results.getBackground().length() < 90) {%>
                                                        <td>"<%=results.getBackground()%>"</td>
                                                        <td><br><br></td>
                                                            <%} else {%>
                                                        <td>"<%=results.getBackground().substring(0, 74)%>..."</td>
                                                        <%}%>
                                                    </tr>                                                

                                                    <tr><td class="vertical"><div class="vertical" style="background-color: #ebfaa4 ;">Education</div></td>
                                                        <%if (results.getEducationStatus().length() < 90) {%>
                                                        <td>"<%=results.getEducationStatus()%>"</td>
                                                        <td><br><br></td>
                                                            <%} else {%>
                                                        <td>"<%=results.getEducationStatus().substring(0, 74)%>..."</td>
                                                        <%}%>
                                                    </tr>
                                                    <tr><td class="vertical"><div class="vertical" style="background-color: #f8b3a0 ;">Look for</div></td>
                                                        <%if (results.getExpectations().length() < 90) {%>
                                                        <td>"<%=results.getExpectations()%>"</td>
                                                        <td><br><br></td>
                                                            <%} else {%>
                                                        <td>"<%=results.getExpectations().substring(0, 74)%>..."</td>
                                                        <%}%>
                                                    </tr>

                                                </tbody>

                                            </table>

                                            <ul class="nav nav-pills nav-stacked search_box_info">
                                                <table class="table table-condensed total-result" style="margin-bottom: 0px;">

                                                    <tbody>
                                                        <tr>
                                                            <td><li><a href=""><i class="fa fa-arrow-v"></i></i><%=results.getHeight()%></a></li></td>
                                                    <td><li><a href=""><i class="fa fa-user"></i><%=results.getAge()%> years</a></li></td>
                                                    </tr>

                                                    <tr>
                                                        <td> <li><a href=""><i class="fa fa-map-marker"></i><%=results.getCity()%></a></li></td>
                                                    <td><li><a href=""><i class="fa fa-flag"></i><%=results.getCountry()%></a></li></td>
                                                    </tr>
                                                    <tr >
                                                        <td>  <li><a href=""><i class="fa fa-heart"></i><%=results.getMaritalStatus()%></a></li></td>
                                                    <td><li><a href=""><i class="fa fa-star"></i><%=results.getReligion()%></a></li></td>
                                                    </tr>
                                                    <tr >
                                                        <td><li><a href=""><i class="fa fa-book"></i><%=results.getEducationLevel()%></a></li></td>
                                                        <td><li><a href=""><i class="fa fa-signal"></i><%=results.getIncome()%></a></li></td>
                                                        </tr>
                                                 
                                                    </tbody>

                                                </table>
                                            </ul>

                                        </div>

                                        <div class="product-overlay" <%if (proposeStatus == true) {%>
                                             style="background:#28c6ee;"
                                             <%} else {%>
                                             style="background:#e2335b;"
                                             <%}%>>
                                            <div class="overlay-content">
                                                <h2><%=results.getUserNameId()%></h2>
                                                <h5>User ID</h5>
                                                <a href="viewProfile.jsp?propose_id=<%=results.getIduser()%>" class="btn btn-default add-to-cart"><i class="fa fa-user"></i>View</a>
                                                <%if (user == null) {%>
                                                <a onclick="msg()" class="btn btn-default add-to-cart"><i class="fa fa-heart"></i>Like</a>
                                                <%} else if (user != null && proposeStatus) {%>
                                                <a href="" onclick="propose('removeProposal', '<%=results.getIduser()%>')" class="btn btn-default add-to-cart"><i class="fa fa-times"></i>Unlike</a>                                                
                                                <%} else {%>                                                
                                                <a href="" onclick="propose('addProposal', '<%=results.getIduser()%>')" class="btn btn-default add-to-cart"><i class="fa fa-heart"></i>Like</a>                                                
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <%}
                                }%>

                        </div><!--features_items-->
                    </div>
                </div>
            </div>
        </section>
        <!--/search resultz-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-70139440-1', 'auto');
  ga('send', 'pageview');

</script>

        <%@ include file="footer.jsp" %>

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