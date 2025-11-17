
package com.example.hotel.servlet;

import com.example.hotel.dao.UserDAO;
import com.example.hotel.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        try {
            User user = new UserDAO().authenticate(email, pass);
            if (user == null) {
                req.setAttribute("error", "Invalid credentials");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("userId", user.getId());
                session.setAttribute("userName", user.getName());
                session.setAttribute("userRole", user.getRole());
                resp.sendRedirect(req.getContextPath() + "/");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
