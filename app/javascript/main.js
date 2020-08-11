$(document).ready(function() {
  $(".issuer").change(function() {
    $.ajax({
      url: '/issuer_security',
      type: "GET",
      data: {issuer_id: $(this).val()},
      success: function(response) {
         $('#security_security_type_id')
            .find('option')
            .remove()
            .end()
        $.each(response.issuer_security, function(key, value) {   
          $('#security_security_type_id')
              .append($("<option></option>")
                  .attr("value", key)
                  .text(value)); 
        });
      }
  });
  });

 $("#security_rating_agency_id").change(function() {
    $.ajax({
      url: '/rating_agency_security',
      type: "GET",
      data: {rating_agency_id: $(this).val()},
      success: function(response) {
         $('#security_rating_id')
            .find('option')
            .remove()
            .end()
        $.each(response.rating, function(key, value) {   
          $('#security_rating_id')
              .append($("<option></option>")
                  .attr("value", key)
                  .text(value)); 
        });
      }
  });
  }); 
});