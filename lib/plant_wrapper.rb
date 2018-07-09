class PlantWrapper
  BASE_URL = "http://harvesthelper.herokuapp.com/api/v1/plants/"
  KEY = ENV["PLANT_KEY"]


  def self.search(id)
    url = BASE_URL + id + "?api_key=" + KEY
    response =  HTTParty.get(url)
    if response["total_results"] == 0
      return []
    else
      plants = response["results"].map do |result|
        self.construct_plant(result)
      end
      return plants
    end
  end

  private

  def self.construct_plant(api_result)
    Plant.new(
      name: api_result["name"],
      description: api_result["description"],
      optimal_sun: api_result["optimal_sun"],
      planting_considerations: api_result["planting_considerations"],
      when_to_plant: api_result["when_to_plant"],
      growing_from_seed: api_result["growing_from_seed"],
      spacing: api_result["spacing"],
      watering: api_result["watering"],
      other_care: api_result["other_care"],
      disease: api_result["diseases"],
      pests: api_result["pests"],
      harvesting: api_result["harvesting"],
      image: api_result["image"],

  end
end