json.extract! api_user, :id, :name, :website, :address, :phone_number, :gender, :created_at, :updated_at
json.url api_user_url(api_user, format: :json)
