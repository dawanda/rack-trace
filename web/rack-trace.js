var RackTrace = (function() {

  var render = function(data) {
    $("body").html('<h1>Rack::Trace</h1>');

    $("body").append('<h3>Total Request Time: ' +
      ((data.time1 - data.time0)*1000).toFixed(2) + 'ms</h3>');


    $("body").append('<p id="headers" style="font-family:monospace; margin-bottom:35px;"></p>');

    $("#headers").append('<< ' + data.http_url + '<br />');
    $("#headers").append('>> HTTP ' + data.http_status + '<br />');

    for (ind in data.http_headers) {
      $("#headers").append('>> ' + data.http_headers[ind] + '<br />');
    }

    $("body").append('<table border=1 cellpadding=10></table>');

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
