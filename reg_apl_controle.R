modela3 <- svyglm(as.factor(s_medeciq_a) ~ com_apl_mg_rec+
                    agenq+enfant+
                    s_etat_rec+
                    q_franc+
                    # s_traite_rec+
                    sexee +
                    # origine_tous_g2+
                    csnq_actif_rec+diplome+tr_revenu +
                    covid+
                    couplee_rec
                  , family = quasibinomial,design = indiv_reg_pd)

modelb <- svyglm(as.factor(s_medeciq_b) ~ com_apl_dent_rec+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec
                 , family = quasibinomial,design = indiv_reg_pd)

modelc <-svyglm(as.factor(s_medeciq_c) ~ com_apl_oph_rec+
                  agenq+enfant+
                  s_etat_rec+
                  q_franc+
                  # s_traite_rec+
                  sexee +
                  # origine_tous_g2+
                  csnq_actif_rec+diplome+tr_revenu +
                  covid+
                  couplee_rec
                , family = quasibinomial,design = indiv_reg_pd)

modeld3 <- svyglm(as.factor(s_medeciq_d) ~ com_apl_gyn_rec+nais_3ans_rec+
                    couplee_rec+agenq_cat_rec+agenq
                  +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+
                    q_franc+contramed+covid +c_nobbpq_e_rec
                  , family = quasibinomial,design = indiv_reg_gyn_pd)

modele <- svyglm(as.factor(s_medeciq_e) ~ com_apl_psy_rec+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec
                 , family = quasibinomial,design = indiv_reg_pd)

modelfr3 <- svyglm(as.factor(frott_ap_25) ~ com_apl_sagf_rec+com_apl_gyn_rec+nais_3ans_rec+
                     couplee_rec+agenq_cat_rec+agenq
                   +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+
                     q_franc+contramed+covid +c_nobbpq_e_rec
                   , family = quasibinomial,design = indiv_reg_frott_pd)



ggstats::ggcoef_compare(list("Généraliste"=modela3  ,"Gynéco."= modeld3,  "Frottis"=modelfr3, "Psy."= modele, "Dentiste"=modelb,  "Ophtalmo."=modelc), type = "faceted", exponentiate = TRUE, variable_labels = c("com_apl_mg_rec"="APL généraliste", "com_apl_dent_rec" = "APL dentiste", "com_apl_oph_rec"="APL ophtalmologue", "com_apl_gyn_rec"="APL gynécologue", "com_apl_psy_rec"="APL psychologue", "com_apl_sagf_rec"="APL sage-femme"),
                        include = c("com_apl_oph_rec", "com_apl_gyn_rec", "com_apl_psy_rec",  "com_apl_sagf_rec", 
                                    "com_apl_mg_rec", "com_apl_dent_rec"))

gtsummary::tbl_regression(modela3, exponentiate = TRUE)
gtsummary::tbl_regression(modelfr3, exponentiate = TRUE)
gtsummary::tbl_regression(modele, exponentiate = TRUE)


modela3 <- svyglm(as.factor(s_medeciq_a) ~ com_apl_mg_rec+group1*com_apl_mg_rec+
                    agenq+enfant+
                    s_etat_rec+
                    q_franc+
                    # s_traite_rec+
                    sexee +
                    # origine_tous_g2+
                    csnq_actif_rec+diplome+tr_revenu +
                    covid+
                    couplee_rec
                  , family = quasibinomial,design = indiv_reg_pd)

modelb <- svyglm(as.factor(s_medeciq_b) ~ com_apl_dent_rec+group1*com_apl_dent_rec+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec
                 , family = quasibinomial,design = indiv_reg_pd)

modelc <-svyglm(as.factor(s_medeciq_c) ~ com_apl_oph_rec+group1*com_apl_oph_rec+
                  agenq+enfant+
                  s_etat_rec+
                  q_franc+
                  # s_traite_rec+
                  sexee +
                  # origine_tous_g2+
                  csnq_actif_rec+diplome+tr_revenu +
                  covid+
                  couplee_rec
                , family = quasibinomial,design = indiv_reg_pd)

modeld3 <- svyglm(as.factor(s_medeciq_d) ~ com_apl_gyn_rec+nais_3ans_rec+group1*com_apl_gyn_rec+
                    couplee_rec+agenq_cat_rec+agenq
                  +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+
                    q_franc+contramed+covid +c_nobbpq_e_rec
                  , family = quasibinomial,design = indiv_reg_gyn_pd)

modele <- svyglm(as.factor(s_medeciq_e) ~ com_apl_psy_rec+group1*com_apl_psy_rec+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec
                 , family = quasibinomial,design = indiv_reg_pd)

