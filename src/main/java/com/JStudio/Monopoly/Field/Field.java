package com.JStudio.Monopoly.Field;

public class Field {

	public int fieldNumber;
	public String fieldName;
	public String buttons;
	
	public String getFieldName(){
		return fieldName;
	}
	public int getFieldNumber(){
		return fieldNumber;
	}
	
	public String getButtons(){
		return buttons;
	}
	
	public String toString(){
		return "Nr. " + fieldNumber + "  ---  "+ fieldName; 
	}
}
