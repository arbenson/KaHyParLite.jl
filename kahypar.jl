using KaHyPar_jll: libkahypar



function set_additional_parameters(context, params::context_parameters)
    kahypar_set_context_partition_hyperedge_size_threshold(context, params.cmaxnet)
    kahypar_set_context_partition_global_search_iterations(context, params.vcycles)
    kahypar_set_context_preprocessing_enable_min_hash_sparsifier(context, params.use_sparsifier)
    kahypar_set_context_preprocessing_min_hash_sparsifier_min_median_he_size(context, params.p_sparsifier_min_median_he_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_max_hyperedge_size(context, params.p_sparsifier_max_hyperedge_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_max_cluster_size(context, params.p_sparsifier_max_cluster_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_min_cluster_size(context, params.p_sparsifier_min_cluster_size)
    kahypar_set_context_preprocessing_min_hash_sparsifier_num_hash_functions(context, p_sparsifier_num_hash_func)

    kahypar_set_context_preprocessing_enable_community_detection(context, params.p_detect_communities)
    kahypar_set_context_preprocessing_community_detection_reuse_communities(context, params.p_reuse_communities)
    kahypar_set_context_preprocessing_community_detection_max_pass_iterations(context, params.p_max_louvain_pass_iterations)
    kahypar_set_context_preprocessing_community_detection_min_eps_improvement(context, params.p_min_eps_improvement)
    kahypar_set_context_preprocessing_community_detection_edge_weight(context, String(params.p_louvain_edge_weight))

    kahypar_set_context_coarsening_algorithm(context, String(params.c_type))
    kahypar_set_context_coarsening_max_allowed_weight_multiplier(context, params.c_s)
    kahypar_set_context_coarsening_contraction_limit_multiplier(context, params.c_t)

    kahypar_set_context_coarsening_RP_rating_function(context, String(params.c_rating_score))
    kahypar_set_context_coarsening_RP_community_policy(context, params.c_rating_use_communities)
    kahypar_set_context_coarsening_RP_heavy_node_policy(context, String(params.c_rating_heavy_node_penalty))
    kahypar_set_context_coarsening_RP_acceptance_policy(context, String(params.c_rating_acceptance_criterion))
    kahypar_set_context_coarsening_RP_fixed_vertex_acceptance_policy(context, String(params.c_fixed_vertex_acceptance_criterion))

    kahypar_set_context_initial_partitioning_mode(context, String(params.i_mode))
    kahypar_set_context_initial_partitioning_techniqu(context, String(params.i_technique))
    kahypar_set_context_initial_partitioning_coarsening_algorithm(context, String(i_c_type))
    kahypar_set_context_initial_partitioning_coarsening_max_allowed_weight_multiplier(context, params.i_c_s)
    kahypar_set_context_initial_partitioning_coarsening_contraction_limit_multiplier(context, i_c_t)

    kahypar_set_context_initial_partitioning_coarsening_RP_rating_function(context, String(params.i_c_rating_score))
    kahypar_set_context_initial_partitioning_coarsening_RP_community_policy(context, params.i_c_rating_use_communities)
    kahypar_set_context_initial_partitioning_coarsening_RP_heavy_node_policy(context, String(params.i_c_rating_heavy_node_penalty))
    kahypar_set_context_initial_partitioning_coarsening_RP_acceptance_policy(context, String(params.i_c_rating_acceptance_criterion))
    kahypar_set_context_initial_partitioning_coarsening_RP_fixed_vertex_acceptance_policy(context, String(params.i_c_fixed_vertex_acceptance_criterion))

    kahypar_set_context_initial_partitioning_algo(context, String(params.i_algo))
    kahypar_set_context_initial_partitioning_nruns(context, params.i_runs)

    kahypar_set_context_initial_partitioning_local_search_algorithm(context, String(params.i_r_type))
    kahypar_set_context_initial_partitioning_local_search_iterations_per_level(context, params.i_r_runs)
    kahypar_set_context_initial_partitioning_local_search_fm_stopping_rule(context, String(params.i_r_fm_stop))
    kahypar_set_context_initial_partitioning_local_search_fm_max_number_of_fruitless_moves(context, params.i_r_fm_stop_i)

    kahypar_set_context_local_search_algorithm(context, String(params.r_type))
    kahypar_set_context_local_search_iterations_per_level(context, params.r_runs)
    kahypar_set_context_local_search_fm_stopping_rule(context, String(params.r_fm_stop))
    kahypar_set_context_local_search_fm_adaptive_stopping_alpha(context, params.r_fm_stop_alpha)
    kahypar_set_context_local_search_fm_max_number_of_fruitless_moves(context, params.r_fm_stop_i)

    kahypar_set_context_local_search_flow_algorithm(context, String(params.r_flow_algorithm))
    kahypar_set_context_local_search_flow_alpha(context, params.r_flow_alpha)
    kahypar_set_context_local_search_flow_beta(context, params.r_flow_beta)
    kahypar_set_context_local_search_flow_network(context, String(params.r_flow_network))
    kahypar_set_context_local_search_execution_policy(context, String(params.r_flow_execution_policy))
    kahypar_set_context_local_search_flow_use_most_balanced_minimum_cut(context, params.r_flow_use_most_balanced_minimum_cut)
    kahypar_set_context_local_search_flow_use_adaptive_alpha_stopping_rule(context, params.r_flow_use_adaptive_alpha_stopping_rule)
    kahypar_set_context_local_search_flow_ignore_small_hyperedge_cut(context, r_flow_ignore_small_hyperedge_cut)
    kahypar_set_context_local_search_flow_use_improvement_history(context, r_flow_use_improvement_history)
end

