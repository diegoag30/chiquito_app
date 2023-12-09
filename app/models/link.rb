class Link < ApplicationRecord
  belongs_to :user
  has_many :visits
  has_secure_password
end

class StandardLink < Link
end

class TemporaryLink < Link
  validates :expiration_date, presence: true
end

class PrivateLink < Link
  validates :password, presence: true
end


class ShortLiveLink < Link
end
