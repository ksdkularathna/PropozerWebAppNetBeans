/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hib.servlets;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Sampath Dhananjaya
 */
public class PasswordReset extends Thread {

    String username;
    String password;
    static String email;

    static final String FROM = "propozerlk@gmail.com";   // Replace with your "From" address. This address must be verified.
    static String TO;  // Replace with a "To" address. If your account is still in the 
    // sandbox, this address must be verified.

    static final String BODY = "This email was sent through the Amazon SES SMTP interface by using Java.";
    static final String SUBJECT = "Amazon SES test (SMTP interface accessed using Java)";

    // Supply your SMTP credentials below. Note that your SMTP credentials are different from your AWS credentials.
    static final String SMTP_USERNAME = "AKIAIP7R36BBIYYQLQFQ";  // Replace with your SMTP username.
    static final String SMTP_PASSWORD = "AtxMON8wt50hjmJjr3rlQXkysjk+dbPDszPgCXyzVNFT";  // Replace with your SMTP password.

    // Amazon SES SMTP host name. This example uses the US West (Oregon) region.
    static final String HOST = "email-smtp.us-east-1.amazonaws.com";

    // Port we will connect to on the Amazon SES SMTP endpoint. We are choosing port 25 because we will use
    // STARTTLS to encrypt the connection.
    static final int PORT = 587;

    public PasswordReset(String username, String password, String email) {
        this.username = username;
        this.password = password;
        PasswordReset.TO = email;

    }

    public void run() {

        try {
            // Create a Properties object to contain connection configuration information.
            Properties props = System.getProperties();
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.port", PORT);

        // Set properties indicating that we want to use STARTTLS to encrypt the connection.
            // The SMTP session will begin on an unencrypted connection, and then the client
            // will issue a STARTTLS command to upgrade to an encrypted connection.
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.starttls.required", "true");

            // Create a Session object to represent a mail session with the specified properties. 
            Session session = Session.getDefaultInstance(props);

            // Create a message with the specified information. 
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(FROM));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
            msg.setSubject("Propozer Account Recovery");
            Multipart multipart = new MimeMultipart("alternative");
            MimeBodyPart htmlPart = new MimeBodyPart();
            String htmlContent = "<html>\n"
                    + "<style>\n"
                    + "\n"
                    + "</style>\n"
                    + "<center>\n"
                    + "<table  center style=\"font-family:Calibri; border-spacing: 15px;\" >\n"
                    + "\n"
                    + "<tr>\n"
                    + "<th style=\"background-color:#e2335b; color:white;\"><span style=\"font-family:  'Roboto', sans-serif;\"><h1 style=\"padding: 15px 10px 0 10px;\">Propozer.LK Account Recovery</h1> </span></th>\n"
                    + "</tr>\n"
                    + "<tr>\n"
                    + "<td><span style=\"color:#e2335b;font-family:  'Roboto', sans-serif;\"> </span></td>\n"
                    + "</tr>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<tr >\n"
                    + "<td><span><p>Please use the following verification code for the login </p> </span></td>\n"
                    + "</tr>\n"
                    + "\n"
                    + "<tr>\n"
                    + "<td style=\"padding:20px;\"><center> <span style=\"font-size:x-large;\"><span style=\"color:#B0B0B0;\">User Name :</span> "+username+"</span></center></td></tr>"                 
                    + "<tr><td style=\"padding:20px;\"><center> <span style=\"font-size:x-large;\"><span style=\"color:#B0B0B0;\">Key Code :</span> "+password+"</span></center></td>\n"
                    + "</tr>\n"
                    + "<tr>\n"
                    + "<p> Go to propozer backup <a href='http://www.propozer.lk/login.jsp'>Login</a> page</p>"
                    + "</tr>\n"
                    + "<tr>\n"
                    + "<td><p><hr><span style=\"color:#888888;\">Confidential, innovative and professional way of finding partners. </span></p>\n"
                    + "<img src=\"http://www.propozer.lk/img/new%20logo.png\" alt=\"Propozer.LK logo\">\n"
                    + "\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</table> </center>\n"
                    + "\n"
                    + " </html>";

            htmlPart.setContent(htmlContent, "text/html");

            multipart.addBodyPart(htmlPart);
            msg.setContent(multipart);
            msg.setSentDate(new Date());

            // Create a transport.        
            Transport transport = session.getTransport("smtps");

            // Send the message.
            try {
                System.out.println("Attempting to send an email through the Amazon SES SMTP interface...");

                // Connect to Amazon SES using the SMTP username and password you specified above.
                transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);

                // Send the email.
                transport.sendMessage(msg, msg.getAllRecipients());
                System.out.println("Email sent!");
            } catch (Exception ex) {
                System.out.println("The email was not sent.");
                System.out.println("Error message: " + ex.getMessage());
            } finally {
                // Close and terminate the connection.
                transport.close();
            }

        } catch (Exception ex) {

        }
    }
}
