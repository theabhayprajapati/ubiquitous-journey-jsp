<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change My Study Center</title>
</head>
<body>

    <h1>Change of Study Center Application</h1>

    <form method="post" action="">
        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" required><br><br>

        <label for="studentID">Student ID:</label>
        <input type="text" id="studentID" name="studentID" required><br><br>

        <label for="currentStudyCenter">Current Study Center:</label>
        <input type="text" id="currentStudyCenter" name="currentStudyCenter" required><br><br>

        <label for="newStudyCenter">New Study Center:</label>
        <input type="text" id="newStudyCenter" name="newStudyCenter" required><br><br>

        <label for="reasonForChange">Reason for Change:</label><br>
        <textarea id="reasonForChange" name="reasonForChange" rows="4" cols="50" required></textarea><br><br>

        <input type="submit" value="Submit Application">
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String studentName = request.getParameter("studentName");
            String studentID = request.getParameter("studentID");
            String currentStudyCenter = request.getParameter("currentStudyCenter");
            String newStudyCenter = request.getParameter("newStudyCenter");
            String reasonForChange = request.getParameter("reasonForChange");
 
    %>

    <hr>
    <h2>Application Submitted</h2>

    <p>Thank you, <%= studentName %>! Your application for a change of study center has been submitted.</p>
    <p>Your Student ID: <%= studentID %></p>
    <p>Current Study Center: <%= currentStudyCenter %></p>
    <p>New Study Center Requested: <%= newStudyCenter %></p>
    <p>Reason for Change: <%= reasonForChange %></p>

    <%
        }
    %>

</body>
</html>