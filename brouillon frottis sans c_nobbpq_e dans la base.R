indiv_reg2 <- indiv_reg %>% filter(c_nobbpq_e=="Modalité non citée"| is.na(c_nobbpq_e))
indiv_reg2_pd <-svydesign(ids = indiv_reg2$ident_fa, data = indiv_reg2, weights = indiv_reg2$poidsi)

model <- svyglm(as.factor(frott_ap_25) ~ as.factor(nais_3ans_rec)+as.factor(couplee_rec)+agenq_cat_rec+as.factor(originegeo_rec)+as.factor(s_etat_rec)+as.factor(csnq_ego)+as.factor(q_franc)+as.factor(s_traite_rec) +contramed
                , family = quasibinomial,
                design = indiv_reg2_pd)

model2 <- svyglm(as.factor(frott_ap_25) ~ as.factor(nais_3ans_rec)+as.factor(couplee_rec)+agenq_cat_rec+as.factor(originegeo_rec)+as.factor(s_etat_rec)+as.factor(csnq_ego)+as.factor(q_franc)+as.factor(s_traite_rec) +contramed
                , family = quasibinomial,
                design = indiv_reg_pd)


ggstats::ggcoef_model(model2, exponentiate = TRUE, variable_labels = c("as.factor(originegeo_rec)" = "Origine", "as.factor(nais_3ans_rec)" = "Enfant", "as.factor(couplee_rec)" = "Couple", "agenq_cat_rec" = "Âge", "as.factor(s_etat_rec)" = "Etat de santé perçu", "as.factor(q_franc)" = "Maîtrise du français\n (évaluation par l'enquêteur.rice)", "as.factor(s_traite_rec)" = "Discrimination par \nprofessionnel de santé", "as.factor(csnq_ego)" = "Classe sociale"))
