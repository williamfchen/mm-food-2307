class FoodDataService
  def self.search(query)
    conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["X-API-Key"] = Rails.application.credentials.fda[:key]
    end

    response = conn.get("/fdc/v1/foods/search") do |req|
      req.params['query'] = query
      req.params['pageSize'] = 10
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
