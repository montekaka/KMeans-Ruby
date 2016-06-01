require 'distance'
require 'centroid'
require 'means_sort'

class Cluster
	attr_reader :data,:init_centroids
	def initialize(data=nil, init_centroids=nil)
		@data = data
		@init_centroids = MeansSort.new(init_centroids).order
	end

	def group
		cluster = []
		@data.each do |p|
			p_vs_c = []
			@init_centroids.each do |c|
				d = Distance.new(p,c["mean"]).euclidean
				p_vs_c << d
			end
			cluster << p_vs_c.index(p_vs_c.min)
		end
		return cluster
	end

	def collect
		clusters = []
		i = 0
		self.group.each do |p|
			if clusters[p].nil?
				clusters[p] = []
				clusters[p] << @data[i]
			else
				clusters[p] << @data[i]
			end
			i = i + 1
		end
		return clusters
	end

	def get_means
		result = []		
		collection = self.collect
		collection.each do |cluster|
			mean = []
			if cluster.nil?
				# if we somehow missing mean, then generate one for it
				# so that we will always have k-means
				mean = Centroid.new(@data, 1).init_means[0]
			else
				n = cluster.length				
				cluster.each do |p|
					i = 0
					p.each do |p_axis|
						if mean[i].nil?
							mean[i] = p_axis.to_f
						else
							mean[i] = mean[i] + p_axis.to_f
						end
						i = i + 1
					end
				end	
				mean.map! { |a| a/n.to_f }
			end
			result << mean
		end
		if result.length < @init_centroids.length
			result << Centroid.new(@data, 1).init_means[0]
		end
		return result
	end
end