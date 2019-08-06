$(function() {
	$("#submit").click(function() {
		alert("축하합니다! 회원가입 되셨습니다!");
	});

	$(".logindivdivbtn").eq(0).click(function() {
		location.href = "login.do?command=login";

	});
	$(".logindivdivbtn").eq(1).click(function() {
		location.href = "login.do?command=signup";

	});
})