modelfr3 <- svyglm(as.factor(frott_ap_25) ~ com_apl_sagf_rec+com_apl_gyn_rec+nais_3ans_rec+group1*com_apl_gyn_rec+group1*com_apl_sagf_rec+
                     couplee_rec+agenq_cat_rec+agenq
                   +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+
                     q_franc+contramed+covid +c_nobbpq_e_rec
                   , family = quasibinomial,design = indiv_reg_frott_pd)



ggstats::ggcoef_compare(list("Généraliste"=modela3  ,"Gynéco."= modeld3,  "Frottis"=modelfr3, "Psy."= modele, "Dentiste"=modelb,  "Ophtalmo."=modelc), type = "faceted", exponentiate = TRUE, variable_labels = c("com_apl_mg_rec"="APL généraliste", "com_apl_dent_rec" = "APL dentiste", "com_apl_oph_rec"="APL ophtalmologue", "com_apl_gyn_rec"="APL gynécologue", "com_apl_psy_rec"="APL psychologue", "com_apl_sagf_rec"="APL sage-femme"),
                        include = c("com_apl_oph_rec", "com_apl_gyn_rec", "com_apl_psy_rec",  "com_apl_sagf_rec", 
                                    "com_apl_mg_rec", "com_apl_dent_rec", "com_apl_mg_rec:group1", "com_apl_gyn_rec:group1", 
                                    "com_apl_sagf_rec:group1", "com_apl_psy_rec:group1", "com_apl_dent_rec:group1",
                                    "com_apl_oph_rec:group1"))


modela3 <- svyglm(as.factor(s_medeciq_a) ~ com_apl_mg_rec+originegeo2*com_apl_mg_rec+
                    agenq+enfant+
                    s_etat_rec+
                    q_franc+
                    # s_traite_rec+
                    sexee +
                    # origine_tous_g2+
                    csnq_actif_rec+diplome+tr_revenu +
                    covid+
                    couplee_rec
                  , family = quasibinomial,design = indiv_reg_pd)

modelb <- svyglm(as.factor(s_medeciq_b) ~ com_apl_dent_rec+originegeo2*com_apl_dent_rec+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec
                 , family = quasibinomial,design = indiv_reg_pd)

modelc <-svyglm(as.factor(s_medeciq_c) ~ com_apl_oph_rec+originegeo2*com_apl_oph_rec+
                  agenq+enfant+
                  s_etat_rec+
                  q_franc+
                  # s_traite_rec+
                  sexee +
                  # origine_tous_g2+
                  csnq_actif_rec+diplome+tr_revenu +
                  covid+
                  couplee_rec
                , family = quasibinomial,design = indiv_reg_pd)

modeld3 <- svyglm(as.factor(s_medeciq_d) ~ com_apl_gyn_rec+nais_3ans_rec+originegeo2*com_apl_gyn_rec+
                    couplee_rec+agenq_cat_rec+agenq
                  +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+
                    q_franc+contramed+covid +c_nobbpq_e_rec
                  , family = quasibinomial,design = indiv_reg_gyn_pd)

modele <- svyglm(as.factor(s_medeciq_e) ~ com_apl_psy_rec+originegeo2*com_apl_psy_rec+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec
                 , family = quasibinomial,design = indiv_reg_pd)

modelfr3 <- svyglm(as.factor(frott_ap_25) ~ com_apl_sagf_rec+com_apl_gyn_rec+nais_3ans_rec+originegeo2*com_apl_gyn_rec+originegeo2*com_apl_sagf_rec+
                     couplee_rec+agenq_cat_rec+agenq
                   +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+
                     q_franc+contramed+covid +c_nobbpq_e_rec
                   , family = quasibinomial,design = indiv_reg_frott_pd)



ggstats::ggcoef_compare(list("Généraliste"=modela3  ,"Gynéco."= modeld3,  "Frottis"=modelfr3, "Psy."= modele, "Dentiste"=modelb,  "Ophtalmo."=modelc), type = "faceted", exponentiate = TRUE, variable_labels = c("com_apl_mg_rec"="APL généraliste", "com_apl_dent_rec" = "APL dentiste", "com_apl_oph_rec"="APL ophtalmologue", "com_apl_gyn_rec"="APL gynécologue", "com_apl_psy_rec"="APL psychologue", "com_apl_sagf_rec"="APL sage-femme"),
                        include = c("com_apl_oph_rec", "com_apl_gyn_rec", "com_apl_psy_rec",  "com_apl_sagf_rec", 
                                    "com_apl_mg_rec", "com_apl_dent_rec", "com_apl_mg_rec:originegeo2", "com_apl_gyn_rec:originegeo2", 
                                    "com_apl_sagf_rec:originegeo2", "com_apl_psy_rec:originegeo2", "com_apl_dent_rec:originegeo2",
                                    "com_apl_oph_rec:originegeo2"))
