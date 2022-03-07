
package dao;

import model.User;
import dbconnection.IConstants;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import service.UserService;
import dbconnection.ConnectionProvider;


public class UserLoginDao {
    

    
    public User getUserByName(String name) {

        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection con = dmbgr.getConnection();
        int userId = 0;
        String password = null;
        String motivation = null;
        String goal = null;
      
        User tempUser = new User();

        String query = "SELECT * FROM user WHERE name=" + "'" + name + "'";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                userId = (rs.getInt(1));
                motivation = (rs.getString(3));
                goal = (rs.getString(4));
                password = (rs.getString(5));
           
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        tempUser.setName(name);
        tempUser.setId(userId);
        tempUser.setMotivation(motivation);
        tempUser.setGoal(goal);
        tempUser.setPassword(password);
  
        return tempUser;

    }
    
    public User getUserById(int id) {

        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection con = dmbgr.getConnection();
        String password = null;
        String name = null;
        String motivation = null;
        String goal = null;
        User tempUser = new User();

        String query = String.format("SELECT * FROM user WHERE id=%d",id);
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                name = (rs.getString(2));
                motivation = (rs.getString(3));
                goal = (rs.getString(4));
                password = (rs.getString(5));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        tempUser.setId(id);
        tempUser.setName(name);
        tempUser.setMotivation(motivation);
        tempUser.setGoal(goal);
        tempUser.setPassword(password);
        return tempUser;

    }

    public ArrayList<User> getAllUsers() {

        ConnectionProvider dm = new ConnectionProvider();
        Connection con = dm.getConnection();
        int id = 0;
        String password = null;
        String name = null;
        String motivation = null;
        String goal = null;
        ArrayList<User> userData = new ArrayList();

        String query = "SELECT * FROM user";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                id = (rs.getInt(1));
                name = (rs.getString(2));             
                motivation = (rs.getString(3));
                goal = (rs.getString(4));
                password = (rs.getString(5));
                User tempUser = new User();
                tempUser.setName(name);
                tempUser.setId(id);
                tempUser.setMotivation(motivation);
                tempUser.setGoal(goal);
                tempUser.setPassword(password);
          
                userData.add(tempUser);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

      
        return userData;

    }
    
  

   

}
