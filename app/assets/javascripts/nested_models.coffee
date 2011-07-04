$( -> 
  $( 'form a.add_child' ).click( -> 
    association = $( this ).attr( 'data-association' )
    template    = $( "##{association}_fields_template" ).html()
    regexp      = new Regexp( "new_#{association}", 'g' )
    new_id      = new Date().getTime()

    $( this ).parent().before( template.replace(regexp, new_id ) )
    return false
  )

  $( 'form a.remove_child' ).live( 'click', ->
    hidden_field = $( this ).prev( 'input[type=hidden]' )[0]
    hidden_field.value = '1' if hidden_field

    $( this ).parents( '.fields' ).hide()
    return false
  )
)