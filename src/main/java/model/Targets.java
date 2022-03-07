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
public class Targets {
    
    private int targetId;
    private int id;
    private float targetValue;
    private int weekId;
    
    public float getTargetValue(){
        return targetValue;
    }
    
    public void setTargetValue(float targetValue){
        this.targetValue= targetValue;
    }
        
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id= id;
    }
    
    public int getTargetId(){
        return targetId;
    }
    
    public void setTargetId(int targetId){
        this.targetId= targetId;
    }
    
     public int getWeekId(){
        return weekId;
    }
    
    public void setWeekId(int weekId){
        this.weekId= weekId;
    }
    }


