json.extract! player, :id, :name, :role, :position, :created_at, :updated_at
json.url player_url(player, format: :json)