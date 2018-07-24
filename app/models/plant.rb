require 'nokogiri'
require 'open-uri'

class Plant < ApplicationRecord
  has_and_belongs_to_many :gardens, join_table: :gardens_plants

  validates :name, presence: true, uniqueness: true


  def update_plant
    harvest_array = self.harvest_web_scrape

    harvest_array.each do |date|
      if self.name.upcase == date[:name].upcase
        self.update(early_harvest: date[:spring_dates], late_harvest: date[:fall_dates])
      end
    end

  end

  def harvest_web_scrape
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

    return zone_3_array[2...-1]

  end


end
