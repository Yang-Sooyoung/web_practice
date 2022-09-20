$(function(){
	$("#gnb > ul > li").hover(
		function(){
			$("#gnb").addClass("active");
		},
		function(){
			$("#gnb").removeClass("active");
		}
	);
	$("#gnb > ul > li:first-child > a").focusin(function(){
		$("#gnb").addClass("active");
	});
	$("#gnb li:last-child li:last-child a").focusout(function(){
		$("#gnb").removeClass("active");
	});
	$("#gnb > ul > li > a").focusin(function(){
		$(this).parent().addClass("active");
	});
	$("#gnb li li:last-child a").focusout(function(){
		$(this).parent().parent().parent().removeClass("active");
	});

	var galleryN=0;
	var pos=0;

	galleryN=galleryN+1;
	pos=galleryN*-1*300+"px";
	$(".slider ul").animate({top:pos}, 500);

	setInterval(function(){
		galleryN=galleryN+1;
		pos=galleryN*-1*300+"px";

		$(".slider ul").animate({top:pos}, 500, function(){
			if(galleryN == 3){
				galleryN=0;
				pos=0;
				$(".slider ul").css({top:pos}); // $(".slider ul").animate({top:pos}, 0);
			}
		});
	}, 3000);

	var tabN=0;

	$(".content1 .title li a").click(function(){
		$(".content1 .title li").removeClass("active");
		$(this).parent().addClass("active");
		tabN=$(this).parent().index();
		$(".content1 div[class^=desc_]").removeClass("active");
		$(".content1 div[class^=desc_]").eq(tabN).addClass("active");
	});

	$(".desc_news li:first-child a").click(function(){
		$(".pop").show();
	});
	$(".pop .close").click(function(){
		$(".pop").hide();
	});
});