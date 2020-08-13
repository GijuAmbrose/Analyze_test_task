$(document).ready(function() {


  var isin_array = [];
  $("#isin-filter").on('change paste keyup', function() {
     $.ajax({
        url: '/filter_by',
        type: "GET",
        dataType: "script",
        data: {isis: $(this).val(), ajax_call: true},
        success: function(response) {
          console.log(true)
        }
      });
  });

  $(".plot-table").on('click', function(){
    values = []
    $(".show-button").show();
    $(".show-date-picker").show();
    $.each($("input[name='plot-to-table']:checked"), function(){
      values.push([$(".analyse-row-"+this.value).find('td')[0].innerText, $(".analyse-row-"+this.value).find('td')[1].innerText, $(".analyse-row-"+this.value).find('td')[2].innerText, $(".analyse-row-"+this.value).find('td')[3].innerText, $(".analyse-row-"+this.value).find('td')[4].innerText, $(".analyse-row-"+this.value).find('td')[5].innerText,$(".analyse-row-"+this.value).find('td')[6].innerText] )
    });
    $.ajax({
      url: '/filter_by',
      type: "GET",
      dataType: "script",
      data: {values: values},
      success: function(response){
        console.log(true)
      }
    })
  });

  $(".plot-graph").on('click', function(){
    isinIds = []
    if ($("#from_date").val() == ""){
      alert("Please select a Date Range");
    }
    $.each($("input[name='plot-to-table']:checked"), function(){
      isinIds.push($(".analyse-row-"+this.value).find('td')[0].innerText)
    });
    $.ajax({
      url: '/filter_for_graph',
      type: "GET",
      dataType: "script",
      data: {isin_ids: isinIds, startDate: $('#from_date').val(), fromDate: $('#to_date').val()},
      success: function(response){
        console.log(true)
      }
    })
  });

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