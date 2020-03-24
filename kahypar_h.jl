using SparseArrays

mutable struct kahypar_context_t end

kahypar_context_new() =
    ccall((:kahypar_context_new, libkahypar), Ptr{kahypar_context_t}, ())

# PartitioningParameters
kahypar_set_context_partition_mode(context_ref::Ref{kahypar_context_t}, mode::String) =
    ccall((:kahypar_set_context_partition_mode, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, mode)

kahypar_set_context_partition_objective(context_ref::Ref{kahypar_context_t}, s::String) =
    ccall((:kahypar_set_context_partition_objective, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, s)

kahypar_set_context_partition_seed(context_ref::Ref{kahypar_context_t}, seed::Int) =
    ccall((:kahypar_set_context_partition_seed, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cint), context_ref, seed)

kahypar_set_context_partition_global_search_iterations(context_ref::Ref{kahypar_context_t}, global_search_iterations::UInt32) =
    ccall((:kahypar_set_context_partition_global_search_iterations, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, global_search_iterations)

kahypar_set_context_partition_hyperedge_size_threshold(context_ref::Ref{kahypar_context_t}, hyperedge_size_threshold::UInt32) =
    ccall((:kahypar_set_context_partition_hyperedge_size_threshold, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, hyperedge_size_threshold)

kahypar_set_context_preprocessing_enable_min_hash_sparsifier(context_ref::Ref{kahypar_context_t}, enable_min_hash_sparsifier::Bool) =
    ccall((:kahypar_set_context_preprocessing_enable_min_hash_sparsifier, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, enable_min_hash_sparsifier)    

kahypar_set_context_preprocessing_enable_community_detection(context_ref::Ref{kahypar_context_t}, enable_community_detection::Bool) =
    ccall((:kahypar_set_context_preprocessing_enable_community_detection, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, enable_community_detection)

kahypar_set_context_preprocessing_min_hash_sparsifier_max_hyperedge_size(context_ref::Ref{kahypar_context_t}, max_hyperedge_size::UInt32) =
    ccall((:kahypar_set_context_preprocessing_min_hash_sparsifier_max_hyperedge_size, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, max_hyperedge_size)

kahypar_set_context_preprocessing_min_hash_sparsifier_max_cluster_size(context_ref::Ref{kahypar_context_t}, max_cluster_size::UInt32) =
    ccall((:kahypar_set_context_preprocessing_min_hash_sparsifier_max_cluster_size, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, max_cluster_size)

kahypar_set_context_preprocessing_min_hash_sparsifier_min_cluster_size(context_ref::Ref{kahypar_context_t}, min_cluster_size::UInt32) =
    ccall((:kahypar_set_context_preprocessing_min_hash_sparsifier_min_cluster_size, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, min_cluster_size)

kahypar_set_context_preprocessing_min_hash_sparsifier_num_hash_functions(context_ref::Ref{kahypar_context_t}, num_hash_functions::UInt32) =
    ccall((:kahypar_set_context_preprocessing_min_hash_sparsifier_num_hash_functions, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, num_hash_functions)

kahypar_set_context_preprocessing_min_hash_sparsifier_combined_num_hash_functions(context_ref::Ref{kahypar_context_t}, combined_num_hash_functions::UInt32) =
    ccall((:kahypar_set_context_preprocessing_min_hash_sparsifier_combined_num_hash_functions, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, combined_num_hash_functions)

kahypar_set_context_preprocessing_min_hash_sparsifier_min_median_he_size(context_ref::Ref{kahypar_context_t}, min_median_he_size::UInt32) =
    ccall((:kahypar_set_context_preprocessing_min_hash_sparsifier_min_median_he_size, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, min_median_he_size)

kahypar_set_context_preprocessing_community_detection_reuse_communities(context_ref::Ref{kahypar_context_t}, reuse_communities::Bool) =
    ccall((:kahypar_set_context_preprocessing_community_detection_reuse_communities, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, reuse_communities)

kahypar_set_context_preprocessing_community_detection_edge_weight(context_ref::Ref{kahypar_context_t}, edge_weight::String) =
    ccall((:kahypar_set_context_preprocessing_community_detection_edge_weight, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, edge_weight)

kahypar_set_context_preprocessing_community_detection_max_pass_iterations(context_ref::Ref{kahypar_context_t}, max_pass_iterations::UInt32)  =
    ccall((:kahypar_set_context_preprocessing_community_detection_max_pass_iterations, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, max_pass_iterations)

kahypar_set_context_preprocessing_community_detection_min_eps_improvement(context_ref::Ref{kahypar_context_t}, min_eps_improvement::Float64) =
    ccall((:kahypar_set_context_preprocessing_community_detection_min_eps_improvement, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cdouble), context_ref, min_eps_improvement)

# Context.CoarseningParameters
kahypar_set_context_coarsening_algorithm(context_ref::Ref{kahypar_context_t}, ctype::String) =
    ccall((:kahypar_set_context_coarsening_algorithm, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ctype)

kahypar_set_context_coarsening_contraction_limit_multiplier(context_ref::Ref{kahypar_context_t}, contraction_limit_multiplier::UInt32) =
    ccall((:kahypar_set_context_coarsening_contraction_limit_multiplier, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, contraction_limit_multiplier)

kahypar_set_context_coarsening_max_allowed_weight_multiplier(context_ref::Ref{kahypar_context_t}, max_allowed_weight_multiplier::Float64) =
    ccall((:kahypar_set_context_coarsening_max_allowed_weight_multiplier, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cdouble), context_ref, max_allowed_weight_multiplier)

kahypar_set_context_coarsening_RP_rating_function(context_ref::Ref{kahypar_context_t}, rating_score::String) =
    ccall((:kahypar_set_context_coarsening_RP_rating_function, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, rating_score)

kahypar_set_context_coarsening_RP_community_policy(context_ref::Ref{kahypar_context_t}, use_communities::Bool) =
    ccall((:kahypar_set_context_coarsening_RP_community_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, use_communities)

kahypar_set_context_coarsening_RP_heavy_node_policy(context_ref::Ref{kahypar_context_t}, penalty::String) =
    ccall((:kahypar_set_context_coarsening_RP_heavy_node_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, penalty)

kahypar_set_context_coarsening_RP_acceptance_policy(context_ref::Ref{kahypar_context_t},  crit::String) =
    ccall((:kahypar_set_context_coarsening_RP_acceptance_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, crit)

kahypar_set_context_coarsening_RP_fixed_vertex_acceptance_policy(context_ref::Ref{kahypar_context_t}, crit::String) =
    ccall((:kahypar_set_context_coarsening_RP_fixed_vertex_acceptance_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, crt)

# Context.LocalSearchParameters
kahypar_set_context_local_search_algorithm(context_ref::Ref{kahypar_context_t}, rtype::String) =
    ccall((:kahypar_set_context_local_search_algorithm, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, rtype)

kahypar_set_context_local_search_iterations_per_level(context_ref::Ref{kahypar_context_t}, iterations_per_level::Int) =
    ccall((:kahypar_set_context_local_search_iterations_per_level, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cint), context_ref, iterations_per_level)

kahypar_set_context_local_search_fm_max_number_of_fruitless_moves(context_ref::Ref{kahypar_context_t}, max_number_of_fruitless_moves::UInt32) =
    ccall((:kahypar_set_context_local_search_fm_max_number_of_fruitless_moves, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, max_number_of_fruitless_moves)

kahypar_set_context_local_search_fm_adaptive_stopping_alpha(context_ref::Ref{kahypar_context_t}, adaptive_stopping_alpha::Float64) =
    ccall((:kahypar_set_context_local_search_fm_adaptive_stopping_alpha, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cdouble), context_ref, adaptive_stopping_alpha)

kahypar_set_context_local_search_fm_stopping_rule(context_ref::Ref{kahypar_context_t}, stopfm::String) =
    ccall((:kahypar_set_context_local_search_fm_stopping_rule, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, stopfm)

kahypar_set_context_local_search_flow_algorithm(context_ref::Ref{kahypar_context_t}, ftype::String) =
    ccall((:kahypar_set_context_local_search_flow_algorithm, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ftype)

kahypar_set_context_local_search_flow_network(context_ref::Ref{kahypar_context_t}, ftype::String) =
    ccall((:kahypar_set_context_local_search_flow_network, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ftype)

kahypar_set_context_local_search_execution_policy(context_ref::Ref{kahypar_context_t}, ftype::String) =
    ccall((:kahypar_set_context_local_search_execution_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ftype)

kahypar_set_context_local_search_flow_alpha(context_ref::Ref{kahypar_context_t}, alpha::Float64) =
    ccall((:kahypar_set_context_local_search_flow_alpha, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cdouble), context_ref, alpha)

kahypar_set_context_local_search_flow_beta(context_ref::Ref{kahypar_context_t}, beta::UInt) =
    ccall((:kahypar_set_context_local_search_flow_beta, libkahypar), Cvoid, (Ref{kahypar_context_t}, Csize_t), context_ref, beta)    

kahypar_set_context_local_search_flow_use_most_balanced_minimum_cut(context_ref::Ref{kahypar_context_t}, use_most_balanced_minimum_cut::Bool) =
    ccall((:kahypar_set_context_local_search_flow_use_most_balanced_minimum_cut, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, use_most_balanced_minimum_cut)

kahypar_set_context_local_search_flow_use_adaptive_alpha_stopping_rule(context_ref::Ref{kahypar_context_t}, use_adaptive_alpha_stopping_rule::Bool) =
    ccall((:kahypar_set_context_local_search_flow_use_adaptive_alpha_stopping_rule, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, use_adaptive_alpha_stopping_rule)

kahypar_set_context_local_search_flow_ignore_small_hyperedge_cut(context_ref::Ref{kahypar_context_t}, ignore_small_hyperedge_cut::Bool) =
    ccall((:kahypar_set_context_local_search_flow_ignore_small_hyperedge_cut, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, ignore_small_hyperedge_cut)

kahypar_set_context_local_search_flow_use_improvement_history(context_ref::Ref{kahypar_context_t}, use_improvement_history::Bool) =
    ccall((:kahypar_set_context_local_search_flow_use_improvement_history, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, use_improvement_history)

# InitialPartitioningParameters
kahypar_set_context_initial_partitioning_mode(context_ref::Ref{kahypar_context_t}, ip_mode::String) =
    ccall((:kahypar_set_context_initial_partitioning_mode, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ip_mode)

kahypar_set_context_initial_partitioning_technique(context_ref::Ref{kahypar_context_t}, ip_technique::String) =
    ccall((:kahypar_set_context_initial_partitioning_technique, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ip_technique)

kahypar_set_context_initial_partitioning_algo(context_ref::Ref{kahypar_context_t}, ip_algo::String) =
    ccall((:kahypar_set_context_initial_partitioning_algo, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ip_algo)

kahypar_set_context_initial_partitioning_nruns(context_ref::Ref{kahypar_context_t}, nruns::UInt32) =
    ccall((:kahypar_set_context_initial_partitioning_nruns, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, nruns)

kahypar_set_context_initial_partitioning_coarsening_algorithm(context_ref::Ref{kahypar_context_t}, ctype::String) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_algorithm, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, ctype)

kahypar_set_context_initial_partitioning_coarsening_contraction_limit_multiplier(context_ref::Ref{kahypar_context_t}, contraction_limit_multiplier::UInt32) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_contraction_limit_multiplier, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, contraction_limit_multiplier)

kahypar_set_context_initial_partitioning_coarsening_max_allowed_weight_multiplier(context_ref::Ref{kahypar_context_t}, max_allowed_weight_multiplier::Float64) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_max_allowed_weight_multiplier, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cdouble), context_ref, max_allowed_weight_multiplier)

kahypar_set_context_initial_partitioning_coarsening_RP_rating_function(context_ref::Ref{kahypar_context_t}, rating_score::String) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_RP_rating_function, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, rating_score)

kahypar_set_context_initial_partitioning_coarsening_RP_community_policy(context_ref::Ref{kahypar_context_t}, use_communities::Bool) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_RP_community_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuchar), context_ref, use_communities)

kahypar_set_context_initial_partitioning_coarsening_RP_heavy_node_policy(context_ref::Ref{kahypar_context_t}, penalty::String) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_RP_heavy_node_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, penalty)

kahypar_set_context_initial_partitioning_coarsening_RP_acceptance_policy(context_ref::Ref{kahypar_context_t}, crit::String) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_RP_acceptance_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, crit)

kahypar_set_context_initial_partitioning_coarsening_RP_fixed_vertex_acceptance_policy(context_ref::Ref{kahypar_context_t}, crit::String) =
    ccall((:kahypar_set_context_initial_partitioning_coarsening_RP_fixed_vertex_acceptance_policy, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, crit)

kahypar_set_context_initial_partitioning_local_search_algorithm(context_ref::Ref{kahypar_context_t}, rtype::String) =
    ccall((:kahypar_set_context_initial_partitioning_local_search_algorithm, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, rtype)

kahypar_set_context_initial_partitioning_local_search_iterations_per_level(context_ref::Ref{kahypar_context_t}, iterations_per_level::Int) =
    ccall((:kahypar_set_context_initial_partitioning_local_search_iterations_per_level, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cint), context_ref, iterations_per_level)

kahypar_set_context_initial_partitioning_local_search_fm_max_number_of_fruitless_moves(context_ref::Ref{kahypar_context_t}, max_number_of_fruitless_moves::UInt32) =
    ccall((:kahypar_set_context_initial_partitioning_local_search_fm_max_number_of_fruitless_moves, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cuint), context_ref, max_number_of_fruitless_moves)

kahypar_set_context_initial_partitioning_local_search_fm_stopping_rule(context_ref::Ref{kahypar_context_t}, stopfm::String) =
    ccall((:kahypar_set_context_initial_partitioning_local_search_fm_stopping_rule, libkahypar), Cvoid, (Ref{kahypar_context_t}, Cstring), context_ref, stopfm)

# See https://github.com/SebastianSchlag/kahypar/blob/master/kahypar/application/command_line_options.h for descriptions
mutable struct context_parameters
    # general
    cmaxnet::Int
    vcycles::UInt32
    use_sparsifier::Bool
    # main -> preprocessing -> min hash sparsifier
    p_sparsifier_min_median_he_size::UInt32
    p_sparsifier_max_hyperedge_size::UInt32
    p_sparsifier_max_cluster_size::UInt32
    p_sparsifier_min_cluster_size::UInt32
    p_sparsifier_num_hash_func::UInt32
    p_sparsifier_combined_num_hash_func::UInt32
    # main -> preprocessing -> community detection
    p_detect_communities::Bool
    p_reuse_communities::Bool
    p_max_louvain_pass_iterations::UInt32
    p_min_eps_improvement::Float64
    p_louvain_edge_weight::Symbol
    # main -> coarsening
    c_type::Symbol
    c_s::Float64
    c_t::UInt32
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
    i_c_t::UInt32
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



function set_additional_parameters(context_ref::Ref{kahypar_context_t}, params::context_parameters)
    kahypar_set_context_partition_hyperedge_size_threshold(context_ref, params.cmaxnet)
    kahypar_set_context_partition_global_search_iterations(context_ref, params.vcycles)
    kahypar_set_context_preprocessing_enable_min_hash_sparsifier(context_ref, params.use_sparsifier)
    kahypar_set_context_preprocessing_min_hash_sparsifier_min_median_he_size(context_ref, params.p_sparsifier_min_median_he_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_max_hyperedge_size(context_ref, params.p_sparsifier_max_hyperedge_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_max_cluster_size(context_ref, params.p_sparsifier_max_cluster_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_min_cluster_size(context_ref, params.p_sparsifier_min_cluster_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_num_hash_functions(context_ref, p_sparsifier_num_hash_func)

    kahypar_set_context_preprocessing_enable_community_detection(context_ref, params.p_detect_communities)
    kahypar_set_context_preprocessing_community_detection_reuse_communities(context_ref, params.p_reuse_communities)
    kahypar_set_context_preprocessing_community_detection_max_pass_iterations(context_ref, params.p_max_louvain_pass_iterations)
    kahypar_set_context_preprocessing_community_detection_min_eps_improvement(context_ref, params.p_min_eps_improvement)
    kahypar_set_context_preprocessing_community_detection_edge_weight(context_ref, String(params.p_louvain_edge_weight))

    kahypar_set_context_coarsening_algorithm(context_ref, String(params.c_type))
    kahypar_set_context_coarsening_max_allowed_weight_multiplier(context_ref, params.c_s)
    kahypar_set_context_coarsening_contraction_limit_multiplier(context_ref, params.c_t)

    kahypar_set_context_coarsening_RP_rating_function(context_ref, String(params.c_rating_score))
    kahypar_set_context_coarsening_RP_community_policy(context_ref, params.c_rating_use_communities)
    kahypar_set_context_coarsening_RP_heavy_node_policy(context_ref, String(params.c_rating_heavy_node_penalty))
    kahypar_set_context_coarsening_RP_acceptance_policy(context_ref, String(params.c_rating_acceptance_criterion))
    kahypar_set_context_coarsening_RP_fixed_vertex_acceptance_policy(context_ref, String(params.c_fixed_vertex_acceptance_criterion))

    kahypar_set_context_initial_partitioning_mode(context_ref, String(params.i_mode))
    kahypar_set_context_initial_partitioning_technique(context_ref, String(params.i_technique))
    kahypar_set_context_initial_partitioning_coarsening_algorithm(context_ref, String(i_c_type))
    kahypar_set_context_initial_partitioning_coarsening_max_allowed_weight_multiplier(context_ref, params.i_c_s)
    kahypar_set_context_initial_partitioning_coarsening_contraction_limit_multiplier(context_ref, params.i_c_t)

    kahypar_set_context_initial_partitioning_coarsening_RP_rating_function(context_ref, String(params.i_c_rating_score))
    kahypar_set_context_initial_partitioning_coarsening_RP_community_policy(context_ref, params.i_c_rating_use_communities)
    kahypar_set_context_initial_partitioning_coarsening_RP_heavy_node_policy(context_ref, String(params.i_c_rating_heavy_node_penalty))
    kahypar_set_context_initial_partitioning_coarsening_RP_acceptance_policy(context_ref, String(params.i_c_rating_acceptance_criterion))
    kahypar_set_context_initial_partitioning_coarsening_RP_fixed_vertex_acceptance_policy(context_ref, String(params.i_c_fixed_vertex_acceptance_criterion))

    kahypar_set_context_initial_partitioning_algo(context_ref, String(params.i_algo))
    kahypar_set_context_initial_partitioning_nruns(context_ref, params.i_runs)

    kahypar_set_context_initial_partitioning_local_search_algorithm(context_ref, String(params.i_r_type))
    kahypar_set_context_initial_partitioning_local_search_iterations_per_level(context_ref, params.i_r_runs)
    kahypar_set_context_initial_partitioning_local_search_fm_stopping_rule(context_ref, String(params.i_r_fm_stop))
    kahypar_set_context_initial_partitioning_local_search_fm_max_number_of_fruitless_moves(context_ref, params.i_r_fm_stop_i)

    kahypar_set_context_local_search_algorithm(context_ref, String(params.r_type))
    kahypar_set_context_local_search_iterations_per_level(context_ref, params.r_runs)
    kahypar_set_context_local_search_fm_stopping_rule(context_ref, String(params.r_fm_stop))
    kahypar_set_context_local_search_fm_adaptive_stopping_alpha(context_ref, params.r_fm_stop_alpha)
    kahypar_set_context_local_search_fm_max_number_of_fruitless_moves(context_ref, params.r_fm_stop_i)

    kahypar_set_context_local_search_flow_algorithm(context_ref, String(params.r_flow_algorithm))
    kahypar_set_context_local_search_flow_alpha(context_ref, params.r_flow_alpha)
    kahypar_set_context_local_search_flow_beta(context_ref, params.r_flow_beta)
    kahypar_set_context_local_search_flow_network(context_ref, String(params.r_flow_network))
    kahypar_set_context_local_search_execution_policy(context_ref, String(params.r_flow_execution_policy))
    kahypar_set_context_local_search_flow_use_most_balanced_minimum_cut(context_ref, params.r_flow_use_most_balanced_minimum_cut)
    kahypar_set_context_local_search_flow_use_adaptive_alpha_stopping_rule(context_ref, params.r_flow_use_adaptive_alpha_stopping_rule)
    kahypar_set_context_local_search_flow_ignore_small_hyperedge_cut(context_ref, r_flow_ignore_small_hyperedge_cut)
    kahypar_set_context_local_search_flow_use_improvement_history(context_ref, r_flow_use_improvement_history)
end


    
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

    # Set the remainder of parameters
    set_additional_parameters(context, additional_parameters)

    # Create the Hypergraph representation
end
