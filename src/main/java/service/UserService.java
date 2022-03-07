package service;

import dao.UserLoginDao;
import java.util.ArrayList;
import model.User;
import dbconnection.IConstants;


public class UserService {
    
    public User loginUser(String name, String password){
        
       UserLoginDao userLoginDao = new UserLoginDao();
        User user = userLoginDao.getUserByName(name);
        if (user.getPassword().equals(password)){
            return user;
        }
        else return null;
    }
    
    public User getUser(int userId){
        UserLoginDao userLoginDao = new UserLoginDao();
        User user = userLoginDao.getUserById(userId);
        return user;
    }
    
    public ArrayList<User> getAllUsers(){
       
        UserLoginDao uDao = new UserLoginDao();
        ArrayList<User> userList = uDao.getAllUsers();
        return userList;
        
    }
    
   
    
}
