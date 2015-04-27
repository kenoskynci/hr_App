json.array!(@profiles) do |profile|
  json.extract! profile, :id, :firstname, :lastname, :department, :title, :email, :phone, :user_id
  json.url profile_url(profile, format: :json)
end
