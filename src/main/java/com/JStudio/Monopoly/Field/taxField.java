package com.JStudio.Monopoly.Field;

public class taxField extends Field{

	private int moneyToPay;
	
	public taxField(int fieldNumber, String fieldName, int moneyToPay){
		this.fieldNumber = fieldNumber;
		this.fieldName = fieldName;
		this.moneyToPay = moneyToPay;
	}

}
