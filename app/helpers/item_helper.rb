module ItemHelper
  def opposite_state_of(item)
    item.lost? ? 'found' : 'lost'
  end
end