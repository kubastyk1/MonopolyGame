window.onload = function() {
  
	var btn = document.querySelector('.roll-btn');
	
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

   
    for (var i = 1; i < 3; i ++) {
      var die = document.querySelector('#d' + i);
      die.className = 'die';
      die.classList.add('show-' + rolls[even]);
      document.getElementById("mouse"+ i).innerHTML = rolls[even];
      even += 1;  
    }
    
  }

  btn.addEventListener('click', rollDice, false);
};


function changeColor(position) {
	
	//var myPosition = "${player1.getPosition}";
	var x = document.getElementById("f" + position);
	x.style.backgroundColor = "red";
}
