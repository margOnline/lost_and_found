$ ->
  $(document).on 'click', '.add-category', ->
    $('.add-category-form').show().removeClass('disabled')
    $(this).hide()

  $(document).on 'click', '.category-cancel', ->
    $('.add-category-form').hide()
    $('input#category_name').val("")
    $('.add-category').show()

  $(document).on "ajax:success", ".delete-category", ->
    $(this).closest('h4').remove()

  $(document).on "click", ".save-category", (data)->
    $('.add-category-form').hide()
    $('.add-category').show()
