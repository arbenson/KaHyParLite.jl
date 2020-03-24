using SparseArrays

#kahypar_context_new() =
#    ccall((:kahypar_context_new, libkahypar), Ptr{kahypar_context_t}, ())

# See https://github.com/SebastianSchlag/kahypar/blob/master/kahypar/application/command_line_options.h for descriptions
mutable struct context_parameters
    # general
    cmaxnet::Int
    vcycles::UInt32
    use_sparsifier::Bool
    # main -> preprocessing -> min hash sparsifier
    p_sparsifier_min_median_he_size::Int
    p_sparsifier_max_hyperedge_size::Int
    p_sparsifier_max_cluster_size::Int
    p_sparsifier_min_cluster_size::Int
    p_sparsifier_num_hash_func::Int
    p_sparsifier_combined_num_hash_func::Int
    # main -> preprocessing -> community detection
    p_detect_communities::Bool
    p_reuse_communities::Bool
    p_max_louvain_pass_iterations::UInt32
    p_min_eps_improvement::Float64
    p_louvain_edge_weight::Symbol
    # main -> preprocessing -> community detection
    c_type::Symbol
    c_s::Float64
    c_t::Int
    # main -> coarsening -> rating
    c_rating_score::Symbol
    c_rating_use_communities::Bool
    c_rating_heavy_node_penalty::Symbol
    c_rating_acceptance_criterion::Symbol
    c_fixed_vertex_acceptance_criterion::Symbol
    # main -> initial partitioning
    i_mode::Symbol
    i_technique::Symbol
    i_c_type::Symbol
    i_c_s::Float64
    i_c_t::Int
    # initial partitioning -> coarsening -> rating
    i_c_rating_score::Symbol
    i_c_rating_use_communities::Bool
    i_c_rating_heavy_node_penalty::Symbol
    i_c_rating_acceptance_criterion::Symbol
    i_c_fixed_vertex_acceptance_criterion::Symbol
    # initial partitioning -> initial partitioning
    i_algo::Symbol
    i_runs::UInt32
    # initial partitioning -> local search
    i_r_type::Symbol
    i_r_runs::Int
    i_r_fm_stop::Symbol
    i_r_fm_stop_i::UInt32
    # main -> local search
    r_type::Symbol
    r_runs::Int
    r_fm_stop::Symbol
    r_fm_stop_alpha::Float64
    r_fm_stop_i::UInt32
    # local_search -> flow
    r_flow_algorithm::Symbol
    r_flow_alpha::Float64
    r_flow_beta::UInt
    r_flow_network::Symbol
    r_flow_execution_policy::Symbol
    r_flow_use_most_balanced_minimum_cut::Bool
    r_flow_use_adaptive_alpha_stopping_rule::Bool
    r_flow_ignore_small_hyperedge_cut::Bool
    r_flow_use_improvement_history::Bool
end

# defaults from https://github.com/SebastianSchlag/kahypar/blob/master/config/cut_kahypar_mf_jea19.ini
context_parameters() =
    context_parameters(1000,                    # cmaxnet
                       0,                       # vcycles
                       true,                    # use_sparsifier
                       28,                      # p_sparsifier_min_median_he_size
                       1200,                    # p_sparsifier_max_hyperedge_size
                       10,                      # p_sparsifier_max_cluster_size
                       2,                       # p_sparsifier_min_cluster_size
                       5,                       # p_sparsifier_num_hash_func
                       100,                     # p_sparsifier_combined_num_hash_func
                       true,                    # p_detect_communities
                       false,                   # p_reuse_communities
                       100,                     # p_max_louvain_pass_iterations
                       0.001,                   # p_min_eps_improvement
                       :hybrid,                 # p_louvain_edge_weight
                       :ml_style,               # c_type
                       1.0,                     # c_s
                       160,                     # c_t
                       :heavy_edge,             # c_rating_score
                       true,                    # c_rating_use_communities 
                       :no_penalty,             # c_rating_heavy_node_penalty
                       :best_prefer_unmatched,  # c_rating_acceptance_criterion
                       :fixed_vertex_allowed,   # c_fixed_vertex_acceptance_criterion
                       :recursive,              # i_mode
                       :multi,                  # i_technique
                       :ml_style,               # i_c_type
                       1.0,                     # i_c_s
                       150,                     # i_c_t
                       :heavy_edge,             # i_c_rating_score
                       true,                    # i_c_rating_use_communities
                       :no_penalty,             # i_c_rating_heavy_node_penalty
                       :best_prefer_unmatched,  # i_c_rating_acceptance_criterion
                       :fixed_vertex_allowed,   # i_c_fixed_vertex_acceptance_criterion
                       :pool,                   # i_algo
                       20,                      # i_runs
                       :twoway_fm,              # i_r_type
                       -1,                      # i_r_runs
                       :simple,                 # i_r_fm_stop
                       50,                      # i_r_fm_stop_i
                       :kway_fm_flow,           # r_type
                       -1,                      # r_runs
                       :adaptive_opt,           # r_fm_stop
                       1.0,                     # r_fm_stop_alpha
                       350,                     # r_fm_stop_i
                       :ibfs,                   # r_flow_algorithm
                       16.0,                    # r_flow_alpha
                       128,                     # r_flow_beta
                       :hybrid,                 # r_flow_network
                       :exponential,            # r_flow_execution_policy
                       true,                    # r_flow_use_most_balanced_minimum_cut
                       true,                    # r_flow_use_adaptive_alpha_stopping_rule
                       true,                    # r_flow_ignore_small_hyperedge_cut
                       true                     # r_flow_use_improvement_history
                       )
                       
"""
- `imbalance::Float64` - target imbalance tolerance in the partition
- `objective::Symbol` - one of :cut or :km1 for edge cut or k - 1 objectives
- `seed::Int64` - random seed (default: -1)
"""
# Initialization from https://github.com/SebastianSchlag/kahypar/blob/master/config/cut_kahypar_mf_jea19.ini
function kahypar_partition(A::SparseMatrixCSC{Int64,Int64},
                           k::Int64;
                           imbalance::Float64=0.03,
                           objective::Symbol=:cut,
                           seed::Int64=-1,
                           vertex_weights::Vector{Int64}=Vector{Int64}(),
                           hyperedge_weights::Vector{Int32}=Vector{Int64}(),
                           additional_parameters::context_parameters=context_paramaters()
                           )

    # Create the context
    context = kahypar_context_new()
    # TODO(arbenson): expose recursive bisectioning functionality
    mode=:direct,
    kahypar_set_context_partition_mode(context, string(mode))
    kahypar_set_context_partition_objective(context, string(objective))
    kahypar_set_context_partition_seed(context, seed)

    
    # Create the Hypergraph representation
    
                           
    #num_vertices, num_hyperedges, imbalance, num_blocks,
    #                       vertex_weights, hyperedge_weights, hyperedge_indices,
    #                       hyperedges,objective, context, partition)

end
