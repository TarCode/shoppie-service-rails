# frozen_string_literal: true

# List serializer
class ListSerializer
  def initialize(list)
    @list = list
  end

  def as_json
    {
      id: list.id.to_s,
      name: list.name,
      userId: list.userId
    }
  end

  private

  attr_reader :list
end
