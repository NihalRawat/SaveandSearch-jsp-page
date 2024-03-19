<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Displaying the data</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="Style.css"/>
</head>
<body>
<div class="sectiondd">
    <h1 class="mt-3 text-center">Welcome here</h1>
    <div class="container-fluid searchbox">
        <form class="d-flex" role="search" action="Search.jsp" method="GET"> <!-- Changed method to GET -->
            <input class="form-control me-2" type="search" placeholder="Search by mobile" aria-label="Search" name="search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>

    <table class="table table-striped mt-3">
        <thead>
        <tr>
            <th scope="col">Rows</th>
            <th scope="col">Mobile</th>
            <th scope="col">Amount</th>
            <th scope="col">Date</th>
            <th scope="col">Payment mode</th>
            <th scope="col">Transaction id</th>
            <th scope="col">Status </th>
        </tr>
        </thead>

        <%
            int count = 1;

            // Check if a search parameter is provided
            String searchParam = request.getParameter("search");
            if (searchParam != null && !searchParam.isEmpty()) {
                // If search parameter is provided, execute a query to fetch data based on mobile number
                Connection con = nsr.connection.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM data WHERE mobile LIKE ?");
                ps.setString(1, "%" + searchParam + "%"); // Assuming 'mobile' is the column name in your database
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String mobile = rs.getString("mobile");
                    String amount = rs.getString("amount");
                    String date = rs.getString("idate");
                    String payment = rs.getString("payment");
                    String tid = rs.getString("tid");
        %>
        <tbody>
        <tr>
            <th scope="row"><%=count%></th>
            <td><%=mobile%></td>
            <td><%=amount%></td>
            <td><%=date%></td>
            <td><%=payment%></td>
            <td><%=tid%></td>
            <td>Succesfull </td>
        </tr>
        <% count++; %>
        </tbody>
        <% } // End of while loop
        } else {
            // If no search parameter is provided, display all data (same as your original code)
            Connection con = nsr.connection.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM data");
            while (rs.next()) {
                String mobile = rs.getString("mobile");
                String amount = rs.getString("amount");
                String date = rs.getString("idate");
                String payment = rs.getString("payment");
                String tid = rs.getString("tid");
        %>
        <tbody>
        <tr>
            <th scope="row"><%=count%></th>
            <td><%=mobile%></td>
            <td><%=amount%></td>
            <td><%=date%></td>
            <td><%=payment%></td>
            <td><%=tid%></td>
            <td>Succesfull </td>
        </tr>
        <% count++; %>
        </tbody>
        <% } // End of while loop
        } // End of else block
        %>
    </table>
    <div></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
