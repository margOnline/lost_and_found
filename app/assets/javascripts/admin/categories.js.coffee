$ ->
  $(document).on 'click', '.add-category', ->
    $('.add-category-form').show().removeClass('disabled')
    $(this).hide()

  $(document).on 'click', '.category-cancel', ->
    $('.add-category-form').hide()
    $('.add-category').show()

  $(document).on 'click', '.delete-category', ->
    $(this).closest('li').hide()

  $(document).on "ajax:success", ".delete-category", ->
    $(this).closest('li').remove()