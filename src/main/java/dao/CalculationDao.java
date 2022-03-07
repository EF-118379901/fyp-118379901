
package dao;

import dbconnection.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Plans;

/**
 *
 * @author eoinf
 */
public class CalculationDao {
      

    public CalculationDao() {
    	
    }

    public void addCalculation(Plans calculation) {
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
        try {
        	String sql = "INSERT INTO plans(id, plan_measurement, plan_id)" +
    		" VALUES (?,?,? )";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, calculation.getId());
            ps.setFloat(2, calculation.getPlanMeasurement());
            ps.setInt(3, calculation.getPlanId());
            
            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public List<Plans> getAllCalculations () {
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
        List<Plans> calculations = new ArrayList<Plans>();
        try {
        	String sql = "SELECT * FROM plans";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Plans calculation = new Plans();
                calculation.setId(rs.getInt("id"));
                calculation.setPlanMeasurement(rs.getFloat("plan_measurement"));
                calculation.setPlanId(rs.getInt("plan_id"));
      
                calculations.add(calculation);
            }
        } catch (SQLException e) {
        }

        return calculations;
    }

    public Plans getCalculationByCalculation(int calculation) {
        ConnectionProvider dmbgr = new ConnectionProvider();
        Connection conn = dmbgr.getConnection();
    	Plans calculations = new Plans();
        try {
        	String sql = "SELECT * FROM plans WHERE plan_id=?";
            PreparedStatement ps = conn.
                    prepareStatement(sql);
            ps.setInt(1, calculation);
            ps.setFloat(2, calculation);
            ps.setInt(3, calculation);
            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	calculations.setId(rs.getInt("id"));
                calculations.setPlanMeasurement(rs.getFloat("plan_measurement"));
                calculations.setId(rs.getInt("plan_id"));
            }
        } catch (SQLException e) {
        }
        return calculations;
    }

}
