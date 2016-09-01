package com.JStudio.Monopoly.Field;

public class middleField extends Field{

	private int value;
	
	public middleField(int fieldNumber, String fieldName){
		this.fieldNumber = fieldNumber;
		this.fieldName = fieldName;
		this.value = 200;
	}

	public int getValue(){
		return value;
	}

}
