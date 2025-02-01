require "sinatra"
require "sinatra/reloader"

get("/") do
  
  erb(:square_form)
  
end

get("/square/results") do

  @number = params.fetch("number").to_f
  @square = @number ** 2

  erb(:square_page)

end

get("/square/new") do

  erb(:square_form)

end

get("/square_root/new") do

  erb(:root_form)

end

get("/square_root/results") do

  @number = params.fetch("number").to_f
  @root = @number ** 0.5

  erb(:root_page)

end

get("/random/new") do

  erb(:random_form)

end

get("/random/results") do

  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @rand_num = rand(@min..@max)
  
  erb(:random_page)

end

get("/payment/new") do

  erb(:payment_form)

end

get("/payment/results") do

  @apr = params.fetch("apr").to_f
  @r = @apr/100/12
  @y = params.fetch("year").to_i
  @n = @y*12
  @pv = params.fetch("principal").to_f
  @denominator = 1+@r
  @payment = @r*@pv / (1-(1/@denominator)**@n)
  
  erb(:payment_page)

end
