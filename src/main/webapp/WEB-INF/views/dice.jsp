<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/dicestyle.css" />" type="text/css" >
<!-- 	<script src="<c:url value="/resources/JS/dice.js" />"></script>		-->
	<script src="<c:url value="/resources/JS/sockjs-0.3.4.js" />"></script>
    <script src="<c:url value="/resources/JS/stomp.js" />"></script>

</head>
<body>

	<div class="wrapper">
  <section class="die-container">
    <div class="die" id="d1">
      <div class="one">1</div>
      <div class="two">2</div>
      <div class="three">3</div>
      <div class="four">4</div>
      <div class="five">5</div>
      <div class="six">6</div>
    </div>
  </section>
  
   <section class="die-container">
    <div class="die" id="d2">
      <div class="one">1</div>
      <div class="two">2</div>
      <div class="three">3</div>
      <div class="four">4</div>
      <div class="five">5</div>
      <div class="six">6</div>
    </div>
  </section>

  <button id="btn" class="roll-btn">Roll Dice</button>
  
  	<div id="options">
		<button id="changeBtn" class="buttonStyleDisable" disabled>   ---------  </button>
		<button id="nextBtn" class="buttonStyleDisable" onclick="nextPlayer();" disabled>Next player</button>
	</div>
</div>



    <script>
    window.onload = function() {
    	
    	/* Conection */
   		var stompClient = null;
   		connect();
   		
   		/* Roll dice button */
   		var btn = document.querySelector('.roll-btn');
	    btn.addEventListener('click', rollDice, false);
    }

    /* WebSocket functions */
    var position = 0;
    var position2 = 0;
    var playerNumber = 0;
    var i = 0;
    
    function connect() {
        var socket = new SockJS("<c:url value='/hello'/>");
        stompClient = Stomp.over(socket);   
        stompClient.connect({}, function(frame) {
            console.log('Connected: ' + frame);
            document.getElementById('added').innerHTML = '';
            stompClient.subscribe('/topic/add', showNumber);
            stompClient.subscribe('/topic/buyField', showProperty);
            stompClient.subscribe('/topic/playerMoney', showNewMoney);
        });
    }   

    function showNumber(message) {
    	
    	position2 = position;
    	position = JSON.parse(message.body).position;
    	chooseButtons(position);
    	var response = document.getElementById('added');
        var node = "Position of " + JSON.parse(message.body).username 
        	+ " is: " + position + "money: " + JSON.parse(message.body).money +"$";
        changeColor(position, JSON.parse(message.body).color);
        response.innerHTML = node
    }
    
    function sendNumbers(dice1, dice2) {
    	transparentColor(position2);
        stompClient.send("/app/hello", {}, JSON.stringify(
        		{ 'firstNumber': dice1, 'secondNumber': dice2, 'playerNumber': playerNumber}));
    }
    
    function buyField(){
    	
        stompClient.send("/app/buy", {}, JSON.stringify(
        		{'position': position, 'playerNumber': playerNumber}));
 	    var changeBtn = document.getElementById("changeBtn");
	    changeBtn.disabled = true;
	    changeBtn.className = "buttonStyleDisable";
    }
    
    function changeMoney(moneyToAdd){
    	
    	stompClient.send("/app/changeMoney", {}, JSON.stringify(
        		{'moneyToAdd': moneyToAdd, 'playerNumber': playerNumber}));
    }
    
    function showNewMoney(message){
    	changeDescription(JSON.parse(message.body).playerNumber,
    			JSON.parse(message.body).username, JSON.parse(message.body).money);
    	
    }
    
    
    function doNothing(){
    	
    }
    
    function showProperty(message) {
    	changeColor(position, JSON.parse(message.body).color);
    	var textnode = document.createTextNode(JSON.parse(message.body)
    				.userFields[i].fieldName);
        var node = document.createElement("LI");
        node.appendChild(textnode);
        document.getElementById("dropdown-menu").appendChild(node);
        i++;
	    changeDescription(JSON.parse(message.body).playerNumber,
    			JSON.parse(message.body).username, JSON.parse(message.body).money);
    }
    
    function nextPlayer() {
    	playerNumber ++;
    	if(playerNumber > 1)
    		playerNumber = 0;
    	
    	var rollBtn = document.getElementById("btn"); 	    
 	    rollBtn.disabled = false;
 	    rollBtn.className = "buttonStyle";
 	    var changeBtn = document.getElementById("changeBtn");
 	    changeBtn.innerHTML = "   ---------  ;"
	    changeBtn.disabled = true;
	    changeBtn.className = "buttonStyleDisable";
	    var nextBtn = document.getElementById("nextBtn");
	    nextBtn.disabled = true;
	    nextBtn.className = "buttonStyleDisable";
	    
 	    
    }
    
	/* Dice functions */
 	  function getDiceSet() {
 	    dice = [];
 	    for (var i = 0; i < 2; i ++) {
 	      var value = Math.floor(Math.random() * (7 - 1) + 1);
 	      dice.push(value);
 	    }
 	    return dice;
 	  }

 	  function rollDice() {
 	    var rolls = getDiceSet();
 	    var even = 0;
 	   
 	    sendNumbers(rolls[0], rolls[1]);
 	    
 	    var rollBtn = document.getElementById("btn"); 	    
 	    rollBtn.disabled = true;
 	    rollBtn.className = "buttonStyleDisable";
 	    var changeBtn = document.getElementById("changeBtn");
 	    changeBtn.disabled = false;
 	    changeBtn.className = "buttonStyle";
 	    var nextBtn = document.getElementById("nextBtn");
	    nextBtn.disabled = false;
	    nextBtn.className = "buttonStyle";
 	    
 	    for (var i = 1; i < 3; i ++) {
 	      var die = document.querySelector('#d' + i);
 	      die.className = 'die';
 	      die.classList.add('show-' + rolls[even]);
 	      even += 1;  
 	    }
 	  }
 	  
     /* Other functions */
     
  
    </script>
</body>
</html>