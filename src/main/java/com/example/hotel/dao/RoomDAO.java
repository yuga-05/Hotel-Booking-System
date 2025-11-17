
package com.example.hotel.dao;
import java.time.LocalDate;

import com.example.hotel.model.Room;
import java.sql.*;
import java.util.*;
import java.math.BigDecimal;

public class RoomDAO {

	public List<Room> searchAvailable(LocalDate checkIn, LocalDate checkOut, int minCapacity) throws SQLException {
		String sql = "SELECT r.* FROM rooms r " +
			    "WHERE r.is_available=1 AND r.capacity >= ? " +
			    "AND NOT EXISTS (" +
			    "   SELECT 1 FROM bookings b " +
			    "   WHERE b.room_id=r.id AND b.status='CONFIRMED' " +
			    "   AND NOT (b.check_out <= ? OR b.check_in >= ?)" +
			    ") ORDER BY r.price_per_night ASC";


	    try (Connection con = DB.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	    	ps.setInt(1, minCapacity);
	    	ps.setDate(2, java.sql.Date.valueOf(checkIn));
	    	ps.setDate(3, java.sql.Date.valueOf(checkOut));
	        try (ResultSet rs = ps.executeQuery()) {
	            List<Room> list = new ArrayList<>();
	            while (rs.next()) {
	                list.add(map(rs));
	            }
	            return list;
	        }
	    }
	}


    public List<Room> findAll() throws SQLException {
        String sql = "SELECT * FROM rooms ORDER BY room_number";
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<Room> list = new ArrayList<>();
            while (rs.next()) list.add(map(rs));
            return list;
        }
    }

    public int create(Room r) throws SQLException {
        String sql = "INSERT INTO rooms(room_number, room_type, capacity, price_per_night, description, is_available) VALUES (?,?,?,?,?,?)";
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, r.getRoomNumber());
            ps.setString(2, r.getRoomType());
            ps.setInt(3, r.getCapacity());
            ps.setBigDecimal(4, r.getPricePerNight());
            ps.setString(5, r.getDescription());
            ps.setBoolean(6, r.isAvailable());
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
                return -1;
            }
        }
    }

    private Room map(ResultSet rs) throws SQLException {
        Room r = new Room();
        r.setId(rs.getInt("id"));
        r.setRoomNumber(rs.getString("room_number"));
        r.setRoomType(rs.getString("room_type"));
        r.setCapacity(rs.getInt("capacity"));
        r.setPricePerNight(rs.getBigDecimal("price_per_night"));
        r.setDescription(rs.getString("description"));
        r.setAvailable(rs.getBoolean("is_available"));
        return r;
    }
}
