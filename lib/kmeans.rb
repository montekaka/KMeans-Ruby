require 'centroid'
require 'cluster'
require 'means_sort'

class Kmeans
	attr_reader :data,:k
	def initialize(data, k)
		@data = data
		@k = k
	end
	def group_clusters
		result = Hash.new
		result["dataset"] = @data
		result["answers"] = []

		init_means = Centroid.new(@data, @k).init_means
		init_clusters = Cluster.new(@data, init_means).collect

		r = Hash.new
		r["means"]    = MeansSort.new(init_means).order
		r["clusters"] = init_clusters
		result["answers"] << r

		new_clusters = []
		new_means = []
		means_collection = []
		clusters_collection = []
		means_collection << init_means
		clusters_collection << init_clusters
		until init_means == new_means
			n = clusters_collection.length - 1
			init_clusters = clusters_collection[n]
			init_means = 	means_collection[n]
			cluster = Cluster.new(@data, init_means)
			new_means = cluster.get_means
			new_clusters = cluster.collect
			means_collection << new_means			
			clusters_collection << new_clusters

			r = Hash.new
			r["means"]    = MeansSort.new(new_means).order
			r["clusters"] = new_clusters		
			result["answers"] << r
		end		
		return result
	end
end