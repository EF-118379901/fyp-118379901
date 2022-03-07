 package handler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import javax.swing.JDialog;
import model.User;
import service.UserService;
import dbconnection.IConstants;
import dbconnection.StringUtils;

/**
 *
 * @author be_me
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        
        if (StringUtils.isStringEmpty(name) || StringUtils.isStringEmpty(password)) {

            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
             JDialog dialog = new JDialog();
             dialog.setAlwaysOnTop(true);
             JOptionPane.showMessageDialog(dialog,"Your Username or Password is Incorrect");
             
        } else {
            
            UserService uServ = new UserService();
            User user = uServ.loginUser(name, password);
            if (user == null) {
                RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
                rd.forward(request, response);
                   
                } else{
                   request.getSession().setAttribute("currentUser", name);
                   request.getSession(true).setAttribute(IConstants.SESSION_KEY_USER, user);
            
                  if (!user.getName().equals("ghghgththtfg")) {
                    RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
                    rd.forward(request, response);
                    
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                   JDialog dialog = new JDialog();
                   dialog.setAlwaysOnTop(true);
                   JOptionPane.showMessageDialog(dialog,"Your Username or Password is Incorrect");
                }
            }
        }
    }
}

   
