$ ->

  $('[data-loading-text]').on 'click', ->
    $(this).attr('disabled', 'disabled')
    $(this).text($(this).data('loading-text'))

  $('[data-radio-button]').on 'click', ->
    $(this).find('input[type=radio]').prop("checked", true)
