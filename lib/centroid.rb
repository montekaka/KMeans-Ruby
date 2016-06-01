class Centroid
	attr_reader :data, :k
	def initialize(data=nil, k=nil, clusters = nil)
		@data = data
		@k = k
	end

	def data= data
		@data = data
	end

	def k= k
		@k = k
	end

	def dim_range
		values = Hash.new
		dim = @data.first.length
		i = 1
		while i <= dim
			dim_name = "dim_#{i}"
			values[dim_name] = []
			i = i + 1
		end
		data.each do |d|
			i = 1		
			d.each do |x|
				dim_name = "dim_#{i}"
				values[dim_name] << x
				i = i + 1
			end		
		end
		result = Hash.new
		values.each do |key,val|
			result[key] = Range.new(val.min.to_f, val.max.to_f)
		end
		return result
	end	

	def init_means
		k_centroids = []
		i = 0
		while i < @k
			centroid = []
			dim_range.each do |key,val|
				centroid << rand(val)
			end
			k_centroids << centroid
			i = i + 1
		end
		return k_centroids
	end
end