package model;

public class User {

    private int id;
    private String name;
    private String motivation;
    private String goal;
    private String password;
    
     public User(int id, String name, String password, String motivation, String goal) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.motivation = motivation;
        this.goal = goal;
        
    }
    
    public User() {
        
    }
        
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMotivation() {
		return motivation;
	}
	public void setMotivation(String motivation) {
		this.motivation = motivation;
	}	
	public String getGoal() {
		return goal ;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	
        public String getPassword() {
            return password;
        }
        
        public void setPassword(String password){
            this.password = password;
        }
		
	}	
