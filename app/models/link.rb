class Link < ApplicationRecord
  belongs_to :user
  has_many :visits , dependent: :destroy

  def verify_visit(pass)
    raise NotImplementedError, 'You should implement abstract_method when extend AbstractClass'
  end
end

class StandardLink < Link

  def verify_visit(pass)
    return true
  end
end

class TemporaryLink < Link
  validates :expiration_date, presence: true

  def verify_visit(pass)
    if self.expiration_date < DateTime.now
      self.active = false
    end
  end
end

class PrivateLink < Link
  has_secure_password

  def verify_visit(pass)
    self.password == pass
  end

end


class ShortLiveLink < Link
  attribute :visited, type: :integer, default: 1

  def verify_visit(pass)
    explode
    if visited == 0
      self.active = false   
    else
      visited -= 1
    end
    return self.active
  end  
end
