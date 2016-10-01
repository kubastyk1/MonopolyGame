package com.JStudio.Monopoly.Player;

public class Dice2 {

	private int firstNumber;
	private int secondNumber;
	private int playerNumber;
	
	public int getFirstNumber(){
		return firstNumber;
	}
	
	public int getSecondNumber(){
		return secondNumber;
	}
	
	public int getPlayerNumber(){
		return playerNumber;
	}
	
	public int addNumbers(){
		return firstNumber + secondNumber;
	}
}
