<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Result</title>
</head>
<body>

    <h1>Student Grade</h1>
    <%@ page import="java.util.*" %>

    <%
        int subject1 = Integer.parseInt(request.getParameter("JFSD"));
        int subject2 = Integer.parseInt(request.getParameter("dwm"));
        int subject3 = Integer.parseInt(request.getParameter("SDS"));
        int subject4 = Integer.parseInt(request.getParameter("uiux"	)); 
    %>

    <%
        int totalMarks = subject1 + subject2 + subject3 + subject4;
        double average = totalMarks / 5.0;
    %>

    <%
        String grade;
        if (average >= 90) {
            grade = "A+";
        } else if (average >= 80) {
            grade = "A";
        } else if (average >= 70) {
            grade = "B";
        } else if (average >= 60) {
            grade = "C";
        } else {
            grade = "D";
        }
    %>
 
    <p>Total Marks: <%= totalMarks %></p>
    <p>Average Marks: <%= String.format("%.2f", average) %></p>
    <p>Grade: <%= grade %></p>

</body>
</html>