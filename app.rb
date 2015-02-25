require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
also_reload './lib/**/*.rb'
require './lib/doctor.rb'
require './lib/patient.rb'


DB = PG.connect({:dbname => "doctor_office"})

get '/' do
 @doctors = Doctor.all
 erb :index
end

post("/doctors") do
  name = params["name"]
  specialty = params["specialty"]
  doctor = Doctor.new({:name => name, :id => nil, :specialty => specialty})
  doctor.save
  @doctors = Doctor.all
  erb(:index)
end

get '/doctors/:id' do
  @doctor = Doctor.find(params["id"].to_i)
  erb :doctor
end

post '/patients' do
  name = params["name"]
  birthday = params["birthday"]
  doctor_id = params["doctor_id"].to_i
  patient = Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id})
  patient.save
  @doctor = Doctor.find(doctor_id)
  erb :doctor
end
