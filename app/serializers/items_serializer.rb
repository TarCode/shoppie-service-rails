# frozen_string_literal: true

# Items serializer
class ItemsSerializer
  def initialize(items)
    @items = items
  end

  def as_json
    items.map do |item|
      {
        id: item.id.to_s,
        name: item.name,
        userId: item.userId,
        list: item.list.id.to_s
      }
    end
  end

  private

  attr_reader :items
end
