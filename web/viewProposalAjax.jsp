<%-- 
    Document   : viewProposalAjax
    Created on : Jun 25, 2015, 5:22:42 PM
    Author     : Sampath Dhananjaya
--%>

<%@page import="com.hib.mappings.Userthreads"%>
<%@page import="com.hib.mappings.Userrequests"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.hib.servlets.HibSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HibSession hib = new HibSession();
        String user_id = request.getParameter("user_id");
        String proposal_id = request.getParameter("proposal_id");
        String image_string = null;
        Query q1 = hib.session.createQuery("from Userrequests where userId='" + user_id + "' AND user='" + request.getParameter("proposal_id") + "'");
        Userrequests proposal = (Userrequests) q1.uniqueResult();

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
    </head>
    <body>
        <%if (proposal != null) {
                if (proposal.getUser().getPropicture() != null) {
                    byte[] bytes = proposal.getUser().getPropicture();
                    image_string = new String(bytes, "ISO-8859-1");
                }
        %>
        <div class="reviews">
            <div class="col-sm-7" >
                <div class="proposal-information" ><!--/proposal-information-->
                    <%if (!proposal.isReceiverVisibility()) {%>
                    <h4 align="center" style="color: #bfbcb9">User ID - <%=proposal.getUser().getUserNameId()%></h4>
                    <%} else {%>
                    <h4 align="center" style="color: #bfbcb9"><%=proposal.getUser().getFname()%></h4>              
                    <%}%>
                    <div class="col-sm-12" >
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">

                                    <table class="table table-condensed total-result">

                                        <tbody>
                                            <tr><td>"<%=proposal.getUser().getYourself()%>"</td></tr>
                                            <tr><td>"<%=proposal.getUser().getBackground()%>"</td></tr>
                                            <tr><td>"<%=proposal.getUser().getEducationStatus()%>"</td></tr>
                                            <tr><td>"<%=proposal.getUser().getExpectations()%>"</td></tr>

                                        </tbody>

                                    </table>

                                    <ul class="proposal-information" style="background-color: #9dd8db; padding: 10px;">
                                        <li> Height : <%=proposal.getUser().getHeight()%> cm</li><br>
                                        <li>Profession : <%=proposal.getUser().getProfession()%></li><br>
                                        <li>Education : <%=proposal.getUser().getEducationLevel()%></li><br>
                                        <li>Income : <%=proposal.getUser().getIncome()%></li>
                                    </ul>

                                    <ul class="proposal-information" style="background-color: #b4f4a4; padding: 10px;">
                                        <li> |<%=proposal.getUser().getMaritalStatus()%>|</li><br>
                                        <li>|<%=proposal.getUser().getReligion()%>|</li><br>
                                        <li>|<%=proposal.getUser().getMothertongue()%>|</li><br>

                                    </ul>

                                    <ul class="proposal-information" style="background-color: #dbd692; padding: 10px;">
                                        <li><b>Age :<%=proposal.getUser().getAge()%></b> </li>
                                        <li><b><%=proposal.getUser().getCity()%></b></li><br>

                                    </ul>

                                </div>
                                <hr>
                                <div class="p-meta">
                                    <div  align="center">
                                        <%
                                            Query q2 = hib.session.createQuery("from Userrequests where userId='" + proposal_id + "' AND user='" + user_id + "'");
                                            Userrequests sender_proposal = (Userrequests) q2.uniqueResult();
                                            Query q3 = hib.session.createQuery("from Userthreads where (userByUser1='" + user_id + "' and userByUser2='" + proposal_id + "') or (userByUser2='" + user_id + "' and userByUser1='" + proposal_id + "')");
                                            Userthreads thread = (Userthreads) q3.uniqueResult();
                                            if (thread != null) {
                                        %>
                                        <a href="chatRoom.jsp?thread_id=<%=thread.getIduserThreads()%>" class="btn btn-primary add-to-cart" ><i class="fa fa-envelope"></i>Chat</a>
                                        <%}
                                            if (!proposal.isAcceptance()) {%>                                         
                                        <a href="#" onclick="acceptProposal('acceptProposal', '<%=proposal.getUser().getIduser()%>', 'true'), showProposalPic('<%=image_string%>')" class="btn btn-primary add-to-cart" ><i class="fa fa-check"></i>Accept</a>                                            
                                        <%} else {
                                            if (!sender_proposal.isReceiverVisibility()) {%>
                                        <a href ="#" onclick="showName('showName', '<%=proposal.getUser().getIduser()%>', '<%=proposal.getIduserRequests()%>', 'true')" class="btn btn-primary add-to-cart" ><i class="fa fa-check"></i>Show My Name</a>
                                        <%} else {%>
                                        <a href="#" onclick="showName('showName', '<%=proposal.getUser().getIduser()%>', '<%=proposal.getIduserRequests()%>', 'false')" class="btn btn-primary add-to-cart" ><i class="fa fa-times"></i>Hide My Name</a>
                                        <%}%>
                                        <a href="#" onclick="removeProposal('removeProposal', '<%=proposal.getUser().getIduser()%>')" class="btn btn-primary add-to-cart" ><i class="fa fa-times"></i>Remove</a>
                                        <%}%>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                </div><!--/proposal-information-->

            </div>
            <div class="col-sm-4">
                <div class="price-range" ><!--price-range-->

                    <div class="well1">
                        <%  if (proposal.isAcceptance()) {%>
                        <img style="height: 300px; width: 300px; margin-top: 45px;" src="<%=image_string%>" class="newarrival" alt="" />
                        <%} else if (proposal.getUser().getGender().equals("Female")) {%>                      
                        <img style="height: 300px; width: 300px; margin-top: 45px;" src="images/home/female_fb.jpg" class="newarrival" alt="" />                   
                        <%} else {%>
                        <img style="height: 300px; width: 300px; margin-top: 45px;" src="images/home/male_fb.jpg" class="newarrival" alt="" />
                        <%}%>
                    </div>
                </div>
            </div><!--/price-range-->

        </div>
        <%} else {%>
        <div><p><h2 style="color: red;">Proposal is already Removed !!! </h2></p></div>
            <%}%>
</body>
</html>
<%
    hib.transaction.commit();
    hib.session.close();
%>