# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

jQuery -> 
  # Creating Comments
  $(document)
    .on "ajax:beforeSend", ".comment-form", (evt, xhr, settings) ->
      $(this).find('textarea')
        .addClass('uneditable-input')
        .attr('disabled', 'disabled');
    .on "ajax:success", ".comment-form", (evt, data, status, xhr) ->
      $(this).find('textarea')
        .removeClass('uneditable-input')
        .removeAttr('disabled', 'disabled')
        .val('');
      $(xhr.responseText).hide().appendTo($(this).data('append')).show('slow') 
    .on "ajax:error", ".comment-form",  (evt, data, status, xhr) ->
      $(this).replaceWith(xhr.responseText)
  # Deleting Comments
  $(document)
    .on "ajax:beforeSend", ".comment a.close", ->
      $(this).closest('.comment').fadeTo('fast', 0.5)
    .on "ajax:success", ".comment a.close", ->
      $(this).closest('.comment').hide('fast')
    .on "ajax:error", ".comment a.close", ->
      $(this).closest('.comment').fadeTo('fast', 1)
  # Replying to Comments
  $(document)
    .on "ajax:success", ".comment-reply", (evt, data, status, xhr) ->
      $(this).closest('.reply').replaceWith(xhr.responseText)

