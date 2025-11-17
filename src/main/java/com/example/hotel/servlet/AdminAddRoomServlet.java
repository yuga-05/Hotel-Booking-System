
package com.example.hotel.servlet;

import com.example.hotel.dao.RoomDAO;
import com.example.hotel.model.Room;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

@WebServlet("/admin/rooms/add")
public class AdminAddRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        Room r = new Room();
        r.setRoomNumber(req.getParameter("roomNumber"));
        r.setRoomType(req.getParameter("roomType"));
        r.setCapacity(Integer.parseInt(req.getParameter("capacity")));
        r.setPricePerNight(new BigDecimal(req.getParameter("price")));
        r.setDescription(req.getParameter("description"));
        r.setAvailable("on".equals(req.getParameter("available")));
        try {
            new RoomDAO().create(r);
            resp.sendRedirect(req.getContextPath() + "/admin/rooms");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
