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
		answer = []
		@array.each do |a|
			r = Hash.new
			r["mean"]  = a
			r["value"] = convert_to_value(a)
			answer << r			 
		end
		answer = answer.sort_by { |hsh| hsh["value"] }
		result = []
		answer.each do |a|
			result << a["mean"]
		end
		return result
	end
end