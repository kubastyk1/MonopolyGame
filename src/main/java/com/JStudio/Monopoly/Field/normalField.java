package com.JStudio.Monopoly.Field;

import com.JStudio.Monopoly.Field.Field;

public class normalField extends Field{

	private int categoryID;
	private int value;
	
	public normalField(int number, String name, int categoryId, int value){
		this.fieldNumber = number;
		this.fieldName = name;
		this.categoryID = categoryId;
		this.value = value;
	}
	
	public int getCategoryID(){
		return categoryID;
	}
	
	public int getValue(){
		return value;
	}
	
}
