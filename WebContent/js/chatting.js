function supportchat(){
	
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", "chatting.do?command=chattingsupport");
	form.setAttribute("target", "supportchat");
		 
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = "userinfo_controlno";
	input.value = document.getElementById("controlno").value;
	
	form.appendChild(input);
	
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = "userinfo_seq";
	input.value = document.getElementById("seq").value;
	
	form.appendChild(input);
	 
	document.body.appendChild(form);
	window.open('','supportchat','width=456, height=510');

	form.submit();
	 
	document.body.removeChild(form);
}