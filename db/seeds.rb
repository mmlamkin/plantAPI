
require 'nokogiri'
require 'open-uri'

 PlantWrapper.create_all


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

# baseURL = "http://www.thevegetablegarden.info/planting-schedules"
#
# calendarPage = Nokogiri::HTML(open("http://www.thevegetablegarden.info/resources/planting-schedules/zones-7-8-planting-schedule"))
#
#
# veg_name_array = []
# veg_spring_dates = []
# veg_fall_dates = []
#
# calendarPage.css('table tr td:first-child').each do |veg|
#   veg_name_array << veg.css('span').inner_text
# end
#
# calendarPage.css('table tr td:nth-child(3)').each do |veg|
#   veg_spring_dates << veg.css('span').inner_text
# end
#
# calendarPage.css('table tr td:nth-child(4)').each do |veg|
#   veg_fall_dates << veg.css('span').inner_text
# end
#
# zone_3_array = []
#
# i=0
#
# while i < veg_name_array.length
#   zone_3_array << { name: veg_name_array[i],
#   spring_dates: veg_spring_dates[i],
#   fall_dates: veg_fall_dates[i]
# }
#   i += 1
# end
#
# puts zone_3_array
