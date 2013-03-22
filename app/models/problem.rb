class Problem
  include Mongoid::Document
  include Mongoid::Symbolize
  include Mongoid::Timestamps
  field :phone, type: String
  field :name, type: String
  field :desc, type: String,default: ""
  field :lat, type: Float
  field :lng, type: Float
  field :address, type: String
  field :address_plus, type: String,default: ""
  field :uuid, type: String,default: ""

  symbolize :status,in: [:order,:contacted,:visited,:token,:repaired,:paid,:finish,:cancel],default: :order
  has_many :status_recodings

  field :plus, type: String,default: ""
  field :price, type: Float
  validates_presence_of :phone
  validates_presence_of :name
  validates_presence_of :address

  scope :recent,order_by(:created_at => :desc)
  scope :by_uuid,lambda{|uuid| where(uuid: uuid).recent}
end
