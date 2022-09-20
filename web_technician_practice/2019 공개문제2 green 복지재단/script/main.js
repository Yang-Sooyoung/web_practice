$(function() {
    // 1) GNB 구현
    $("#gnb > ul > li").hover(
        function() {
            $("#gnb").addClass("active");
            $(".menu_bg").addClass("active");
        },
        function() {
            $("#gnb").removeClass("active");
            $(".menu_bg").removeClass("active");
        }
    );
    $("#gnb > ul > li:first-child > a").focusin(function() { // "재단소개" a
        $("#gnb").addClass("active");
        $(".menu_bg").addClass("active");
    });

    $("#gnb > ul > li:last-child > ul > li:last-child").focusout(function () { // "스토리 / 나의 후원" li
        $("#gnb").removeClass("active");
        $(".menu_bg").removeClass("active");
    });
    $("#gnb > ul > li > a").focusin(function() {
        $(this).parent().addClass("active");
    });
    $("#gnb > ul > li > ul > li:last-child").focusout(function() {
        $(this).parent().parent().removeClass("active");
    });
    // 2) Slider 구현
    var n = 0;
    var dis = 0;

    setInterval(function() {
        n = n + 1;
        dis = n * -1 * 1200;

        $(".keyvisual ul").animate({left:dis},500, function() {
            if(n == 3) { // 4번째 이미지 위치입니다.
                console.log("처음 위치로 이동합니다.");
                n = 0;
                dis = 0;
                $(".keyvisual ul").animate({left:dis}, 0);
                //$(".keyvisual ul").css({left:dis});
            }
        });
    }, 3000);
    // 3) Popup 구현
    $(".content1 li:first-child").click(function() {
        $(".pop").show();
    });
    $(".pop .close").click(function() {
        $(".pop").hide();
    })
});