class Link < ApplicationRecord
  has_secure_password
end

class StandardLink < Link
end

class TemporaryLink < Link
end

class PrivateLink < Link
end


class ShortLiveLink < Link
end
