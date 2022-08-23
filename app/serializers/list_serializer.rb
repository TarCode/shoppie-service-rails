class ListSerializer
  def initialize(list)
    @list = list
  end

  def as_json
    {
      id: list.id,
      name: list.name,
      userId: list.userId
    }
  end

  private

  attr_reader :list
end