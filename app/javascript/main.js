$(document).ready(function() {
  var values = [];
  var isin_array = [];
  $("#isin-filter").on('keyup paste', function() {
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
    selectField();
    pushValues();
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

  function selectField(){
    $.each($("input[name='plot-to-table']:checked"), function(){
      values.push([$(".analyse-row-"+this.value).find('td')[0].innerText, $(".analyse-row-"+this.value).find('td')[1].innerText, $(".analyse-row-"+this.value).find('td')[2].innerText, $(".analyse-row-"+this.value).find('td')[3].innerText, $(".analyse-row-"+this.value).find('td')[4].innerText, $(".analyse-row-"+this.value).find('td')[5].innerText,$(".analyse-row-"+this.value).find('td')[6].innerText])
    });
  }

  function pushValues(){
    $.each($("input[name='plot-to-graph']"), function(){
      values.push([$(".analyse-inner-row-"+this.value).find('td')[0].innerText, $(".analyse-inner-row-"+this.value).find('td')[1].innerText, $(".analyse-inner-row-"+this.value).find('td')[2].innerText, $(".analyse-inner-row-"+this.value).find('td')[3].innerText, $(".analyse-inner-row-"+this.value).find('td')[4].innerText, $(".analyse-inner-row-"+this.value).find('td')[5].innerText,$(".analyse-inner-row-"+this.value).find('td')[6].innerText])
    });
  }

  $(".plot-graph").on('click', function(){
    isinIds = []
    if ($("#from_date").val() == ""){
      alert("Please select a Date Range");
    }
    $.each($("input[name='plot-to-graph']:checked"), function(){
      isinIds.push($(".analyse-inner-row-"+this.value).find('td')[0].innerText)
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

  $(".sector").change(function() {
    $.ajax({
      url: '/sector_client_type',
      type: "GET",
      data: {sector_id: $(this).val()},
      success: function(response) {
         $('#client_client_type_id')
            .find('option')
            .remove()
            .end()
        $.each(response.sector_client_type, function(key, value) {   
          $('#client_client_type_id')
              .append($("<option></option>")
                  .attr("value", key)
                  .text(value)); 
        });
      }
  });
  });

  $(".state").change(function() {
    $.ajax({
      url: '/state_city',
      type: "GET",
      data: {state_id: $(this).val()},
      success: function(response) {
         $('#client_town_id')
            .find('option')
            .remove()
            .end()
        $.each(response.state_city, function(key, value) {   
          $('#client_town_id')
              .append($("<option></option>")
                  .attr("value", key)
                  .text(value)); 
        });
      }
    });
  });

  $(".port-folio-select-td").on('click', function(){
    var client_id = $(".client-portfolio").val();
    portFolioSelectField();
    $("input[name='port-folio-table']:checked").closest("tr").remove();
    $.ajax({
      url: '/port_folio_filter',
      type: "GET",
      dataType: "script",
      data: {values: values, client_id: client_id},
      success: function(response){
        console.log(true)
      }
    })
  });

  function portFolioSelectField(){
    $.each($("input[name='port-folio-table']:checked"), function(){
      values.push([$(".port-folio-row-"+this.value).find('td')[0].innerText, $(".port-folio-row-"+this.value).find('td')[1].innerText, $(".port-folio-row-"+this.value).find('td')[2].innerText, $(".port-folio-row-"+this.value).find('td')[3].innerText, $(".port-folio-row-"+this.value).find('td')[4].innerText, $(".port-folio-row-"+this.value).find('td')[5].innerText,$(".port-folio-row-"+this.value).find('td')[6].innerText, $(".port-folio-row-"+this.value).find('td')[8].innerText])    
    });
  }
});

        
