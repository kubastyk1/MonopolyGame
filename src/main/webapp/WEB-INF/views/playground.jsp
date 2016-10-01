<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Monopoly Game</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/fieldstyle.css" />" type="text/css" >
<!-- 	<script src="<c:url value="/resources/JS/dice.js" />"></script>	-->
	<script src="<c:url value="/resources/JS/WebSocket.js" />"></script>
	<script>
    function changeColor(position, color) {
    	
    	var x = document.getElementById("f" + position);
    	x.style.backgroundColor = color;
    }
    
    function transparentColor(position){
    	var x = document.getElementById("f" + position);
    	x.style.backgroundColor = "transparent";
    }
    
    function chooseButtons(position){
    	//var param1 =  "<c:out value="${fieldRepo[position].getButtons()}"/>";
    	//var param1 = '${fieldRepo[1].getButtons()}';
    	
    	var btn = document.getElementById('changeBtn');
    	switch(position){
    		/*Normal Field*/
	    	case 1:	case 3:	case 6:	case 8:	case 9:
	    	case 11: case 13: case 14: case 16: case 18: case 19: 
	    	case 21: case 23: case 24: case 26: case 27: case 29:
	    	case 31: case 32: case 34: case 37: case 39:
	    	/*Middle Field*/
	    	case 5:	case 15: case 25: case 35:
	    	/*Extra Field*/
	    	case 12: case 28:
	            btn.innerHTML = "Buy Field";
	            btn.onclick = buyField;
	        	break;
	        /*Comunity Chest Field*/	
	    	case 2:	case 17: case 33:
	            btn.innerHTML = "Get 200$ Reward";
	            btn.onclick = changeMoney(200);
	        	break;
	        /*Pay Tax Field*/	
	    	case 4:	case 38:
	            btn.innerHTML = "Pay 200$ Tax";
	            btn.onclick = changeMoney(-200);
	        	break;
	        /*Chance Field*/
	    	case 7: case 22: case 36:
	    		btn.innerHTML = "You win 200$ !";
	            btn.onclick = changeMoney(200);
	        	break;
	        /*Jail*/
	    	case 10:
	    		btn.innerHTML = "Just visiting Jail";
	    		btn.onclick = doNothing;
	        	break;
	        /*Parking*/
	    	case 20:
	    		btn.innerHTML = "Parking";
	    		btn.onclick = doNothing;
	        	break;
	        /*Go to Jail*/
	    	case 30:
	           	btn.innerHTML = "Go to Jail!";
	            btn.onclick = doNothing;
	        	break;
	        /*Start*/
	    	case 0: 
	    		btn.innerHTML = "Start! Get 200$";
	            btn.onclick = doNothing;
	        	break;
    	}
    }
	</script>
