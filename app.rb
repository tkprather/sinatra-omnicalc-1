require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_square = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_square_root = @the_num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:monthly_payment)
end

get("/payment/results") do
  @the_apr = '%.4f' % params.fetch("user_apr").to_f.round(4)
  @the_apr += "%" 

  @number_of_years = params.fetch("user_years").to_f

  @the_pv = params.fetch("user_pv").to_f.to_fs(:currency)

  number_of_periods = @number_of_years * 12

  rate_per_period = @the_apr.to_f / 12 / 100

  numerator = rate_per_period * params.fetch("user_pv").to_f

  denominator = 1 - (1 + rate_per_period) ** -number_of_periods

  @monthly_payment = numerator / denominator

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_num)
end

get("/random/results") do
  @the_min = params.fetch("user_min").to_f

  @the_max = params.fetch("user_max").to_f

  @the_random_num = rand(@the_min..@the_max).to_f

  erb(:random_result)
end
