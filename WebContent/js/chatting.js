function supportchat(){
	
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", "chatting.do?command=chattingsupport");
	form.setAttribute("target", "supportchat");
		 
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = "userinfo_controlno";
	input.value = document.getElementById("TESTcontrolno").value;
	
	form.appendChild(input);
	
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = "userinfo_seq";
	input.value = document.getElementById("TESTseq").value;
	
	form.appendChild(input);
	 
	document.body.appendChild(form);
	window.open('','supportchat','width=450, height=450');

	form.submit();
	 
	document.body.removeChild(form);
}