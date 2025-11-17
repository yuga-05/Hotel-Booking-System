<%@page import="com.example.hotel.model.Booking"%>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
  body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }

  .container {
    max-width: 1000px;
    margin: 40px auto;
    padding: 20px;
  }

  h2 {
    text-align: center;
    color: #007bff;
    font-weight: 700;
    margin-bottom: 25px;
  }

  .card {
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    text-align: center;
    font-size: 1.1rem;
    color: #6c757d;
    box-shadow: 0 3px 8px rgba(0,0,0,0.1);
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 3px 8px rgba(0,0,0,0.1);
  }

  th {
    background-color: #007bff;
    color: #fff;
    text-align: center;
    padding: 14px;
    font-size: 1rem;
  }

  td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #e9ecef;
    font-size: 0.95rem;
  }

  tr:hover {
    background-color: #f1f5ff;
    transition: 0.2s;
  }

  .status-confirmed {
    color: #28a745;
    font-weight: 600;
  }

  .status-pending {
    color: #ffc107;
    font-weight: 600;
  }

  .status-cancelled {
    color: #dc3545;
    font-weight: 600;
  }
</style>

<div class="container">
  <h2>My Bookings</h2>
  <%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    if (bookings == null || bookings.isEmpty()) {
  %>
    <div class="card">✨ You have no bookings yet. Start booking your dream stay!</div>
  <% } else { %>
    <table>
      <tr>
        <th>ID</th>
        <th>Room ID</th>
        <th>Check-in</th>
        <th>Check-out</th>
        <th>Total</th>
        <th>Status</th>
      </tr>
      <% for (Booking b : bookings) { %>
        <tr>
          <td><%= b.getId() %></td>
          <td><%= b.getRoomId() %></td>
          <td><%= b.getCheckIn() %></td>
          <td><%= b.getCheckOut() %></td>
          <td>₹ <%= b.getTotalAmount() %></td>
          <td class="status-<%= b.getStatus().toLowerCase() %>">
            <%= b.getStatus() %>
          </td>
        </tr>
      <% } %>
    </table>
  <% } %>
</div>
