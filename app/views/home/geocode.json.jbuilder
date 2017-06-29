json.home @locations do |location|
  json.address location.address
  json.latidue location.coordinates[0]
  json.longitude location.coordinates[1]
end

