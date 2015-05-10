$ ->
  # show new category
  $(document).on 'click', '.add-category', ->
    $('.category-add').show().find('form').removeClass('disabled').find('.save, .cancel').show().end().hide()

  $(document).on 'click', '.category-add .cancel', ->
    $('.category-add').hide()
    $(this).closest('.controls').find('.save').removeClass('loading')