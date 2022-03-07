package handler;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.UserDao;

import model.User;

//JSP CRUD application example, roseindiatutorials
public class UserHandler extends HttpServlet {    
    private static String INSERT = "/user_signup.jsp";
    private static String Edit = "/edit.jsp";
    private static String UserRecord = "/listUser.jsp";
    private UserDao dao;
   

    public UserHandler() {
        super();
        dao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect="";
        String uId = request.getParameter("id");        
        String action = request.getParameter("action");
        if(!((uId)== null) && action.equalsIgnoreCase("insert"))
        {
            //sets the id, name, motivation and goal of the user
        	int id = Integer.parseInt(uId);
        	User user = new User();
        	user.setId(id);
                user.setName(request.getParameter("name"));
                user.setMotivation(request.getParameter("motivation"));
                user.setGoal(request.getParameter("goal"));
                user.setPassword(request.getParameter("password"));
        	dao.addUser(user);
        	redirect = UserRecord;
            request.setAttribute("user", dao.getAllUsers());    
           	
        }
        else if (action.equalsIgnoreCase("delete")){
            String userId = request.getParameter("id");
            int uid = Integer.parseInt(userId);
            dao.removeUser(uid);
            redirect = UserRecord;
            request.setAttribute("user", dao.getAllUsers());
            System.out.println("Record Deleted Successfully");
        }else if (action.equalsIgnoreCase("editform")){        	
        	redirect = Edit;            
        } else if (action.equalsIgnoreCase("edit")){
        	String userId = request.getParameter("id");
            int uid = Integer.parseInt(userId);            
            User user = new User();
        	user.setId(uid);
            user.setName(request.getParameter("name"));
            user.setMotivation(request.getParameter("motivation"));
            user.setGoal(request.getParameter("goal"));
            user.setPassword(request.getParameter("password"));
            dao.editUser(user);
            request.setAttribute("user", user);
            redirect = UserRecord;
            System.out.println("Record updated Successfully");
         } else if (action.equalsIgnoreCase("listUser")){
            redirect = UserRecord;
            request.setAttribute("user", dao.getAllUsers());
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

