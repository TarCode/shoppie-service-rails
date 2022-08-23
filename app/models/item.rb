class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :userId, type: String
  belongs_to :list
end
