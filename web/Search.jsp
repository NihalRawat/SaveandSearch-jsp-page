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
    <form class="d-flex" role="search" action="Search.jsp" method="GET">
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" id="searchMobile" name="searchCriteria" value="mobile" checked>
        <label class="form-check-label" for="searchMobile">Search by Mobile</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" id="searchPayment" name="searchCriteria" value="payment">
        <label class="form-check-label" for="searchPayment">Search by Payment Mode</label>
      </div>
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
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

    // Get search parameter and search criteria
    String searchParam = request.getParameter("search");
    String searchCriteria = request.getParameter("searchCriteria");  // New variable for chosen criteria

    if (searchParam != null && !searchParam.isEmpty()) {
      Connection con = nsr.connection.getCon();
      PreparedStatement ps = null;  // Initialize outside the if block

      // Prepare statement based on search criteria
      if (searchCriteria.equals("mobile")) {
        ps = con.prepareStatement("SELECT * FROM data WHERE mobile LIKE ?");
      } else if (searchCriteria.equals("payment")) {
        ps = con.prepareStatement("SELECT * FROM data WHERE payment LIKE ?");
      }

      if (ps != null) {  // Check if a valid search criteria is chosen
        ps.setString(1, "%" + searchParam + "%");
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
      } // End of inner if block (valid search criteria)
    } else {
      // If no search parameter is provided, display all data (same as original code)
      Connection
