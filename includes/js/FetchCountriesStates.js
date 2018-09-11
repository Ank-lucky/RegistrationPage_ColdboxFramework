/*-----------------------------------------------------------------------------*/
/*--- javascript : fetchCountriesStates.js ---*/
/*--- Author 	 :	Ankita Rath ---*/
/*--- Date     :	September 11, 2018 ---*/
/*--- Description : Js page for fetching country,state and city--*/
/*-----------------------------------------------------------------------------*/
$('document').ready(()=>{

	/*fetch country list*/
	$.getJSON("includes/json/countries.json",(data)=>{
		
		var  option = '<option id="none">Select Country</option>';
		$.each(data, function(i,value){
			option +='<option id="'+value.id+'">'+value.name+'</option>'
		})
		$('#country').html(option);
	});

	/*as per the selected country select state list*/
	$('#country').on('change',(e)=>{
		var stateOptions;
		var countryId= $('#country option:selected').attr('id');
		$.getJSON("includes/json/states.json",(data)=>{
		    stateOptions = '<option id="none">Select State</option>';
			$.each(data, function(i,value){
				if(value.country_id == countryId)
				stateOptions +='<option id="'+value.id+'">'+value.name+'</option>'
			});

			$('#state').html(stateOptions);
		});
	});

	/*as per the selected state select city list*/
	$('#state').on('change',(e)=>{
		var cityOptions;
		var stateId= $('#state option:selected').attr('id');
		$.getJSON("includes/json/cities.json",(data)=>{
		    cityOptions = '<option id="none">Select City</option>';
			$.each(data, function(i,value){
				if(value.state_id == stateId)
				cityOptions +='<option id="'+value.id+'">'+value.name+'</option>'
			});

			$('#city').html(cityOptions);
		});
	});

});


	