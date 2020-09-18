let input = document.querySelector('input[type="text"]')

let checkStatus = $.ajax({
    url: "http://fiddle.jshell.net/favicon.png",
    beforeSend: function ( xhr ) {
       xhr.overrideMimeType("text/plain; charset=x-user-defined"); 
    }
  });

checkStatus.done(function(data, textStatus, jqXHR) {
    if(jqXHR.status !== 200) {
        $(this).find(input).val('');
        return;
    }
});

