## indiv_bdd
if (!exists("indiv")) {
  indiv <- read_sas("X:/HAB-TEO2-exploitations/MàJ Insee avril 2023/indiv.sas7bdat",  catalog_file = "X:/HAB-TEO2-exploitations/MàJ Insee avril 2023/formats.sas7bcat")
  indiv <- to_factor(indiv)
  indiv<- indiv %>% 
    mutate(s_renonc_gen = ifelse(s_queren_a == "Modalité citée", 
                                 "A renoncé à aller voir un généraliste",
                                 "N'a pas renoncé à aller voir un généraliste"))
  indiv <- indiv %>% 
    mutate(s_medeciq_g = case_when(s_medeciq_flag == "A répondu" ~  ifelse(s_medeciq_a == "Modalité non citée" & s_medeciq_b == "Modalité non citée" & s_medeciq_c == "Modalité non citée" & s_medeciq_d == "Modalité non citée" & s_medeciq_e == "Modalité non citée" & s_medeciq_f == "Modalité non citée", "Modalité citée", "Modalité non citée"),
                                   TRUE ~ s_medeciq_flag))
  indiv <- indiv %>% 
    mutate(pas_recours_etat = case_when(
      (s_etat == "Moyen"|s_etat=="Mauvais"| s_etat == "Très mauvais")&
        (s_medeciq_g=="Modalité citée")~ "Pas de recours alors que mauvaise santé déclarée",
      (s_etat == "Moyen"|s_etat=="Mauvais"| s_etat == "Très mauvais")&
        (s_medeciq_g=="Modalité non citée")~ "Recours et mauvaise santé déclarée", 
      TRUE ~ NA))
  indiv <- indiv %>% 
    mutate(pas_recours_ald = case_when(
      (s_maladi == "Oui"| s_limite == "Oui"| s_ald == "Oui")&
        (s_medeciq_g=="Modalité citée")~ "Pas de recours alors que ALD/limites/maladies chroniques",
      (s_maladi == "Oui"| s_limite == "Oui"| s_ald == "Oui")&
        (s_medeciq_g=="Modalité non citée")~ "Recours et ALD/limites/maladies chroniques", 
      TRUE ~ NA))
  indiv <- indiv %>% 
    mutate(frott_ap_25 = case_when(
      agenq >= 25 & s_frott =="Non" & sexee == "Féminin"~ "Pas de frottis", 
      agenq >= 25 & s_frott =="Oui" & sexee == "Féminin"~ "Frottis", 
      TRUE ~ NA))
  indiv <- indiv %>% 
    mutate(nonrecours_psy = case_when(
      (s_deprim == "Oui"|s_noplais == "Oui") & s_medeciq_e == "Modalité non citée" ~ "Dépression et pas de recours à un psy", 
      (s_deprim == "Oui"|s_noplais == "Oui") & s_medeciq_e == "Modalité citée" ~ "Dépression et recours à un psy", 
      TRUE ~ NA))
  indiv$group1_rec <- indiv$group1 %>%
    fct_recode(
      "Immigré" = "Immigré (né étranger à l'étranger y compris réintégrés)",
      "DROM" = "Originaire de l'Outre-mer",
      "G2 immigré" = "Descendant G2 d'un ou deux immigré-s",
      "G2 DROM" = "Descendant G2 d'un ou deux originaire-s de l'Outre-mer",
      "Autre" = "Population non immigrée ni originaire d'Outre-mer et descendant de deux parents non immigrés et non originaires d'Outre-mer"
    )
  # if (!exists("indiv_pd")) {
  indiv_pd <- svydesign(ids = indiv$ident_fa, data = indiv, weights = indiv$poidsi)
}
if (!exists("BDD_ctx")) {load("X:/HAB-TEO2-exploitations/MàJ Insee avril 2023/Base de données contextuelles_v092023/R/BDD_ctx.rdata")}
if (!exists("indiv_bdd")) {indiv_bdd <- indiv %>% 
  left_join(BDD_ctx, by = "ident_fa")}

## Recodage de indiv_bdd$l_immi en indiv_bdd$l_immi_rec
indiv_bdd$l_immi_rec <- indiv_bdd$l_immi %>%
  fct_recode(
    "Majorité immigrée" = "Presque tous sont d'origine immigrée",
    "Majorité immigrée" = "Plus de la moitié est d'origine immigrée",
    "mixte" = "La moitié est d'origine immigrée",
    "Minorité immigrée" = "Moins de la moitié est d'origine immigrée",
    "Minorité immigrée" = "Presque pas ou aucun n'est d'origine immigrée",
    "Refus/NSP" = "Refus (ne pas lire)",
    "Refus/NSP" = "NSP (ne pas lire)"
  )
indiv_bdd$com_apl_mg_rec <- cut(indiv_bdd$com_apl_mg, breaks = c(0, 35, 70, 110, 185))

indiv_bdd_pd <- svydesign(ids = indiv_bdd$ident_fa, data = indiv_bdd, weights = indiv_bdd$poidsi)
#indiv_bdd_small <- indiv_bdd %>% select(l_quart_secu, l_quart_repue, l_quart_repuq, l_immi_rec, com_nb_eq_55, com_nb_eq_54, com_nb_eq_56, com_nb_eq_57, com_nb_eq_58, com_nb_eq_59, com_nb_eq_60, com_nb_eq_61, com_nb_eq_62, com_nb_eq_63, , com_nb_eq_64, com_nb_eq_65, com_apl_dent, com_apl_gyn, com_apl_inf, com_apl_mas, com_apl_mg, com_apl_mg40, com_apl_oph, com_apl_ped, com_apl_phar, com_apl_psy, com_apl_sagf, s_medeciq_a, s_medeciq_b, s_medeciq_c, s_medeciq_d, s_medeciq_f, s_medeciq_nbval, s_medeciq_flag, s_renonc, s_queren_a, s_queren_b, s_queren_c, s_queren_d, s_queren_e, s_queren_f, s_queren_flag, s_queren_g, s_queren_h, s_queren_nbval, s_pqren_a, s_pqren_b, s_pqren_c, s_pqren_d, s_pqren_e, s_pqren_f, s_pqren_g, s_pqren_h, s_pqren_i, s_pqren_nbval, s_pqren_flag, s_refus, s_frott, s_etat, s_maladi, s_limite, s_ald, s_deprim, s_noplais, sexee, group1, csnq_ego, csnq_premp, etre, originegeo, s_ame, s_secuq, agenq, group1, com_pop_icmp)