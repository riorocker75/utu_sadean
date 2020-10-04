$(document).ready(function(){						
	$('.diki-tooltip').tooltip();

	$('body').on("click",".btn-addtocart",function(){			
		var id = $(this).attr('id');
		var url = $(this).attr('data-cart');
		var data = "id="+id;		
		$.ajax({
			type: 'POST',
			url: url,
			data: data,
			success: function() { 
				alert('ok');            		   	            		            
				// $('.xxx').hide();            														                    		            		            		         
			},
			beforeSend: function(){        
				alert('sebelm');    			
				// $(".ajax-save").after().hide();  
				// $("#"+option).after("<img class='xxx' src='<?php echo base_url()?>dah_image/system/123_ajax_loader.gif'></img>");						        			
			},
			complete: function(){       
			alert('slesai'); 			
				// $("#"+option).after('<span class="ajax-save">saved</span>'); 
			},
			error: function() {
				alert("Failed !");
			}
		});
	});


	

	

		// if (readCookie('pop') == null) {			
		// 	$('.modal-produk').modal();			
		// }


		// Cookies
		// function createCookie(name, value, days) {
		// 	if (days) {
		// 		var date = new Date();
		// 		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		// 		var expires = "; expires=" + date.toGMTString();
		// 	}
		// 	else var expires = "";               

		// 	document.cookie = name + "=" + value + expires + "; path=/";
		// }

		// function readCookie(name) {
		// 	var nameEQ = name + "=";
		// 	var ca = document.cookie.split(';');
		// 	for (var i = 0; i < ca.length; i++) {
		// 		var c = ca[i];
		// 		while (c.charAt(0) == ' ') c = c.substring(1, c.length);
		// 		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
		// 	}
		// 	return null;
		// }

		// function eraseCookie(name) {
		// 	createCookie(name, "", -1);
		// }
		
		// $('body').on('click','.modal-jangan-tampil',function(){						
		// 	createCookie('pop','1',1);
		// }); 

		// $('body').on('click','.btn-sitenav',function(){
		// 	$('.sitenav').css("left","0");
		// 	$('.sitenav-overlay').css("display","block");
		// });  

		// $('body').on('click','.sitenav-overlay',function(){
		// 	$('.sitenav').css("left","-300px");
		// 	$('.sitenav-overlay').css("display","none");
		// });

		// $('body').on('click','.sitenav-punya-sub',function(){
		// 	var x = '.sitenav-punya-sub > ul';
		// 	$(x).toggle();				
		// });  

		// $('body').on("click","#myImg",function(){
		// 	var gambar = $(this).attr('src');
		// 	$("#tempat_modal").attr('src',gambar);
		// 	$("#myModal").modal();

		// });
	});



