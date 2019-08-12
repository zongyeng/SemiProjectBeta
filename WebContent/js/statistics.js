function statistics(){
	
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", "statistics.do");
	form.setAttribute("target", "statistics");
		
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = "command";
	input.value = 'stacked_bar';
	
	form.appendChild(input);
	
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = "musicianSeq";
	input.value = '2';
	
	form.appendChild(input);
	 
	document.body.appendChild(form);
	window.open('','statistics','width=800, height=540');

	form.submit();
	 
	document.body.removeChild(form);
}