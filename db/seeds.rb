
require 'nokogiri'
require 'open-uri'

 PlantWrapper.create_all


baseURL = "http://www.thevegetablegarden.info/planting-schedules"

calendarPage = Nokogiri::HTML(open("http://www.thevegetablegarden.info/resources/planting-schedules/zones-7-8-planting-schedule"))


veg_name_array = []
veg_spring_dates = []
veg_fall_dates = []

calendarPage.css('table tr td:first-child').each do |veg|
  veg_name_array << veg.css('span').inner_text
end

calendarPage.css('table tr td:nth-child(3)').each do |veg|
  veg_spring_dates << veg.css('span').inner_text
end

calendarPage.css('table tr td:nth-child(4)').each do |veg|
  veg_fall_dates << veg.css('span').inner_text
end

zone_3_array = []

i=0

while i < veg_name_array.length
  zone_3_array << { name: veg_name_array[i],
  spring_dates: veg_spring_dates[i],
  fall_dates: veg_fall_dates[i]
}
  i += 1
end

zone_3_array[2...-1].each do |za|
  Zone.create(zone: 7, name: za[:name], early_harvest: za[:spring_dates], late_harvest: za[:fall_dates])
end
