
package com.example.hotel.servlet;

import com.example.hotel.dao.BookingDAO;
import com.example.hotel.dao.RoomDAO;
import com.example.hotel.model.Booking;
import com.example.hotel.model.Room;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet("/book")
public class BookRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int userId = (int) session.getAttribute("userId");
        int roomId = Integer.parseInt(req.getParameter("roomId"));
        LocalDate checkIn = LocalDate.parse(req.getParameter("checkIn"));
        LocalDate checkOut = LocalDate.parse(req.getParameter("checkOut"));

        try {
            // Fetch room to compute price
            Room room = null;
            for (Room r : new RoomDAO().findAll()) {
                if (r.getId() == roomId) { room = r; break; }
            }
            if (room == null) {
                resp.sendRedirect(req.getContextPath() + "/");
                return;
            }
            long nights = ChronoUnit.DAYS.between(checkIn, checkOut);
            if (nights <= 0) {
                req.setAttribute("error", "Invalid dates");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                return;
            }
            BigDecimal total = room.getPricePerNight().multiply(new BigDecimal(nights));
            Booking b = new Booking();
            b.setUserId(userId);
            b.setRoomId(roomId);
            b.setCheckIn(checkIn);
            b.setCheckOut(checkOut);
            b.setTotalAmount(total);
            b.setStatus("CONFIRMED");
            int id = new BookingDAO().create(b);
            req.setAttribute("bookingId", id);
            req.setAttribute("total", total);
            req.getRequestDispatcher("/confirm.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
