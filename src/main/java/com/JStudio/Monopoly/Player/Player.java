package com.JStudio.Monopoly.Player;

import java.util.LinkedList;
import java.util.List;

import com.JStudio.Monopoly.Field.Field;

public class Player {

	private int playerNumber;
	private String username;
	private int money;
	private int position;
	private List<Field> userFields;
	
	public Player(int playerNumber, String username){
		this.playerNumber = playerNumber;
		this.username = username;
		money = 1500;
		position = 0;
		userFields = new LinkedList<Field>();
	}
	
	public int getPlayerNumber(){
		return playerNumber;
	}
	
	public String getUsername(){
		return username;
	}
	
	public int getMoney(){
		return money;
	}
	
	public int getPosition(){
		return position;
	}
	
	public void setMoney(int money){
		this.money = money;
	}
	
	public void setPosition(int position){
		this.position = position;
	}
	
	public List<Field> getUserFields(){
		return userFields;
	}
	
	public void addField(Field newField){
		userFields.add(newField);
	}
}
