require 'sinatra'
require 'pry'
require 'json'
require 'sinatra/reloader'


team_file = File.read('roster.json')

team_data = JSON.parse(team_file)


# HARDCODED, NOT IDEAL
position_array = team_data["Simpson Slammers"].keys


get '/' do
  @teams = team_data.keys
  @positions = position_array
  erb :index
end

get '/:team' do
  @team = params[:team]
  @roster = team_data[@team]
  erb :team_file
end


get '/positions/:position' do
  @position = params[:position]
  @teams = team_data
  erb :position_file
end
