class MeansSort
	def initialize(array)
		@array = array
	end
	def convert_to_value point
		result = 0
		i = 0
		point.each do |p|
			result = result + p*10**i
			i = i + 1
		end
		return result
	end
	def order
		result = []
		@array.each do |a|
			r = Hash.new
			r["mean"]  = a
			r["value"] = convert_to_value(a)
			result << r			 
		end
		result = result.sort_by { |hsh| hsh["value"] }
		return result
	end
end