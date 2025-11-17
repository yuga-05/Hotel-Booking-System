
package com.example.hotel.servlet;

import com.example.hotel.dao.UserDAO;
import com.example.hotel.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        User u = new User();
        u.setName(name);
        u.setEmail(email);
        u.setPasswordHash(pass);
        u.setRole("USER");
        UserDAO dao = new UserDAO();
        try {
            if (dao.findByEmail(email) != null) {
                req.setAttribute("error", "Email already registered.");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }
            int id = dao.create(u);
            req.getSession().setAttribute("userId", id);
            resp.sendRedirect(req.getContextPath() + "/");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
