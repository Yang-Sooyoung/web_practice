$(function() {
    // GNB UI
    $("#gnb > ul > li").hover(
        function() {
            $("#gnb").addClass("active");
        },
        function() {
            $("#gnb").removeClass("active");
        }
    );
    $("#gnb > ul > li:first-child > a").focusin(function() {
        $("#gnb").addClass("active");
    });
    // $("#gnb li:last-child li:last-child a")
    $("#gnb > ul > li:last-child > ul > li:last-child > a").focusout(function() {
        $("#gnb").removeClass("active");
    });
    $("#gnb > ul > li > a").focusin(function() {
        $(this).parent().addClass("active");
    });
    $("#gnb li li:last-child a").focusout(function() {
        $(this).parent().parent().parent().removeClass("active");
    });
    
    // Slider UI
    var galleryN = 0;
    var pos = 0;

    galleryN = galleryN + 1;
    pos = galleryN * -1 * 300;
    $(".keyvisual ul").animate({top:pos}, 500);

    setInterval(function() {
        galleryN = galleryN + 1;
        pos = galleryN * -1 * 300 + "px";

        $(".keyvisual ul").animate({top:pos}, 500, function () {
            if (galleryN == 3) {
                galleryN = 0;
                pos = 0;
                $(".keyvisual ul").animate({top:pos}, 0);
            }
        });
    }, 3000)

    // Tab UI + Popup UI 
    var tabN = 0;

    $(".content1 .title li").click(function(e) { // <a href="#">
        e.preventDefault();
        $(".content1 .title li").removeClass("active");
        $(this).addClass("active");
        tabN = $(this).index(); // 0, 1
        $(".content1 div[class^=desc_]").removeClass("active");
        $(".content1 div[class^=desc_]").eq(tabN).addClass("active");
    });

    $(".desc_news li:first-child").click(function(e) {
        e.preventDefault();
        $(".pop").show();
    });
    $(".pop .close").click(function(e){
        e.preventDefault();
        $(".pop").hide();
    })
});