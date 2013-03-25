class StatusRecoding
  include Mongoid::Document
  include Mongoid::Symbolize
  include Mongoid::Timestamps
  belongs_to :problem
  symbolize :status,in: [:contacted,:visited,:token,:repaired,:paid,:finish,:cancel],default: :contacted
  field :plus, type: String

  scope :recent,order_by(:created_at => :desc)
  default_scope recent
end
