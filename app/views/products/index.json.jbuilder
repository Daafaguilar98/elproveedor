json.array!(@products) do |product|
  json.extract! product, :id, :codigo, :nombre, :categoria, :marca, :precio
  json.url product_url(product, format: :json)
end
