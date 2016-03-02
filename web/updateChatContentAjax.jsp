<%-- 
    Document   : chatContent
    Created on : Sep 23, 2015, 10:05:57 AM
    Author     : Sampath Dhananjaya
--%>

<%@page import="com.hib.mappings.Chatmessages"%>
<%@page import="java.util.List"%>
<%@page import="com.hib.mappings.Userrequests"%>
<%@page import="com.hib.mappings.Userthreads"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.hib.servlets.HibSession"%>
<%@page import="com.hib.mappings.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (request.getSession().getAttribute("loguser") == null) {
        response.sendRedirect("index.jsp");
    } else {
        String thread_id = null;
        String user_id = null;
        String msg_id = null;

        if (request.getParameter("thread_id") != null) {
            thread_id = request.getParameter("thread_id");
        }
        if (request.getParameter("user_id") != null) {
            user_id = request.getParameter("user_id");
        }
        if (request.getParameter("msg_id") != null) {
            msg_id = request.getParameter("msg_id");
        } else {
            msg_id = "0";
        }
        HibSession hib = new HibSession();
        Query q1 = hib.session.createQuery("from Userthreads where iduserThreads='" + thread_id + "'");
        Userthreads thread = (Userthreads) q1.uniqueResult();
        if (thread != null) {
            Query q2 = null;
            if (user_id.equals(thread.getUserByUser1().getIduser().toString())) {
                q2 = hib.session.createQuery("from Userrequests where userId='" + user_id + "' AND user='" + thread.getUserByUser2().getIduser() + "'");
            } else {
                q2 = hib.session.createQuery("from Userrequests where userId='" + user_id + "' AND user='" + thread.getUserByUser1().getIduser() + "'");
            }
            Userrequests proposal = (Userrequests) q2.uniqueResult();
            // applying seen to inbox list
            Query q3 = hib.session.createQuery("from Chatmessages where userthreads='" + thread.getIduserThreads() + "' and userByMsgTo='" + user_id + "'");
            List<Chatmessages> inbox_list = (List<Chatmessages>) q3.list();
            if (inbox_list != null) {
                for (Chatmessages msg : inbox_list) {
                    msg.setSeen(true);
                }
            }
            Query q4 = hib.session.createQuery("from Chatmessages where userthreads='" + thread.getIduserThreads() + "' and msgId >'" + msg_id + "'");
            List<Chatmessages> msg_list = (List<Chatmessages>) q4.list();
            if (msg_list != null) {

%>
<html>
    <body>  
        <%      for (Chatmessages msg : msg_list) {
                msg_id = msg.getMsgId().toString();
        %>
        <div class="group-rom">
            <%if (user_id.equals(msg.getUserByMsgFrom().getIduser().toString())) {%>
            <div class="first-part">Me</div>
            <div id="xxx" class="second-part"><%=msg.getMessage()%></div>
            <div class="third-part"><%=msg.getDate()%></div>              
        </div>
        <%} else {%>
        <div class="group-rom">             
            <%if (proposal.isReceiverVisibility()) {%>
            <div class="first-part odd"><%=msg.getUserByMsgFrom().getFname()%></div>
            <%} else {%>
            <div class="first-part odd"><%=msg.getUserByMsgFrom().getUserNameId()%></div>
            <%}%>                
            <div id="xxx" class="second-part"><%=msg.getMessage()%></div>
            <div class="third-part"><%=msg.getDate()%></div>
        </div>
        <%}
            }
        %>
        <input id="c_no" value="<%=msg_id%>" type="hidden"/>

    </body>
</html>
<%}
        }
        hib.transaction.commit();
        hib.session.close();
    }%>