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
public class Plans {
    
    private float planMeasurement;
    private int id;
    private int planId;
    
    public float getPlanMeasurement(){
        return planMeasurement;
    }
    
    public void setPlanMeasurement(float planMeasurement){
        this.planMeasurement= planMeasurement;
    }
        
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id= id;
    }
    
    public int getPlanId(){
        return planId;
    }
    
    public void setPlanId(int planId){
        this.planId= planId;
    }
    }

