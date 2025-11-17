
<%@ page import="java.util.List" %>
<%@ page import="com.example.hotel.model.Room" %>
<%@ include file="../header.jsp" %>
<div class="container">
  <h2>Admin • Rooms</h2>
  <h3>Add Room</h3>
  <form method="post" action="<%=request.getContextPath()%>/admin/rooms/add">
    <label>Room Number</label><input name="roomNumber" required />
    <label>Type</label><input name="roomType" required />
    <label>Capacity</label><input type="number" min="1" name="capacity" required />
    <label>Price per night</label><input type="number" step="0.01" min="0" name="price" required />
    <label>Description</label><textarea name="description"></textarea>
    <label><input type="checkbox" name="available" checked /> Available</label>
    <button type="submit">Add</button>
  </form>
  <hr/>
  <h3>All Rooms</h3>
  <%
    List<Room> rooms = (List<Room>)request.getAttribute("rooms");
    if (rooms == null || rooms.isEmpty()) {
  %>
    <div class="card">No rooms yet.</div>
  <% } else { %>
    <table>
      <tr><th>#</th><th>Type</th><th>Capacity</th><th>Price</th><th>Available</th></tr>
      <% for (Room r : rooms) { %>
        <tr>
          <td><%= r.getRoomNumber() %></td>
          <td><%= r.getRoomType() %></td>
          <td><%= r.getCapacity() %></td>
          <td><%= r.getPricePerNight() %></td>
          <td><%= r.isAvailable() ? "Yes" : "No" %></td>
        </tr>
      <% } %>
    </table>
  <% } %>
</div>
