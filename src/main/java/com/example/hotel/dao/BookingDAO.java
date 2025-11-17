
package com.example.hotel.dao;

import com.example.hotel.model.Booking;
import java.sql.*;
import java.util.*;
import java.math.BigDecimal;

public class BookingDAO {

    public int create(Booking b) throws SQLException {
        String sql = "INSERT INTO bookings(user_id, room_id, check_in, check_out, total_amount, status) VALUES (?,?,?,?,?,?)";
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, b.getUserId());
            ps.setInt(2, b.getRoomId());
            ps.setDate(3, java.sql.Date.valueOf(b.getCheckIn()));
            ps.setDate(4, java.sql.Date.valueOf(b.getCheckOut()));
            ps.setBigDecimal(5, b.getTotalAmount());
            ps.setString(6, b.getStatus());
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
                return -1;
            }
        }
    }

    public List<Booking> findByUser(int userId) throws SQLException {
        String sql = "SELECT * FROM bookings WHERE user_id=? ORDER BY created_at DESC";
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                List<Booking> list = new ArrayList<>();
                while (rs.next()) list.add(map(rs));
                return list;
            }
        }
    }

    private Booking map(ResultSet rs) throws SQLException {
        Booking b = new Booking();
        b.setId(rs.getInt("id"));
        b.setUserId(rs.getInt("user_id"));
        b.setRoomId(rs.getInt("room_id"));
        b.setCheckIn(rs.getDate("check_in").toLocalDate());
        b.setCheckOut(rs.getDate("check_out").toLocalDate());
        b.setTotalAmount(rs.getBigDecimal("total_amount"));
        b.setStatus(rs.getString("status"));
        return b;
    }
}
