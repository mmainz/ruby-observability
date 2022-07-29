map "/ingredients/tomato-sauce" do
  run ->(_env) {
        sleep rand
        [200, { "Content-type" => "text/plain" }, ["tomato-sauce"]]
      }
end

map "/ingredients/cheese" do
  run ->(_env) {
        sleep rand(1..2)
        [200, { "Content-type" => "text/plain" }, ["cheese"]]
      }
end

map "/ingredients/pepperoni" do
  run ->(_env) {
        sleep rand
        [200, { "Content-type" => "text/plain" }, ["pepperoni"]]
      }
end
