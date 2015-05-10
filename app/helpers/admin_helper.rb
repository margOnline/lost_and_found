module AdminHelper
  def selected_if_current?(url)
    return 'selected active' if current_page?(url)
  end
end