$(document).ready(function() {
	getRatings();
  getRatingForm(); 
  getLoginForm();
  getRegisterForm();	
});

function getRatings(){
	$('#find-country-form').on('submit', function(event){
		event.preventDefault();
		var formData = $('#find-country-form').serialize();

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
     console.log("FAIL");
   });			
 });
}

function getRatingForm(){
  $('#rating-form').on('click', function(event){
    event.preventDefault();
    console.log('nothing broke yet');

    $.ajax({
      url: '/rating/new',
      method: 'GET'
    })
    .done(function(serverData){
      $("#rating-form").hide();
      $('#rating-form-append-area').append(serverData);
    }); 
  });
}

function getLoginForm(){
  $('#login-button').on('click', function(event){
    event.preventDefault();

    $.ajax({
      url: '/sessions/new',
      method: 'GET'
    })
    .done(function(serverData){
      $('#append-area').empty();
      $('#find-country-form').hide();
      $('h2').hide();
      $('#login-button').hide();
      $('#append-area').append(serverData);
    });  
  });
}

function getRegisterForm(){
  $('#register-button').on('click', function(event){
    event.preventDefault();

    $.ajax({
      url: '/users/new',
      method: 'GET'
    })
    .done(function(serverData){
      $('#append-area').empty();
      $('#find-country-form').hide();
      $('h2').hide();
      $('#register-button').hide();
      $('#append-area').append(serverData);
    });  
  });
}
