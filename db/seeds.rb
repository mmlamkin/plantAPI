JSON.parse(File.read('db/seeds/plants.json')).each do |plant|
  Plant.create!(plant)
end
