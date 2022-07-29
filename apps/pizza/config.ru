require "net/http"

class Ingredients
  def self.make_dough
    sleep rand
    "dough"
  end

  def self.get_ingredient(ingredient)
    uri = URI("http://ingredients:9292/ingredients/#{ingredient}")
    response = Net::HTTP.get_response(uri)
    response.body
  end
end

map "/pizzas/pepperoni" do
  run ->(_env) {
        dough = Ingredients.make_dough
        ingredients = [
          Ingredients.get_ingredient("tomato-sauce"),
          Ingredients.get_ingredient("cheese"),
          Ingredients.get_ingredient("pepperoni")
        ]
        [
          200,
          { "Content-type" => "text/plain" },
          [[dough, ingredients].flatten.join(", ")]
        ]
      }
end

map "/pizzas/margherita" do
  run ->(_env) {
        dough = Ingredients.make_dough
        ingredients = [
          Ingredients.get_ingredient("tomato-sauce"),
          Ingredients.get_ingredient("cheese")
        ]
        [
          200,
          { "Content-type" => "text/plain" },
          [[dough, ingredients].flatten.join(", ")]
        ]
      }
end
