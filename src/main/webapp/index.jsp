<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat Testing</title>
</head>
<body>
<center>
<h2>Chat Test</h2>
<h3>First Enter your name and then start chatting.</h3>
<form>
<input id="textMessage" type="text" placeholder="Type here....">
<input onclick="sendMessage();" value="sendMessage" type="button">
</form>
<br><textarea readonly="readonly" id="messageTextArea" rows="10" cols="50"></textarea>
<center>
<script type="text/javascript">
var wsUri = "ws://" + document.location.hostname + document.location.pathname + "serverendpointdemo";
var webSocket=new WebSocket(wsUri);
var messagesTextArea=document.getElementById("messagesTextArea");
webSocket.onopen=function(message){processOpen(message);};
webSocket.onmessage=function(message){processMessage(message);};
webSocket.onclose=function(message){processClose(message);};
webSocket.onerror=function(messsage){processError(message);};
function processOpen(message)
{
messageTextArea.value+="Server Connect.."+"\n";
}
function processMessage(message)
{
//messageTextArea.value +="Receive From Server ==>"+message.data+"\n";
var jsonData=JSON.parse(message.data);
if(jsonData.message != null) messageTextArea.value +=jsonData.message + "\n";
}
function sendMessage()
{
if(textMessage.value!="close")
	{
webSocket.send(textMessage.value);
//messageTextArea.value +="Send to Server ==>"+textMessage.value+"\n";
textMessage.value="";
}
else
	webSocket.close();
}
</script>
</body>
</html>