		var stompClient = null;
        
        function connect() {
            var socket = new SockJS("<c:url value='/hello'/>");
            stompClient = Stomp.over(socket);   
            stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/greetings', function(greeting){
                    showNumber(JSON.parse(greeting.body).content);
                });
            });
        }
        
        function sendName() {
            var name = document.getElementById('name').value;
            stompClient.send("/app/hello", {}, JSON.stringify({ 'name': name }));
        }
        
        function showNumber(message) {
            var response = document.getElementById('added');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            response.appendChild(p);
        }