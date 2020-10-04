$(function() {
	$('[data-toggle="tooltip"]').tooltip();
});
$(document).ready(function() {
	setTimeout(function() {
		$("#prod-ind-jq").css({"visibility": "visible", "height":"auto"});
	},4800);
	$(".loader-prepro").fadeOut(4800);

	setTimeout(function() {
		$("#prod-ind-jb").css({"visibility": "visible", "height":"auto"});
	}, 4800);
	$(".loader-prepro").fadeOut(5200);

	setTimeout(function() {
		$("#slider-indj").css({"visibility": "visible", "height":"auto"});
	},3200);
	$(".slider-prepro").fadeOut(3150);
});

// to the top
	$(document).ready(function () {
		var scrolkeatas = $(".to-top");
		$(window).scroll(function(){
			var Keatasnya =$(this).scrollTop();

			if(Keatasnya > 100){
				$(scrolkeatas).css("opacity", "1");
			}else{
				$(scrolkeatas).css("opacity", "0");
			}

		});

		$(scrolkeatas).click(function () { 
			$('html, body').animate({
				scrollTop: 0
			  }, 800);
			  return false;
			
		});
	});
// end to the top