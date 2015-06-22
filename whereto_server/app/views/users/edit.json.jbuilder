json.categories @categories do |c|
  json.name c.name
  json.description c.description
  json.selected c.selected(@interests)
  json.image c.image
end

json.user @user
