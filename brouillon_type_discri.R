indiv_test2 <- indiv %>% filter(!is.na(s_renonc_rec))%>% filter(!is.na(s_traite_rec)) %>% filter(s_traite_rec == "Oui")
indiv_test2_pd <-svydesign(ids = indiv_test2$ident_fa, data = indiv_test2, weights = indiv_test2$poidsi)

prop.table(svytable(~s_compor_a_corrig, indiv_test2_pd))#sexe
prop.table(svytable(~s_compor_b_corrig, indiv_test2_pd))#sante
prop.table(svytable(~s_compor_c_corrig, indiv_test2_pd))#peau
prop.table(svytable(~s_compor_d_corrig, indiv_test2_pd))#origine natio
prop.table(svytable(~s_compor_e_corrig, indiv_test2_pd))#religion
prop.table(svytable(~s_compor_f_corrig, indiv_test2_pd))#age
prop.table(svytable(~s_compor_g_corrig, indiv_test2_pd))#l'accent ou à la façon de parler 
prop.table(svytable(~s_compor_h_corrig, indiv_test2_pd))#fam
prop.table(svytable(~s_compor_i_corrig, indiv_test2_pd))#oreintation sexuelle
prop.table(svytable(~s_compor_j_corrig, indiv_test2_pd))#qtier
prop.table(svytable(~s_compor_k_corrig, indiv_test2_pd))#apparence
prop.table(svytable(~s_compor_l_corrig, indiv_test2_pd))#poids
prop.table(svytable(~s_compor_m_corrig, indiv_test2_pd))#contra IVG
prop.table(svytable(~s_compor_n_corrig, indiv_test2_pd))#nom prénom
prop.table(svytable(~s_compor_p_corrig, indiv_test2_pd))#pro
prop.table(svytable(~s_compor_q_corrig, indiv_test2_pd))#situation sociale et financière 
prop.table(svytable(~s_compor_r_corrig, indiv_test2_pd))#situation judiciaire 


model8 <- svyglm(as.factor(s_renonc_rec) ~ as.factor(group1)+as.factor(s_traite_rec)+sexee+agenq+typdip
                 , family = quasibinomial,
                 design = indiv_test_pd)
ggstats::ggcoef_model(model8, exponentiate = TRUE)

