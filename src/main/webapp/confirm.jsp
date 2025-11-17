<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
  body {
    background: #f4f8fb;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  .success {
    max-width: 600px;
    margin: 60px auto;
    padding: 30px;
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    text-align: center;
    animation: fadeIn 0.8s ease-in-out;
  }
  .success h2 {
    color: #28a745;
    font-size: 2rem;
    margin-bottom: 20px;
  }
  .success p {
    font-size: 1.1rem;
    margin: 10px 0;
    color: #333;
  }
  .success strong {
    color: #007bff;
  }
  .btn {
    display: inline-block;
    margin-top: 25px;
    padding: 12px 25px;
    background: #007bff;
    color: #fff !important;
    text-decoration: none;
    font-size: 1rem;
    font-weight: bold;
    border-radius: 30px;
    transition: background 0.3s ease, transform 0.2s ease;
  }
  .btn:hover {
    background: #0056b3;
    transform: scale(1.05);
  }
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }
</style>

<div class="container success">
  <h2>✅ Booking Confirmed!</h2>
  <p>Booking ID: <strong><%= request.getAttribute("bookingId") %></strong></p>
  <p>Total Amount: <strong>₹ <%= request.getAttribute("total") %></strong></p>
  <p><a class="btn" href="<%=request.getContextPath()%>/my-bookings">View My Bookings</a></p>
</div>
