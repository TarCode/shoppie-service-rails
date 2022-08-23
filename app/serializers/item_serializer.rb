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
      userId: item.userId
    }
  end

  private

  attr_reader :item
end
