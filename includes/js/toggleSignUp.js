/*-----------------------------------------------------------------------------*/
/*--- javascript : toggleSignUp.js ---*/
/*--- Author 	 :	Ankita Rath ---*/
/*--- Date     :	September 11, 2018 ---*/
/*--- Description : Js page for togglinng the SignUp form--*/
/*-----------------------------------------------------------------------------*/
jQuery(document).ready(function($){
			$(".dropdown-button").dropdown();
			$('.modal').modal();
			$(".signup-toggle").click(function(){
				$(this).hide();
				$(".signupForm").show(300);
				$(".policy").css("visibility","visible");
				$(".login").hide();
			});

			$(".goToLoginFormLink").click(()=>{
				$(".signupForm").hide();
				$(".login").show(300);
				$(".signup-toggle").show(300);
			});
});