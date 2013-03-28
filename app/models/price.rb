class Price
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :price, type: Float
  field :plus, type: String

  validates :name, uniqueness: true,presence: true

  attr_accessible :name,:price,:plus

  scope :index,order_by(created_at: :asc)
  def human_price
    price == 0.0 ? '面议' : price
  end
end
