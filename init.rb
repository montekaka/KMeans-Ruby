APP_ROOT = File.dirname(__FILE__)
$:.unshift(File.join(APP_ROOT, 'lib'))
require 'kmeans'

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

k_means_clusters = Kmeans.new(data, k=3)

means = k_means_clusters.group_clusters["answers"][0]

means.each do |mean|
    p mean
end