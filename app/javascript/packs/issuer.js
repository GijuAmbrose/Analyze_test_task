$(document).on('turbolinks:load', function(){
	
	$input = $('*[data-behavior="autocomplete"]')
	var options = {
    url: function(phrase) {
      return "/issuers/search.json?q=" + phrase;
    },
    getValue: "name",
  };
  $input.easyAutocomplete(options);
});