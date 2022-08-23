# frozen_string_literal: true

# Item serializer
class ItemSerializer
  def initialize(item)
    @item = item
  end

  def as_json
    {
      id: item.id.to_s,
      name: item.name,
      userId: item.userId,
      list: item.list.id.to_s
    }
  end

  private

  attr_reader :item
end