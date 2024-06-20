modelg <- svyglm(as.factor(s_medeciq_g) ~ iris_pct_immi_cat+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec,
                 family = quasibinomial,design = indiv_reg_pd)
modela <- svyglm(as.factor(s_medeciq_a) ~ iris_pct_immi_cat+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec, 
                 family = quasibinomial,design = indiv_reg_pd)
modelb <- svyglm(as.factor(s_medeciq_b) ~ iris_pct_immi_cat+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec, 
                 family = quasibinomial,design = indiv_reg_pd)
modelc <- svyglm(as.factor(s_medeciq_c) ~ iris_pct_immi_cat+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec, 
                 family = quasibinomial,design = indiv_reg_pd)
modeld <- svyglm(as.factor(s_medeciq_d) ~ iris_pct_immi_cat+nais_3ans_rec+
                   couplee_rec+agenq_cat_rec+agenq
                 +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+
                   q_franc+contramed+covid +c_nobbpq_e_rec
                 ,
                 , family = quasibinomial,
                 design = indiv_reg_gyn_pd)
modele <- svyglm(as.factor(s_medeciq_e) ~ iris_pct_immi_cat+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec, 
                 family = quasibinomial,design = indiv_reg_pd)
modelf <- svyglm(as.factor(s_medeciq_f) ~ iris_pct_immi_cat+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec, 
                 family = quasibinomial,design = indiv_reg_pd)
model_frott <- svyglm(as.factor(frott_ap_25) ~iris_pct_immi_cat+nais_3ans_rec+couplee_rec+agenq_cat_rec+agenq+
                      +s_etat_rec+csnq_actif_rec+diplome+tr_revenu+q_franc+ +contramed+covid+c_nobbpq_e_rec
                      , family = quasibinomial,
                      design = indiv_reg_frott_pd)
modelr <- svyglm(as.factor(s_renonc) ~ iris_pct_immi_cat+
                   agenq+enfant+
                   s_etat_rec+
                   q_franc+
                   # s_traite_rec+
                   sexee +
                   # origine_tous_g2+
                   csnq_actif_rec+diplome+tr_revenu +
                   covid+
                   couplee_rec #+
                 # enfant +
                 # durtotfrm +
                 # a_rfami+
                 # a_ramis+
                 # a_retud+
                 # a_rorig+
                 # a_rquart+
                 # tuu2017 +
                 # l_immi +
                 # iris_pct_sedent +
                 # iris_pct_immi
                 , family = quasibinomial,design = indiv_reg_pd)

ggstats::ggcoef_compare(list("Généraliste"=modela , "Dentiste" =modelb, "Ophtalmo."=modelc,  "Psy."= modele, "Autre spé." =modelf, "Gynéco."=modeld, "Frottis"=model_frott, "Non-rec." = modelg, "Renonc." = modelr), type = "faceted", exponentiate = TRUE, variable_labels = c("iris_pct_immi_cat"="Pourcentage d'immigrés dans l'IRIS"), , include = "iris_pct_immi_cat")
