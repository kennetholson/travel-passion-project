$(document).ready(function() {
	getRatings(); 	
});

function getRatings(){
	$('#find-country-form').on('submit', function(event){
		event.preventDefault();
		var formData = $('#find-country-form').serialize()
		console.log(formData)
    var country = $('#country-name').val()
    console.log(country)
    var city = $('#city-name').val()
    console.log(city)

	$.ajax({
      url: '/place',
      method: 'POST',
      data: formData

    })
    .done(function(serverData){
      console.log(serverData);
      $('#append-area').append(serverData);
    })
    .fail(function(serverData){
    	console.log("FAIL")
    })			
	})
}