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
	var dis=0;

	setInterval(function(){
		n=n+1;
		dis=n*-1*1200;

		$(".slider ul").animate({left:dis}, 500, function(){
			if(n == 3){
				n=0;
				dis=0;
				$(".slider ul").css({left:dis}); // $(".slider ul").animate({left:dis}, 0);
			}
		});
	}, 3000);

	$(".content1 li:first-child a").click(function(){
		$(".pop").show();
	});
	$(".pop .close").click(function(){
		$(".pop").hide();
	});
});