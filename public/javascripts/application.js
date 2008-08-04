// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.extend(jQuery.expr[':'], {
  containsIgnoreCase: "(a.textContent||a.innerText||jQuery(a).text()||'').toLowerCase().indexOf((m[3]||'').toLowerCase())>=0"
});

function delete_action(ev) {
  if ( confirm('You want to ax them for real?')) {
    $.post( ($(ev.target.form).attr('action') + '.json' ), { _method: 'delete', authenticity_token: $(ev.target.form.elements['authenticity_token']).val() }, function( data ) {
      $(ev.target).parents('li.standard').empty();
    } );
  }
  return false;
}

function add_action(ev) {
  $("#remote_action").load( $(ev.target).attr('href'), function( data ) {
    $("#remote_action :submit").click( function( ev ) {
      $.post( ($(ev.target.form).attr('action') + '.json'), $(ev.target.form).serialize(), function( resp ) {
        for( var prop in resp ) {
          $("#remote_action").text(resp[prop]['display_name']);
        }
      }, 'json' );
      return false;
    } );
  } );
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

function search_all( search_term ) {
  if (search_term.length > 2 ) {
    $('.searchable').addClass('searching');
    $('.searchable > li').removeClass('found');
    $('.searchable > li:containsIgnoreCase("' + search_term +'")').addClass('found');
  } else {
    $('.searchable').removeClass('searching');
  }
}

function show_toggle( target, controller ) {
  if( target.is(':visible')) {
    controller.find('.hide.button').remove();
    controller.prepend('<a class="show button" title="show">show</a>');
    target.hide();
  } else {
    controller.find('.show.button').remove();
    controller.prepend('<a class="hide button" title="hide">hide</a>');
    target.show();
  }
}
