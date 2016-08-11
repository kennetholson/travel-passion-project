$(document).ready(function() {
	getRatings();
  getRatingForm();
  postNewRating(); 
  getLoginForm();
  getRegisterForm();
  getEditRatingForm();	
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

function postNewRating(){
  $('#rating-form-append-area').on('submit', 'form', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      method: 'POST',
      data: data  
    })
    .done(function(serverData){
      $("#users-ratings-table").append(serverData);
      $('#rating-form-append-area').empty();      
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

function getEditRatingForm(){
  $(".Button").on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('action');

    $.ajax({
     url: url,
     method: 'get'     
   })
    .done(function(serverData){
     $('#edit-form-append-area').empty();      
     $('#edit-form-append-area').append(serverData);
   });  
  });
}

