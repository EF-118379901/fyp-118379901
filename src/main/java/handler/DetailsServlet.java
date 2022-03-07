package handler;

import dbconnection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.Dimension;
import javax.servlet.RequestDispatcher;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.UIManager;

/**
 *
 * @author eoinf
 */
@WebServlet("/DetailsServlet")
public class DetailsServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub

  }
  /**
     * @param request
     * @param response
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  
    String weekNumber = request.getParameter("week_number");
    String foodPrice = request.getParameter("food_price");
    String wasteMeasurement = request.getParameter("waste_measurement");
    String userId = request.getParameter("id");
    String targetValue = request.getParameter("target_value2");
    String name = request.getParameter("name");
    String date = request.getParameter("date");
    String recommendation1 = request.getParameter("recommendation1");
    String recommendation2 = request.getParameter("recommendation2");
    String recommendation3 = request.getParameter("recommendation3");
    
    
    //database Connectivity code.........
    try {
       ConnectionProvider dmbgr = new ConnectionProvider();
        Connection con = dmbgr.getConnection();
          Statement stmt = con.createStatement();
          stmt.executeUpdate("insert into weekly_details (food_price,waste_measurement,id,name,week_number,date)values('"+foodPrice+"','"+wasteMeasurement+"','"+userId+"','"+name+"','"+weekNumber+"','"+date+"') ");
          stmt.executeUpdate("insert into targets (id, target_value,name,week_number)values('"+userId+"','"+targetValue+"','"+name+"','"+weekNumber+"') ");
          stmt.executeUpdate("insert into recommendations (recommendation1,recommendation2, recommendation3, id, name)values('"+recommendation1+"','"+recommendation2+"','"+recommendation3+"','"+userId+"','"+name+"') ");
     
          
          
          RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
          rd.forward(request, response);
          
//     ImageIcon icon = new ImageIcon("E −\\new.PNG");
//      JPanel panel = new JPanel();
//      panel.setSize(new Dimension(250, 100));
//      panel.setLayout(null);
//      JLabel label1 = new JLabel("This week's target is " + targetValue + " euro");
//      label1.setVerticalAlignment(SwingConstants.BOTTOM);
//      label1.setBounds(20, 20, 200, 30);
//      label1.setHorizontalAlignment(SwingConstants.CENTER);
//      panel.add(label1);
//      JLabel label2 = new JLabel("Do you wish to proceed?");
//      label2.setVerticalAlignment(SwingConstants.TOP);
//      label2.setHorizontalAlignment(SwingConstants.CENTER);
//      label2.setBounds(20, 80, 200, 20);
//      panel.add(label2);
//      UIManager.put("OptionPane.minimumSize", new Dimension(400, 200));
//      int res = JOptionPane.showConfirmDialog(null, panel, "File",
//      JOptionPane.YES_NO_CANCEL_OPTION,
//      JOptionPane.PLAIN_MESSAGE, icon);
//      if(res == 0) {
//         RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
//         rd.forward(request, response);
//      } else if (res == 1) {
//         System.exit(0);
//      } else {
//         System.out.println("Pressed CANCEL");
//      }
          
          
    }catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
      // TODO Auto-generated catch block
      
   
  }
}
