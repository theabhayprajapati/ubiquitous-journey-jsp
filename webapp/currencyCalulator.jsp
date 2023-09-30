<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Converter</title>
</head>
<body>

    <h1>Currency Converter</h1>
    <p>Enter the amount to be converted and an optional currency rate.</p>

    <form method="post" action="">
        <label for="amount">Amount to Convert:</label>
        <input type="text" id="amount" name="amount" required><br><br>

        <label for="rate">Currency Rate (optional):</label>
        <input type="text" id="rate" name="rate"><br><br>

        <input type="submit" value="Convert">
    </form>

    <%
        // JSP Scriptlet: Process the form data and display the results
        if (request.getMethod().equalsIgnoreCase("POST")) {
            double amount = Double.parseDouble(request.getParameter("amount"));
            String rateStr = request.getParameter("rate");

            double rate;
            if (rateStr != null && !rateStr.isEmpty()) {
                rate = Double.parseDouble(rateStr);
            } else {
                // Default currency rate if not provided
                rate = 1.0;
            }

            double convertedAmount = amount * rate;
    %>

    <hr>
    <h2>Conversion Result</h2>
    <p>Amount to Convert: <%= amount %></p>
    <p>Currency Rate: <%= rate %></p>
    <p>Converted Amount: <%= convertedAmount %></p>

    <%
        }
    %>

</body>
</html>
    