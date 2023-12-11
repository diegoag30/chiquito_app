class Link < ApplicationRecord
  belongs_to :user
  has_many :visits
end

class StandardLink < Link
end

class TemporaryLink < Link
  validates :expiration_date, presence: true
end

class PrivateLink < Link
  has_secure_password
end


class ShortLiveLink < Link
end
