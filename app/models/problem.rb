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

  attr_accessible :phone, :name,:address,:address_plus,:desc, :lat, :lng,:status,:uuid
  attr_accessible :phone, :name,:address,:address_plus,:desc, :lat, :lng,:status,:uuid,:plus,:price, as: :admin

  validates_presence_of :phone
  validates_presence_of :name
  validates_presence_of :address

  scope :recent,order_by(:created_at => :desc)
  scope :nearly_modify,order_by(:updated_at => :desc)
  scope :by_uuid,lambda{|uuid| where(uuid: uuid).recent}
  scope :uuid_status,lambda{|uuid| where(uuid: uuid).nearly_modify}

  def as_json(options={})
    if options[:type] == :api_show
      options[:include] = [:status_recodings]
      super(options)
    else
      super(options)
    end
  end

  after_update do
    self.status_recodings.create status: self.status
  end
end
