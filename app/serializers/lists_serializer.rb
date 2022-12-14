# frozen_string_literal: true

# Lists serializer
class ListsSerializer
  def initialize(lists)
    @lists = lists
  end

  def as_json
    lists.map do |list|
      {
        id: list.id.to_s,
        name: list.name,
        userId: list.user.id.to_s,
        createdAt: list.created_at
      }
    end
  end

  private

  attr_reader :lists
end
