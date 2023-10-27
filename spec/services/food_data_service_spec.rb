require 'rails_helper'

RSpec.describe FoodDataService do
  describe '.search' do
    it 'calls the FoodData API with the correct parameters', :vcr do
        FoodDataService.search('sweet potatoes')

      expect(a_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search")
        .with(query: hash_including({ query: 'sweet potatoes', pageSize: 10 })))
        .to have_been_made.once
    end
  end
end