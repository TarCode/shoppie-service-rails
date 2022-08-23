class ListsSerializer
  def initialize(lists)
    @lists = lists
  end

  def as_json
    lists.map do |list|
      {
        id: list.id,
        name: list.name,
        userId: list.userId
      }
    end
  end

  private

  attr_reader :lists
end
