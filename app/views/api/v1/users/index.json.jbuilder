json.array! @users do |user|
  json.extract! user, :id, :username, :email, :bio
end
