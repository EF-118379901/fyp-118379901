package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;
import dbconnection.ConnectionProvider;

public class UserDao {

    private Connection conn;

    public UserDao() {
    
    }

    public void addUser(User user) {
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
        try {
        	String sql = "INSERT INTO user(id, name,motivation,goal,password)" +
    		" VALUES (?, ?, ?,?,? )";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, user.getId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getMotivation());
            ps.setString(4, user.getGoal());
            ps.setString(5, user.getPassword());
            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void removeUser(int id) {
        try {
        	String sql = "DELETE FROM user WHERE id=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
        }
      }

    public void editUser(User user) {    	
    	try {
    		String sql = "UPDATE user SET name=?,password=?, motivation=?, goal=?, password=?" +
            " WHERE id=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getMotivation()); 
            ps.setString(3, user.getGoal());
            ps.setInt(4, user.getId());
            ps.setString(5, user.getPassword());
            ps.executeUpdate();            

        } catch (SQLException e) {
        }
    }
    
     public List getAllUsers() {
        List users = new ArrayList();
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
        try {
        	String sql = "SELECT * FROM user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setMotivation(rs.getString("motivation"));
                user.setGoal(rs.getString("goal"));
                user.setPassword(rs.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
        }

        return users;
    }
     
    

    public User getUserById(int id) {
    	User user = new User();
        try {
        	String sql = "SELECT * FROM user WHERE id=?";
            PreparedStatement ps = conn.
                    prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setMotivation(rs.getString("motivation")); 
            	user.setGoal(rs.getString("goal"));  
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
        }
        return user;
    }
    
    
    

}