json.extract! user, :id, :name, :username, :email, :firstname, :lastname, :role, :position, :color, :provider, :uid, :created_at, :updated_at
json.url user_url(user, format: :json)