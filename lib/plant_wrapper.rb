
class PlantWrapper
  BASE_URL = "http://harvesthelper.herokuapp.com/api/v1/plants"
  KEY = ENV["PLANT_KEY"]



  def self.show_all
    url = BASE_URL + "?api_key=" + "d5d99c29ba04c3be01b68c4b81f3dbb3"
    response = HTTParty.get(url)

    if response == nil
      return []
    else
      plants = response.map do |result|
        self.construct_plant(result)
      end
      return plants
    end
  end

  def self.create_all
    url = BASE_URL + "?api_key=" + "d5d99c29ba04c3be01b68c4b81f3dbb3"
    response = HTTParty.get(url)

    if response == nil
      return []
    else
      plants = response.map do |result|
        self.construct_plant(result)
      end
      return plants
    end
  end


  def self.search(id)
    url = BASE_URL + "/" + id + "?api_key=" + "d5d99c29ba04c3be01b68c4b81f3dbb3"
    response =  HTTParty.get(url)

    if response["error"]
      return nil
    else
      plant = self.construct_plant(response)
      return plant
    end
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
      puts "#{@plant.name} made!"

  end
end
