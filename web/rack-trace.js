var RackTrace = (function() {

  var render = function(data) {
    $("body").html('<h1>Rack::Trace</h1><table border=1 cellpadding=10></table>');

    console.log(data);
    for (ind in data.trace) {
      var trace = data.trace[ind];

      var timeline = trace.time0 + " - " + trace.time1;
      timeline += " => " + ((trace.time1 - trace.time0)*1000).toFixed(2) + "ms";

      $("table").append($("<tr>")
        .append('<td>' +  trace.title + '</td>')
        .append('<td>' +  timeline + '</td>'));
    }
  }

  return {
    render: render
  };

})();
