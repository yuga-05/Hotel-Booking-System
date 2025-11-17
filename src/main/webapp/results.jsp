<%@page import="com.example.hotel.model.Room"%>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Rooms</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .page-title {
            margin-top: 30px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
            color: #0d6efd;
        }
        .room-table {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .room-table th {
            background: #0d6efd;
            color: white;
            text-align: center;
        }
        .room-table td {
            text-align: center;
            vertical-align: middle;
        }
        .btn-book {
            border-radius: 20px;
        }
        .alert {
            margin-top: 40px;
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="page-title">Available Rooms</h2>

    <%
        List<Room> rooms = (List<Room>) request.getAttribute("rooms");
        String checkIn = (String) request.getAttribute("checkIn");
        String checkOut = (String) request.getAttribute("checkOut");
        if (rooms == null || rooms.isEmpty()) {
    %>
        <div class="alert alert-warning">
            <h5>No rooms available for the selected dates.</h5>
            <p>Please adjust your search and try again.</p>
        </div>
    <% } else { %>
        <form method="post" action="book">
            <input type="hidden" name="checkIn" value="<%=checkIn%>"/>
            <input type="hidden" name="checkOut" value="<%=checkOut%>"/>

            <table class="table table-hover room-table">
                <thead>
                    <tr>
                        <th>Room #</th>
                        <th>Type</th>
                        <th>Capacity</th>
                        <th>Price / Night</th>
                        <th>Select</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Room r : rooms) { %>
                        <tr>
                            <td><%= r.getRoomNumber() %></td>
                            <td><%= r.getRoomType() %></td>
                            <td><%= r.getCapacity() %> guests</td>
                            <td>₹ <%= r.getPricePerNight() %></td>
                            <td>
                                <input class="form-check-input" type="radio" name="roomId" value="<%= r.getId() %>" required>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="d-flex justify-content-center my-4">
                <button type="submit" class="btn btn-primary btn-lg btn-book">Book Selected Room</button>
            </div>
        </form>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
