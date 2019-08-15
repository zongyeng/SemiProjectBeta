	var num;
	var pr;
	var destination="";
	$(function(){
		pagemovemove();
		$(".musicstart").click(function(){
		var name = $(this).parent().parent().children(".musicname").html();
		var artist = $(this).parent().parent().children(".musicname").html();
		 $("#throwmusic").val(name);
		var openwin = window.open('audio4.jsp', 'search', 'top=100px, left=100px, height=80px, width=320px');
		}) 
	})
	function select1(){
		document.getElementById("popular").style.background="rgba(0,0,0,0.6)";
		document.getElementById("popular").style.color = "white";
		document.getElementById("recommand").style.background ="rgba(0,0,0,0)";
		document.getElementById("recommand").style.color = "black";
		pr=0;
		pagemovemove();

	}
	
	function select2(){
		document.getElementById("popular").style.background ="rgba(0,0,0,0)";
		document.getElementById("popular").style.color = "black";
		document.getElementById("recommand").style.background ="rgba(0,0,0,0.6)";
		document.getElementById("recommand").style.color = "white";
		pr=1;
		pagemovemove();

	}
	function ganre0(){
		num=0;
		ganre();
		pagemovemove();

	}
	function ganre1(){
		num=1;
		ganre();
		pagemovemove();

	}
	function ganre2(){
		num=2;
		ganre();
		pagemovemove();
	}
	function ganre3(){
		num=3;
		ganre();
		pagemovemove();

	}
	function ganre4(){
		num=4;
		ganre();
		pagemovemove();

	}
	function ganre5(){
		num=5;
		ganre();
		pagemovemove();

	}
	function ganre6(){
		num=6;
		ganre();
		pagemovemove();

	}
	
	
	function ganre(){
		for(var c=0;c<=6;c++){
		document.getElementById("ganre"+c).style.color="black";
		document.getElementById("ganre"+c).style.background ="rgba(0,0,0,0)";	
		}
		document.getElementById("ganre"+num).style.background = "rgba(0,0,0,0.6)";
		document.getElementById("ganre"+num).style.color = "white";
	}
	
	function pagemovemove(){

		if(pr ==0){
			switch(num){
			case 0 : destination = "allpopular"; break;
			case 1 : destination = "sunnypopular"; break;
			case 2 : destination = "cloudypopular"; break;
			case 3 : destination = "rainypopular"; break;
			case 4 : destination = "stormpopular"; break;
			case 5 : destination = "snowpopular"; break;
			case 6 : destination = "windypopular"; break;
			}		
		}
		else if(pr == 1){
			switch(num){
			case 0 : destination = "allrecommand"; break;
			case 1 : destination = "sunnyrecommand"; break;
			case 2 : destination = "cloudyrecommand"; break;
			case 3 : destination = "rainyrecommnad"; break;
			case 4 : destination = "stormrecommand"; break;
			case 5 : destination = "snowrecommand"; break;
			case 6 : destination = "windyrecommand"; break;
			}		
		}	
	}
	
	function search(){
		location.href ="musicgenre.do?command="+destination;
	}