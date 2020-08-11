$(document).on('turbolinks:load', function(){
	
	$input = $('*[data-behavior="autocomplete"]')
	var options = {
    url: function(phrase) {
      return "/rating_agency/search.json?q=" + phrase;
    },
    getValue: "rating_agency_name",
  };
  $input.easyAutocomplete(options);
});