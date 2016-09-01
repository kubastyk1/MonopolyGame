package com.JStudio.Monopoly.Field;

import java.util.LinkedList;
import java.util.List;

public class fieldRepository {

	List<Field> gameFields;
	
	public void createRepository(){
		
		gameFields = new LinkedList<Field>();
		gameFields.add(new startField(0,"Start!"));
		gameFields.add(new normalField(1, "Brown1", 1, 60));
		gameFields.add(new taxField(2,"Community Chest", 100));
		gameFields.add(new normalField(3, "Brown2", 1, 60));
		gameFields.add(new taxField(4, "Incom Tax", 200));
		gameFields.add(new middleField(5, "Middle Field"));
		gameFields.add(new normalField(6, "LightBlue1", 2, 100));
		gameFields.add(new chanceField(7, "Chance!"));
		gameFields.add(new normalField(8, "LightBlue2", 2, 100));
		gameFields.add(new normalField(9, "LightBlue3", 2, 120));
		gameFields.add(new emptyField(10, "Jail!"));
		gameFields.add(new normalField(11, "Pink1", 3, 140));
		gameFields.add(new normalField(12, "Buy Me!", 50, 150));
		gameFields.add(new normalField(13, "Pink2", 3, 140));
		gameFields.add(new normalField(14, "Pink3", 3, 160));
		gameFields.add(new middleField(15, "Middle Field"));
		gameFields.add(new normalField(16, "Orange1", 4, 180));
		gameFields.add(new taxField(17,"Community Chest", 100));
		gameFields.add(new normalField(18, "Orange2", 4, 180));
		gameFields.add(new normalField(19, "Orange3", 4, 200));
		gameFields.add(new emptyField(20, "Parking"));
		gameFields.add(new normalField(21, "Red 1", 5, 220));
		gameFields.add(new chanceField(22, "Chance!"));
		gameFields.add(new normalField(23, "Red 2", 5, 220));
		gameFields.add(new normalField(24, "Red 3", 5, 240));
		gameFields.add(new middleField(25, "Middle Field"));
		gameFields.add(new normalField(26, "Yellow1", 6, 260));
		gameFields.add(new normalField(27, "Yellow2", 6, 260));
		gameFields.add(new normalField(28, "Buy Me!", 50, 150));
		gameFields.add(new normalField(29, "Yellow3", 6, 280));
		gameFields.add(new goToJailField(30, "Go to JAIL!"));
		gameFields.add(new normalField(31, "Green1", 7, 300));
		gameFields.add(new normalField(32, "Green2", 7, 300));
		gameFields.add(new taxField(33, "Community Chest",  100));
		gameFields.add(new normalField(34, "Green3", 7, 320));
		gameFields.add(new middleField(35,"Middle Field" ));
		gameFields.add(new chanceField(36, "Chance?"));
		gameFields.add(new normalField(37, "darkBlue1", 8, 350));
		gameFields.add(new taxField(38, "LuxuryTax", 100));
		gameFields.add(new normalField(39, "darkBlue2", 8, 400));
	}
	
	public List<Field> getRepository(){
		
		return gameFields;
	}
	
}
