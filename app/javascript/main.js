
$(document).on('turbolinks:load', function() {
  var values = [];
  var isin_array = [];
  var removeValues = [];
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

  $(document).on('click', ".port-folio-select-td" ,function (e){
    var client_id = $(".client-portfolio").val();
    portFolioSelectField();
    $.ajax({
      url: '/port_folio_filter',
      type: "GET",
      dataType: "script",
      data: {values: values, client_id: client_id},
      success: function(response){
        $.each($("input[name='port-table']:checked"), function(){
          $(this).prop("checked", false);
        });
      }
    })
  });

  function portFolioSelectField(){
    $.each($("input[name='port-table']:checked"), function(){
      values.push([$(".port-folio-row-"+this.value).find('td')[8].innerText])    
    });
  }

  $(".client-portfolio").on('change', function(){
    var client_id = $(".client-portfolio").val();
    $.ajax({
      url: '/port_folio_client_filter',
      type: "GET",
      dataType: "script",
      data: {client_id: client_id},
      success: function(){
        values = [];
        removeValues= [];
      }
    })
  });

  $(document).on('keyup paste', "#isin-selected" ,function (e){
    var client_id = $(".client-portfolio").val();
    $.ajax({
      url: '/port_folio_isin_select',
      type: "GET",
      dataType: "script",
      data: {isis: $(this).val(), ajax_call: 'selected', client_id: client_id},
      success: function(response) {
        console.log(true)
      }
    });
  });

  $("#isin-portfolio-filter").on('keyup paste', function() {
    $.ajax({
      url: '/port_folio_isin_sort',
      type: "GET",
      dataType: "script",
      data: {isis: $(this).val(), ajax_call: 'analyse'},
      success: function(response) {
        console.log(true)
      }
    });
  });

  $(document).on('click', ".port-folio-inner-select-td" ,function (e){
    var client_id = $(".client-portfolio").val();
    clientPortfolioField();
    if (removeValues != 0){
      $.ajax({
        url: '/port_folio_remove',
        type: "GET",
        dataType: "script",
        data: {security_id: removeValues, client_id: client_id},
        success: function(response){
          removeValues = [];
        }
      });
    }
  });

  function clientPortfolioField(){
    $.each($("input[name='port-folio-check']:checked"), function(){
      removeValues.push([$(".port-folio-inner-row-"+this.value).find('td')[7].innerText])    
    });
  }

});

      