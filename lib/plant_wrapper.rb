

class PlantWrapper
  BASE_URL = "http://harvesthelper.herokuapp.com/api/v1/plants"
  KEY = ENV["PLANT_KEY"]

  def self.create_all
    url = BASE_URL + "?api_key=" + KEY
    response = HTTParty.get(url)

    if response == nil
      return []
    else
      plants = response.map do |result|
        self.construct_plant(result)
      end

    end
    return plants
  end


  private

  def self.construct_plant(api_result)
    @plant = Plant.create(
      name: api_result["name"],
      description: api_result["description"],
      optimal_sun: api_result["optimal_sun"],
      planting_considerations: api_result["planting_considerations"],
      when_to_plant: api_result["when_to_plant"],
      growing_from_seed: api_result["growing_from_seed"],
      spacing: api_result["spacing"],
      watering: api_result["watering"],
      other_care: api_result["other_care"],
      pests: api_result["pests"],
      harvesting: api_result["harvesting"],
      image: api_result["image"])

    @plant.update_plant

      puts "#{@plant.name} created!"

    end


  end
