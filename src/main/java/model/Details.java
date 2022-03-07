/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author eoinf
 */
public class Details {
    private int id;
    private Double price;
    private Double weight;
    private int weekId;
    
        
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}	
	public double getWeight() {
		return weight ;
	}
	public void setWeight(Double weight) {
		this.weight= weight;
	}
        
        public int getWeekId() {
		return weekId;
	}
	public void setWeekId(int weekId) {
		this.weekId = weekId;
	}
	
}
