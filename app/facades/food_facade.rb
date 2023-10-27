class FoodFacade
  def self.search(query)
    data = FoodDataService.search(query)
    total = data[:totalHits]
    foods = data[:foods].map do |food_data|
      Food.new(food_data)
    end
    { total: total, foods: foods }
  end
end
