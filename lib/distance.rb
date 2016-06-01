class Distance
	attr_reader :p, :q
	def initialize(p,q)
		@p = p
		@q = q
	end

	def euclidean
		pq_difference = 0
		si = 0.to_f
		i = 0
		while i < @p.length
			si = si + (p[i].to_f-q[i].to_f)**2
			i = i + 1
		end
		return Math.sqrt(si)
	end
end