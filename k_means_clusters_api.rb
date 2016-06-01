#!/usr/bin/env ruby
require_relative('functions')
require 'sinatra'
require 'json'

#localhost:4567

get '/' do
	text = "<h1>*** LAKE PEND OREILLE READINGS ***</h1>"
	text << "<p>Calculates the mean and median of the wind speed, air temperature, and barometric pressure recorded at the Deep Moor station on Lake Pend Oreille for a given range of dates.</p>"
	text << "<p>Submit a request as '/readings?start=2015-01-01&end=2015-01-02'</p>"
	erb text
end

get '/readings' do

data = [  
    [1, 2],
    [2, 1],
    [2, 4], 
    [1, 3],
    [2, 2],
    [3, 1],
    [1, 1],
    [7, 3],
    [8, 2],
    [6, 4],
    [7, 4],
    [8, 1],
    [9, 2],

    [10, 8],
    [9, 10],
    [7, 8],
    [7, 9],
    [8, 11],
    [9, 9],
]

	results = calculate_k_means_clusters(data)
	content_type :json
	erb results.to_json
end