</head>
<body>
	<div class="ground">
		<div id="f20" class="divCorner"> <c:out value="${fieldRepo[20]}" />
			</div><div id="f21" class="divNormal"> <c:out value="${fieldRepo[21]}" />
				<div class="divAbsolute" style="background-color: red;"></div>
			</div><div id="f22" class="divNormal"><c:out value="${fieldRepo[22]}" />
			</div><div id="f23" class="divNormal"> <c:out value="${fieldRepo[23]}" />
				<div class="divAbsolute" style="background-color: red;"></div>
			</div><div id="f24" class="divNormal"> <c:out value="${fieldRepo[24]}" />
				<div class="divAbsolute" style="background-color: red;"></div>
			</div><div id="f25" class="divNormal"><c:out value="${fieldRepo[25]}" />
			</div><div id="f26" class="divNormal"> <c:out value="${fieldRepo[26]}" />
				<div class="divAbsolute" style="background-color: yellow;"></div>
			</div><div id="f27" class="divNormal"> <c:out value="${fieldRepo[27]}" />
				<div class="divAbsolute" style="background-color: yellow;"></div>
			</div><div id="f28" class="divNormal"><c:out value="${fieldRepo[28]}" />
			</div><div id="f29" class="divNormal"> <c:out value="${fieldRepo[29]}" />
				<div class="divAbsolute" style="background-color: yellow;"></div>
			</div><div id="f30" class="divCorner"> <c:out value="${fieldRepo[30]}" /> 
			</div><div id="f19" class="divNormalLeft"> <c:out value="${fieldRepo[19]}" />
				<div class="divAbsolute" style="background-color: orange;"></div>
			</div><div id="f31" class="divNormalRight"> <c:out value="${fieldRepo[31]}" />
				<div class="divAbsolute" style="background-color: green;"></div>
			</div><div id="f18" class="divNormalLeft"> <c:out value="${fieldRepo[18]}" />
				<div class="divAbsolute" style="background-color: orange;"></div>
			</div><div id="f32" class="divNormalRight"> <c:out value="${fieldRepo[32]}" />
				<div class="divAbsolute" style="background-color: green;"></div>
			</div><div id="f17" class="divNormalLeft"><c:out value="${fieldRepo[17]}" />
			</div><div id="f33" class="divNormalRight"><c:out value="${fieldRepo[33]}" />
			</div><div id="f16" class="divNormalLeft"> <c:out value="${fieldRepo[16]}" />
				<div class="divAbsolute" style="background-color: orange;"></div>
			</div><div id="f34" class="divNormalRight"> <c:out value="${fieldRepo[34]}" />
				<div class="divAbsolute" style="background-color: green;"></div>
			</div><div id="f15" class="divNormalLeft"><c:out value="${fieldRepo[15]}" />
			</div><div id="f35" class="divNormalRight"><c:out value="${fieldRepo[35]}" />
			</div><div id="f14" class="divNormalLeft"> <c:out value="${fieldRepo[14]}" />
				<div class="divAbsolute" style="background-color: pink;"></div>
			</div><div id="f36" class="divNormalRight"><c:out value="${fieldRepo[36]}" />
			</div><div id="f13" class="divNormalLeft"> <c:out value="${fieldRepo[13]}" />
				<div class="divAbsolute" style="background-color: pink;"></div>
			</div><div id="f37" class="divNormalRight"> <c:out value="${fieldRepo[37]}" />
				<div class="divAbsolute" style="background-color: darkblue;"></div>
			</div><div id="f12" class="divNormalLeft"><c:out value="${fieldRepo[12]}" />
			</div><div id="f38" class="divNormalRight"><c:out value="${fieldRepo[38]}" />
			</div><div id="f11" class="divNormalLeft"> <c:out value="${fieldRepo[11]}" />
				<div class="divAbsolute" style="background-color: pink;"></div>
			</div><div id="f39" class="divNormalRight"> <c:out value="${fieldRepo[39]}" />
				<div class="divAbsolute" style="background-color: darkblue;"></div>
			</div><div id="f10" class="divCornerBottom"> <c:out value="${fieldRepo[10]}" /> 
			</div><div id="f9" class="divNormalBottom"> <c:out value="${fieldRepo[9]}" />
				<div class="divAbsolute" style="background-color: lightSkyBlue;"></div>
			</div><div id="f8" class="divNormalBottom"> <c:out value="${fieldRepo[8]}" />
				<div class="divAbsolute" style="background-color: lightSkyBlue;"></div>
			</div><div id="f7" class="divNormalBottom"><c:out value="${fieldRepo[7]}" />
			</div><div id="f6" class="divNormalBottom"> <c:out value="${fieldRepo[6]}" />
				<div class="divAbsolute" style="background-color: lightSkyBlue;"></div>
			</div><div id="f5" class="divNormalBottom"><c:out value="${fieldRepo[5]}" />
			</div><div id="f4" class="divNormalBottom"><c:out value="${fieldRepo[4]}" />
			</div><div id="f3" class="divNormalBottom"> <c:out value="${fieldRepo[3]}" />
				<div class="divAbsolute" style="background-color: brown;"></div>
			</div><div id="f2" class="divNormalBottom"><c:out value="${fieldRepo[2]}" />
			</div><div id="f1" class="divNormalBottom"> <c:out value="${fieldRepo[1]}" />
				<div class="divAbsolute" style="background-color: brown;"></div>
			</div><div id="f0" class="divCornerBottom"> <c:out value="${fieldRepo[0]}" />
			</div>
		</div>
<!-- <script type="text/javascript"> changeColor("${playerList.getPlayerList().get(0).getPosition()}") </script>
-->
	<div>.</div>
	<jsp:include page="dice.jsp" flush="true" />
	<jsp:include page="table.jsp" flush="true" />

	<div id="changeMe"></div>

	<div id="added">0</div>
<!-- <c:forEach items="${fieldRepo}" var="i">
		<div>
			<c:out value="${i.toString()}" /><p>
		</div>
	</c:forEach>
-->
</body>
</html>