// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function delete_action(ev) {
  if ( confirm('You want to ax them for real?')) {
    $.post( ($(ev.target.form).attr('action') + '.json' ), { _method: 'delete', authenticity_token: $(ev.target.form.elements['authenticity_token']).val() }, function( data ) {
      $(ev.target).parents('li.standard').empty();
    } );
  }
  return false;
}

function ticket_preview(ev) {
  var preview_display = $( ev.target ).next('.preview');
  if ( preview_display == undefined ) $( ev.target ).append('<div class="preview"></div>')
  if ( preview_display.html() == '' ) {
    $.getJSON( $(ev.target).attr('href') + '.json', '', function( data ) {
      preview_display.html( data.ticket.messages ).addClass('active');
    } );
  } else {
    if(preview_display.is(':visible')) {
      preview_display.hide();
    } else {
      preview_display.show();
    }
  }

  return false;
}
