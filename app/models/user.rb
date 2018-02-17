class User < ApplicationRecord
  has_many :goals

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_by(uid: auth_hash[:uid]) || User.create(
      uid:      auth_hash[:uid],
      nickname: auth_hash[:info][:nickname],
      name:     auth_hash[:info][:name],
      token:    auth_hash[:credentials][:token]
    )
  end
end
