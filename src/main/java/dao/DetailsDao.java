package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Details;
import dbconnection.ConnectionProvider;

public class DetailsDao {

   


    public DetailsDao() {
    	
    }

    public void addDetails(Details details) {
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
        try {
        	String sql = "INSERT INTO weekly_details(week_id,food_price,waste_measurement,id)" +
    		" VALUES (?, ?, ?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, details.getWeekId());
            ps.setDouble(2, details.getPrice());
            ps.setDouble(3, details.getWeight());
            ps.setInt(4, details.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    
        	    
    public List<Details> getAllDetails() {
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
        List<Details> detail = new ArrayList<Details>();
        try {
        	String sql = "SELECT * FROM weekly_details";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Details details = new Details();
                details.setWeekId(rs.getInt("week_id"));
                details.setPrice(rs.getDouble("food_price"));
                details.setWeight(rs.getDouble("waste_measurement"));
                details.setId(rs.getInt("id"));
                detail.add(details);
            }
        } catch (SQLException e) {
        }

        return detail;
    }

    public Details getUserById(int id) {
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
    	Details details = new Details();
        try {
        	String sql = "SELECT * FROM weekly_details WHERE week_id=?";
            PreparedStatement ps = conn.
                    prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                details.setWeekId(rs.getInt("week_id"));
            	details.setPrice(rs.getDouble("price"));
            	details.setWeight(rs.getDouble("weight")); 
                details.setId(rs.getInt("id"));
            	
            }
        } catch (SQLException e) {
        }
        return details;
    }


}