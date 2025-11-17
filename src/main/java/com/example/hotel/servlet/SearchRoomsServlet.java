
package com.example.hotel.servlet;

import java.time.LocalDate;
import com.example.hotel.dao.RoomDAO;
import com.example.hotel.model.Room;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/search")
public class SearchRoomsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            LocalDate checkIn = LocalDate.parse(req.getParameter("checkIn"));
            LocalDate checkOut = LocalDate.parse(req.getParameter("checkOut"));
            int guests = Integer.parseInt(req.getParameter("guests"));
            List<Room> rooms = new RoomDAO().searchAvailable(checkIn, checkOut, guests);
            req.setAttribute("rooms", rooms);
            req.setAttribute("checkIn", checkIn.toString());
            req.setAttribute("checkOut", checkOut.toString());
            req.getRequestDispatcher("/results.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
