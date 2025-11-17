<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/styles.css" />

<header>
  <nav class="nav-bar">
    <!-- Left Section -->
    <div class="nav-left">
      <a class="logo" href="<%=request.getContextPath()%>/">Hotel Booking</a>
      <a href="<%=request.getContextPath()%>/my-bookings">My Bookings</a>
    </div>

    <!-- Right Section -->
    <div class="nav-right">
      <% if (session.getAttribute("userId") == null) { %>
        <a href="<%=request.getContextPath()%>/login">Login</a>
        <a href="<%=request.getContextPath()%>/register">Register</a>
      <% } else { %>
        <span class="username">Hi, <%=session.getAttribute("userName")%></span>
        <a href="<%=request.getContextPath()%>/logout">Logout</a>
      <% } %>
      <% if ("ADMIN".equals(String.valueOf(session.getAttribute("userRole")))) { %>
        <a href="<%=request.getContextPath()%>/admin/rooms">Admin</a>
      <% } %>
    </div>
  </nav>
</header>

<style>
  header {
    background: #fff;
    box-shadow: 0 2px 6px rgba(0,0,0,0.08);
    padding: 10px 0;
  }

  .nav-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: auto;
    padding: 0 20px;
  }

  .nav-left {
    display: flex;
    align-items: center;
    gap: 20px;
  }

  .logo {
    font-size: 22px;
    font-weight: bold;
    color: #007bff;
    text-decoration: none;
  }

  .nav-left a,
  .nav-right a {
    color: #333;
    font-weight: 500;
    text-decoration: none;
  }

  .nav-left a:hover,
  .nav-right a:hover {
    color: #007bff;
  }

  .nav-right {
    display: flex;
    align-items: center;
    gap: 15px;
  }

  .username {
    color: #555;
    font-weight: 600;
  }
</style>
