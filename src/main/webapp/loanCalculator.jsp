<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Calculator</title>
</head>
<body>

    <h1>Loan Calculator</h1>
    <p>Enter Principal Loan Amount and Period of Time (in years).</p>

    <form method="post" action="">
        <label for="principal">Principal Loan Amount:</label>
        <input type="text" id="principal" name="principal" required><br><br>

        <label for="years">Period of Time (in years):</label>
        <input type="text" id="years" name="years" required><br><br>

        <input type="submit" value="Calculate">
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {

            double principal = Double.parseDouble(request.getParameter("principal"));
            int years = Integer.parseInt(request.getParameter("years"));

            // Perform loan calculations for each scenario
            double interestRate;
            double monthlyPayment;
    %>

    <hr>
    <h2>Loan Payment Schedule</h2>
    <p>Principal Loan Amount: $<%= principal %></p>
    <p>Period of Time (in years): <%= years %></p>
    <table border="1">
        <tr>
            <th>Year</th>
            <th>Interest Rate</th>
            <th>Monthly Payment</th>
            <th>Loan Balance</th>
            <th>Total Interest Paid</th>
        </tr>

<%--        function to calclulate month payment based on loan , inter, year--%>
        <%!
            double monthlyPayment(double principal, double interestRate, int year) {
                return (principal * interestRate) / (1 - Math.pow(1 + interestRate, -12 * year));
            }
            double calculateEMI(double principal, double interestRate, int year) {
                double numerator= interestRate * Math.pow((1 + interestRate), year);
                double denominator= Math.pow((1 + interestRate), year) - 1;
                return principal * (numerator / denominator);
            }
            public static double calculateSimpleInterest(double principal, double rate, int totalYears, int currentYear) {
                // Calculate the number of years for which interest has been paid up to the current year.
                int yearsPaid = currentYear <= totalYears ? currentYear : totalYears;

                // Calculate simple interest using the formula: I = P * R * T
                double interest = (principal * rate * yearsPaid);

                return interest;
            }
//            total emi paid tell this year
            double totalEMIPaid(double principal, double interestRate, int year) {
                double totalEMIPaid = 0;
                for (int i = 1; i <= year; i++) {
                    totalEMIPaid += monthlyPayment(principal, interestRate, i) * 12;
                }
                return totalEMIPaid;
            }

        %>
        
        <%

//            total simple interest amount
            for (int year = 1; year <= years; year++) {
                if (year >= 1 && year <= 7) {
                    interestRate = 0.0535;
                } else if (year >= 8 && year <= 15) {
                    interestRate = 0.055;
                } else {
                    interestRate = 0.0575;
                }

                // Monthly Payment Calculation (Using Monthly Interest Rate)
                monthlyPayment = calculateEMI(principal, interestRate, years);
                double totalSimpleInterest = calculateSimpleInterest(principal, interestRate, years, year);
                double loanBalance = totalEMIPaid(principal, interestRate, year) - totalSimpleInterest;
        %>
        <tr>
            <td><%= year %></td>
            <td><%= (interestRate * 100) %></td>
            <td>$<%= String.format("%.2f", monthlyPayment) %></td>
            <td>$<%= String.format("%.2f", loanBalance) %></td>
            <td>$<%= String.format("%.2f", totalSimpleInterest) %></td>
        </tr>
        <%
            }
        %>
    </table>

    <%
        }
    %>

</body>
</html>
    