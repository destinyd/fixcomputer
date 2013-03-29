class Comment
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :message, type: String

  validates :name,presence: true
  validates :email,presence: true,format: {with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  validates :message,presence: true,length: {in: 5..500}
end
