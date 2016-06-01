APP_ROOT = File.dirname(__FILE__)
$:.unshift(File.join(APP_ROOT, 'lib'))
require 'kmeans'

def calculate_k_means_clusters data
	kmeansclusters = Kmeans.new(data, k=3)
	result = kmeansclusters.group_clusters
	return result 
end