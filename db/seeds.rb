JSON.parse(File.read('db/seeds/plants.json')).each do |plant|
  Plant.create!(plant)
end

require 'nokogiri'
require 'open-uri'

# allPlantsURL = "http://www.gardening.cornell.edu/homegardening/scene0391.html"
# baseURL = "http://www.gardening.cornell.edu/homegardening/"
#
# page = Nokogiri::HTML(open(allPlantsURL))
#
# plantNodes = page.css('.intromuted a')
#
# all_plants_array = []
#
#
# plantNodes.each do |veg|
#   vegPage = Nokogiri::HTML(open(baseURL + veg['href']))
#   each_plant = {}
#   each_plant[:name] = (vegPage.css('.head2 p b').inner_text ? vegPage.css('.head2 p b').inner_text : nil)
#   each_plant[:image] = (vegPage.css('img[name="plantImg"]').length > 0 ? vegPage.css('img[name="plantImg"]').attribute("src").value : nil),
#
#   vegPage.css('tbody tr td table tbody .intro p').each do |p|
#     if p.css('b').inner_text == "Ease-of-care:"
#       each_plant[:care] = p.inner_text.gsub(/[[:space:]]/, '')
#     elsif p.css('b').inner_text == "Height:"
#       each_plant[:height] = p.inner_text.gsub(/[[:space:]]/, '')
#     else p.css('b').inner_text == "Spread:"
#       each_plant[:spread] = p.inner_text.gsub(/[[:space:]]/, '')
#     end
#   end
#
#   each_plant[:maintenence] = (vegPage.css('blockquote')[1] ? vegPage.css('blockquote')[1].inner_text.strip : nil)
#
#
#   all_plants_array << each_plant
# end
#
# puts all_plants_array
