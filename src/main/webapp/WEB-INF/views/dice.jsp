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

  <button class="roll-btn">Roll Dice</button>
</div>

<div id="mouse1">5</div>
<div id="mouse2">2</div>

<div id="added"></div>

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
    function connect() {
        var socket = new SockJS("<c:url value='/hello'/>");
        stompClient = Stomp.over(socket);   
        stompClient.connect({}, function(frame) {
            console.log('Connected: ' + frame);
            document.getElementById('added').innerHTML = '';
            stompClient.subscribe('/topic/add', function(message){
                showNumber(JSON.parse(message.body).myNumber);
            });
        });
    }   

    function sendNumbers(dice1, dice2) {
        stompClient.send("/app/hello", {}, JSON.stringify(
        		{ 'firstNumber': dice1, 'secondNumber': dice2}));
    }

    function showNumber(message) {
    	
    	var response = document.getElementById('added');
        var p = document.createElement('p');
        var node = document.createTextNode(message);
        p.appendChild(node);
        response.appendChild(p);
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
 	   
 	    sendNumbers(rolls[0], rolls[1])
 	    for (var i = 1; i < 3; i ++) {
 	      var die = document.querySelector('#d' + i);
 	      die.className = 'die';
 	      die.classList.add('show-' + rolls[even]);
 	      document.getElementById("mouse"+ i).innerHTML = rolls[even];
 	      even += 1;  
 	    }
 	  }
 	  
     /* Other functions */
     
    function changeColor(position) {
    	
    	var x = document.getElementById("f" + position);
    	x.style.backgroundColor = "red";
    }
  
    </script>
</body>
</html>