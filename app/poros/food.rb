class Food
  attr_reader :brand_owner, :description, :gtin_upc, :ingredients

  def initialize(data)
    @brand_owner = data[:brandOwner]
    @description = data[:description]
    @gtin_upc = data[:gtinUpc]
    @ingredients = data[:ingredients]
  end
end