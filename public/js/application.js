$(document).ready(function() {
	getRatings();
  getRatingForm(); 	
});

function getRatings(){
	$('#find-country-form').on('submit', function(event){
		event.preventDefault();
		var formData = $('#find-country-form').serialize()
	
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

function getRatingForm(){
  $('#rating-form').on('click', function(event){
    event.preventDefault();
    console.log('nothing broke yet')

  $.ajax({
    url: '/rating/new',
    method: 'GET'
  })
  .done(function(serverData){
      $("#rating-form").hide()
      $('#rating-form-append-area').append(serverData);
    }) 
  });
}
