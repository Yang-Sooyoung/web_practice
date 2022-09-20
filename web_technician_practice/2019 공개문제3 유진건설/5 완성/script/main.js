$(function(){
	$("#gnb > ul > li").hover(
		function(){
			$("#gnb").addClass("active");
			$(".menu_bg").addClass("active");
		},
		function(){
			$("#gnb").removeClass("active");
			$(".menu_bg").removeClass("active");
		}
	);
	$("#gnb > ul > li:first-child > a").focusin(function(){
		$("#gnb").addClass("active");
		$(".menu_bg").addClass("active");
	});
	$("#gnb li:last-child li:last-child a").focusout(function(){
		$("#gnb").removeClass("active");
		$(".menu_bg").removeClass("active");
	});
	$("#gnb > ul > li > a").focusin(function(){
		$(this).parent().addClass("active");
	});
	$("#gnb li li:last-child a").focusout(function(){
		$(this).parent().parent().parent().removeClass("active");
	});

	var n=0;

	setInterval(function(){
		if(n < 2){
			n=n+1;
		}
		else{
			n=0;
		}
		$(".slider li").removeClass("active");
		$(".slider li").eq(n).addClass("active");
	}, 3000);

	$(".content1 .list li:first-child a").click(function(){
		$(".pop").show();
	});
	$(".pop .close").click(function(){
		$(".pop").hide();
	});
});