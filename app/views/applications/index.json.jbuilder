json.array!(@applications) do |application|
  json.extract! application, :id, :position_id, :user_id, :message
  json.url application_url(application, format: :json)
end
