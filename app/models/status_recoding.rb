class StatusRecoding
  include Mongoid::Document
  include Mongoid::Symbolize
  include Mongoid::Timestamps
  symbolize :status,in: [:contacted,:visited,:token,:repaired,:paid,:finish,:cancel],default: :contacted
  field :plus, type: String
end
