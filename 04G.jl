# Cluster analysis
using Statistics
function cluster_analysis(reflectance)
    cluster_init = []
    # Initialize cluster_output
    for ind in eachindex(reflectance)
        if isodd(ind)
            append!(cluster_init, 1)
        else
            append!(cluster_init, 2)
        end
    end
    prev_cluster = []
    curr_cluster = []
    # Iterate until the clusters repeat
    while true
        # Update clusters with new means
        c1_mean = mean(reflectance[cluster_init.==1])
        c2_mean = mean(reflectance[cluster_init.==2])
        cluster_init[abs.(reflectance .- c1_mean) .<= abs.(reflectance .- c2_mean)] .= 1
        cluster_init[abs.(reflectance .- c1_mean) .> abs.(reflectance .- c2_mean)] .= 2
        # Assign curr_cluster to cluster_init
        curr_cluster = cluster_init
        # Check if the clusters are same as before
        if prev_cluster == curr_cluster
            return prev_cluster
        end
        # Update previous and cluster_init to calculated current cluster
        prev_cluster = curr_cluster
        cluster_init = curr_cluster
    end
end


using Test
@test cluster_analysis([1.7, 1.6, 1.3, 1.3, 2.8, 1.4, 2.8, 2.6, 1.6, 2.7]) == [2, 2, 2, 2, 1, 2, 1, 1, 2, 1]
