class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  ALGORITHM_TYPE = 'HS256'

  def self.call(user_id)
    payload = { data: user_id }
    
    token = JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end
end