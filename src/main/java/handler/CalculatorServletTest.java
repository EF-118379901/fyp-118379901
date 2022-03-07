package handler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author shubham
 */

import dao.CalculationDao;
import javax.servlet.RequestDispatcher;
import model.Plans;


//JSP CRUD application example, roseindiatutorials
public class CalculatorServletTest extends HttpServlet {    
    private static String INSERT = "/start_program.jsp";
    private static String Edit = "/home.jsp";
    private static String CalculationRecord = "/home.jsp";
    private CalculationDao dao;

    public CalculatorServletTest() {
        super();
        dao = new CalculationDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect="";
        String calc = request.getParameter("plan_id");        
        String action = request.getParameter("action");
        if(!((calc)== null) && action.equalsIgnoreCase("insert"))
        {
            //adds the calculation to the database
                int plan_id = Integer.parseInt(calc);
        	Plans calculator = new Plans();
        	calculator.setPlanId(plan_id);
                calculator.setPlanMeasurement(Float.parseFloat(request.getParameter("plan_measurement")));
                calculator.setId(Integer.parseInt(request.getParameter("id")));
                
   
                
        	dao.addCalculation(calculator);
        	redirect = CalculationRecord;
                request.setAttribute("plan", dao.getAllCalculations());    
           	
       
         } else if (action.equalsIgnoreCase("listCalculations")){
            redirect = CalculationRecord;
            request.setAttribute("plan", dao.getAllCalculations());
         } else {
            redirect = INSERT;
        }

        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
