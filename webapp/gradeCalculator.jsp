<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Grade Calculator</title>
</head>
<body>
    <h1>Grade Calculator</h1>

    <form method="post" action="calculateGrade.jsp">
        <label for="JFSD">Java For Full Stack Development</label>
        <input type="number" id="JFSD" name="JFSD" required><br><br>

        <label for="dwm">Database and warehouse management</label>
        <input type="number" id="dwm" name="dwm" required><br><br>

        <label for="SDS">Statics For DataScience</label>
        <input type="number" id="SDS" name="SDS" required><br><br>

        <label for="uiux">UI / UX</label>
        <input type="number" id="uiux" name="uiux" required><br><br>
        <input type="submit" value="Calculate Grade">
    </form>
</body>
</html>
