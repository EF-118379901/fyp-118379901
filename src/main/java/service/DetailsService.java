
package service;

import dbconnection.ConnectionProvider;
import java.sql.Connection;          
import java.sql.ResultSet;           
import java.sql.SQLException;        
import java.sql.PreparedStatement;   
import java.util.ArrayList;
 
import javax.naming.Context;         
import javax.naming.InitialContext;  
import javax.sql.DataSource;     
import model.Details;

public class DetailsService {
    Connection conn = null;             
 PreparedStatement stmt = null;      
 String sql = null;
  
 public ArrayList<Details> getDetails(String start, String limit) {  
     ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
 
  ArrayList<Details> detailsList = new ArrayList<Details>();    
 
  try {       
   
 
   sql = "SELECT * FROM weekly_details where name  ='Eoin' order by week_id desc LIMIT ?,?";                       
   stmt = conn.prepareStatement(sql);
   stmt.setInt(1, Integer.parseInt(start));
   stmt.setInt(2, Integer.parseInt(limit));
   ResultSet rs = stmt.executeQuery();  
    
   while(rs.next()){ 
    Details details = new Details();
    details.setId(rs.getInt("id"));
    details.setPrice(rs.getDouble("food_price"));
    details.setWeight(rs.getDouble("waste_measurement"));
    details.setWeekId(rs.getInt("week_id"));
    detailsList.add(details);
   }                                                                          
 
   rs.close();                                                                
   stmt.close();                                                              
   stmt = null;                                                               
 
 
   conn.close();                                                              
   conn = null;                                                    
 
  }                                                                
  catch(Exception e){System.out.println(e);}                       
 
  finally {                                                        
   if (stmt != null) {                                             
    try {                                                          
     stmt.close();                                                 
    } catch (SQLException sqlex) {                                 
     // ignore -- as we can't do anything about it here            
    }                                                              
 
    stmt = null;                                             
   }                                                         
 
   if (conn != null) {                                       
    try {                                                    
     conn.close();                                           
    } catch (SQLException sqlex) {                           
     // ignore -- as we can't do anything about it here      
    }                                                        
 
    conn = null;                                             
   }                                                         
  }               
 
  return detailsList;
 
 }   
}
