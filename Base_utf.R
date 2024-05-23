# Bases

## Niveau des enquêté.e.s

### indiv
if (!exists("indiv")) {
  indiv <- read_sas("X:/HAB-TEO2-exploitations/MàJ Insee avril 2023/indiv.sas7bdat",  catalog_file = "X:/HAB-TEO2-exploitations/MàJ Insee avril 2023/formats.sas7bcat")
  indiv <- to_factor(indiv)
  
  indiv<- indiv %>% 
    mutate(s_renonc_gen = case_when(s_queren_a == "Modalité citée"~ "A renoncé à aller voir un généraliste",
                                    TRUE ~"N'a pas renoncé à aller voir un généraliste")) %>% 
    mutate(s_renonc_spe = case_when(s_queren_b == "Modalité citée"~ "A renoncé à aller voir un spécialiste",
                                    TRUE ~"N'a pas renoncé à aller voir un spécialiste")) %>% 
    mutate(s_renonc_dent = case_when(s_queren_c == "Modalité citée"~ "A renoncé à des soins dentaires importants",
                                     TRUE ~"N'a pas renoncé à des soins dentaires importants")) %>% 
    mutate(s_renonc_med = case_when(s_queren_d == "Modalité citée"~ "A renoncé à des médicaments",
                                    TRUE ~"N'a pas renoncé à des médicaments")) %>% 
    mutate(s_renonc_lun = case_when(s_queren_e == "Modalité citée"~ "A renoncé à des lunettes",
                                    TRUE ~"N'a pas renoncé à des lunettes")) %>% 
    mutate(s_renonc_lab = case_when(s_queren_f == "Modalité citée"~ "A renoncé à faire des analyses",
                                    TRUE ~"N'a pas renoncé à faire des analyses")) %>% 
    mutate(s_renonc_irm = case_when(s_queren_g == "Modalité citée"~ "A renoncé à faire des examens d'imagerie médicale",
                                    TRUE ~"N'a pas renoncé à faire des examens d'imagerie médicale")) %>% 
    mutate(s_pqren_cout = case_when(s_pqren_a == "Modalité citée"~ "A renoncé à cause du coût",
                                    TRUE ~"N'a pas renoncé à cause du coût")) %>%
    mutate(s_pqren_attente = case_when(s_pqren_b == "Modalité citée"~ "A renoncé parce qu'attend que ça passe",
                                       TRUE ~"N'a pas renoncé parce qu'attend que ça passe")) %>%
    mutate(s_pqren_perdu = case_when(s_pqren_c == "Modalité citée"~ "A renoncé parce que ne savait pas qui aller voir",
                                     TRUE ~"N'a pas renoncé parce que ne savait pas qui aller voir")) %>%
    mutate(s_pqren_langue = case_when(s_pqren_d == "Modalité citée"~ "A renoncé à cause de la langue",
                                      TRUE ~"N'a pas renoncé à cause de la langue")) %>%
    mutate(s_pqren_papiers = case_when(s_pqren_e == "Modalité citée"~ "A renoncé à cause des papiers",
                                       TRUE ~"N'a pas renoncé à cause des papiers")) %>%
    mutate(s_pqren_peur = case_when(s_pqren_f == "Modalité citée"~ "A renoncé par peur",
                                    TRUE ~"N'a pas renoncé par peur")) %>%
    mutate(s_pqren_temps = case_when(s_pqren_g == "Modalité citée"~ "A renoncé par manque de temps",
                                     TRUE ~"N'a pas renoncé par manque de temps")) %>%
    mutate(s_pqren_loin = case_when(s_pqren_h == "Modalité citée"~ "A renoncé à cause de la distance",
                                    TRUE ~"N'a pas renoncé à cause de la distance")) 
  
  indiv <- indiv %>% 
    mutate(immig = ifelse(group1 == "Immigré (né étranger à l'étranger y compris réintégrés)", "Immigré", "Non immigré"))
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
      agenq >= 25 & s_frott =="Non" & sexee == "Féminin" ~ "Pas de frottis", 
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
  indiv$l_immi_rec <- indiv$l_immi %>%
    fct_recode(
      "Majorité immigrée" = "Presque tous sont d'origine immigrée",
      "Majorité immigrée" = "Plus de la moitié est d'origine immigrée",
      "mixte" = "La moitié est d'origine immigrée",
      "Minorité immigrée" = "Moins de la moitié est d'origine immigrée",
      "Minorité immigrée" = "Presque pas ou aucun n'est d'origine immigrée",
      "Refus/NSP" = "Refus (ne pas lire)",
      "Refus/NSP" = "NSP (ne pas lire)")
  indiv$natif <- indiv$group1 %>%
    fct_recode(
      "Immigré" = "Immigré (né étranger à l'étranger y compris réintégrés)",
      "Natif" = "Originaire de l'Outre-mer",
      "Natif" = "Descendant G2 d'un ou deux immigré-s",
      "Natif" = "Descendant G2 d'un ou deux originaire-s de l'Outre-mer",
      "Natif" = "Population non immigrée ni originaire d'Outre-mer et descendant de deux parents non immigrés et non originaires d'Outre-mer"
    )
  indiv$g2 <- indiv$group1 %>%
    fct_recode(
      "Immigré" = "Immigré (né étranger à l'étranger y compris réintégrés)",
      "Population non immigrée \ndescendant de deux parents non immigrés" = "Originaire de l'Outre-mer",
      "Population non immigrée \ndescendant de deux parents non immigrés" = "Descendant G2 d'un ou deux originaire-s de l'Outre-mer",
      "Population non immigrée \ndescendant de deux parents non immigrés" = "Population non immigrée ni originaire d'Outre-mer et descendant de deux parents non immigrés et non originaires d'Outre-mer"
    ) %>% factor(levels =c("Immigré", "Descendant G2 d'un ou deux immigré-s", "Population non immigrée \ndescendant de deux parents non immigrés"))
  indiv_pd <- svydesign(ids = indiv$ident_fa, data = indiv, weights = indiv$poidsi)
}

### BDD et indiv_bdd
if (!exists("BDD_ctx")) {load("X:/HAB-TEO2-exploitations/MàJ Insee avril 2023/Base de données contextuelles_v092023/R/BDD_ctx.rdata")
  BDD_ctx <- BDD_ctx %>% mutate(iris_pct_immi_cat = cut(iris_pct_immi, breaks = quantile(iris_pct_immi, probs=seq(0, 1, 0.2))))
  BDD_ctx <- BDD_ctx %>%
    mutate(iris_pct_imagh_afs = iris_pct_imagh + iris_pct_imafs)%>% 
    mutate(iris_pct_imagh_afs_cat = cut(iris_pct_imagh_afs, breaks = quantile(iris_pct_imagh_afs, probs=seq(0, 1, 0.2))))
  BDD_ctx$com_apl_mg_rec <- cut(BDD_ctx$com_apl_mg, breaks = c(0, 35, 70, 110, 185))
  BDD_ctx <- BDD_ctx %>% mutate(iris_pct_immi_cat = cut(iris_pct_immi, breaks = quantile(iris_pct_immi, probs=seq(0, 1, 0.2))))
  BDD_ctx <- BDD_ctx %>%
    mutate(iris_pct_imagh_afs = iris_pct_imagh + iris_pct_imafs)%>% 
    mutate(iris_pct_imagh_afs_cat = cut(iris_pct_imagh_afs, breaks = quantile(iris_pct_imagh_afs, probs=seq(0, 1, 0.2))))
  
}
if (!exists("indiv_bdd")) {indiv_bdd <- indiv %>% 
  left_join(BDD_ctx, by = "ident_fa")}


indiv_bdd_pd <- svydesign(ids = indiv_bdd$ident_fa, data = indiv_bdd, weights = indiv_bdd$poidsi)

#indiv_bdd_small <- indiv_bdd %>% select(l_quart_secu, l_quart_repue, l_quart_repuq, l_immi_rec, com_nb_eq_55, com_nb_eq_54, com_nb_eq_56, com_nb_eq_57, com_nb_eq_58, com_nb_eq_59, com_nb_eq_60, com_nb_eq_61, com_nb_eq_62, com_nb_eq_63, , com_nb_eq_64, com_nb_eq_65, com_apl_dent, com_apl_gyn, com_apl_inf, com_apl_mas, com_apl_mg, com_apl_mg40, com_apl_oph, com_apl_ped, com_apl_phar, com_apl_psy, com_apl_sagf, s_medeciq_a, s_medeciq_b, s_medeciq_c, s_medeciq_d, s_medeciq_f, s_medeciq_nbval, s_medeciq_flag, s_renonc, s_queren_a, s_queren_b, s_queren_c, s_queren_d, s_queren_e, s_queren_f, s_queren_flag, s_queren_g, s_queren_h, s_queren_nbval, s_pqren_a, s_pqren_b, s_pqren_c, s_pqren_d, s_pqren_e, s_pqren_f, s_pqren_g, s_pqren_h, s_pqren_i, s_pqren_nbval, s_pqren_flag, s_refus, s_frott, s_etat, s_maladi, s_limite, s_ald, s_deprim, s_noplais, sexee, group1, csnq_ego, csnq_premp, etre, originegeo, s_ame, s_secuq, agenq, group1, com_pop_icmp)


### Avec les distances
if (!exists("teo_dist_ident")) {teo_dist_ident <- read_parquet("distances_etab.parquet")}
if (!exists("teo_dist_ident_lib")) {teo_dist_ident_lib <- read_parquet("distances_lib.parquet")}
if (!exists("indiv_dist")) {indiv_dist <- indiv_bdd %>% 
  left_join(teo_dist_ident, by = "ident_fa") %>% 
  left_join(teo_dist_ident_lib, by = "ident_fa")
indiv_dist_pd <- svydesign(ids = indiv_dist$ident_fa, data = indiv_dist, weights = indiv_dist$poidsi) }

## Niveau des établissements 
### Iris
if (!exists("bpe_parxy")) {
  bpe_parxy <- read_sas("W:/A2031/GEN_A2031200_DCOMPSAS/BPE2020.sas7bdat")
  bpe_parxy <- bpe_parxy %>%indiv_dist <- indiv_bdd %>% 
  left_join(teo_dist_ident, by = "ident_fa") %>% 
  left_join(teo_dist_ident_lib, by = "ident_fa") 
    select(an, an_ref, CAPACITE, depcom, idetab, idservice, iris, 
           lambert_x, lambert_y, QUALITE_XY, SDOM, TYPEQU) %>% 
    filter(TYPEQU %in% c("D101", "D102", "D103", "D104", "D105", "D106", 
                         "D107", "D108", "D110", "D307", "D201", 
                         "D202", "D203", "D206", "D207", "D208", "D209", 
                         "D210", "D211", "D214", "D221", "D231", 
                         "D243", "D302")) %>% 
    mutate(code_iris_formatBDD = paste(depcom, iris, sep = ""))
  
  bpe_parxy$TYPEQU_rec <- bpe_parxy$TYPEQU %>%
    fct_recode(
      "Etablissement court séjour" = "D101",
      "Etablissement moyen séjour" = "D102",
      "Etablissement long séjour" = "D103",
      "Etablissement psychiatrique" = "D104",
      "Centre lutte cancer" = "D105",
      "Urgences" = "D106",
      "Maternité" = "D107",
      "Centre de santé" = "D108",
      "Centre médecine préventive" = "D110",
      "Pharmacie" = "D307",
      "Médecin généraliste"= "D201", "Cardiologue" = "D202", "Dermatologue" =  "D203",  
      "Gastro-entérologue" ="D206", "Psychiatre"= "D207", "Ophtalmologue"= "D208", "ORL" ="D209", 
      "Pédiatre"= "D210", "Pneumologue"= "D211", "Gynécologue" ="D214", "Dentiste" ="D221", "Sage-femme"= "D231",  
      "Psychologue"="D243", "Laboratoire d'analyses médicales" = "D302")}



iris <- BDD_ctx %>% select(code_iris_original_TeO2, matches("^iris_pct_im\\w*$")) %>% distinct() %>% 
  inner_join(bpe_parxy, by=c("code_iris_original_TeO2"="code_iris_formatBDD"))
#Une ligne par etab avec les caractéristiques de son IRIS


iris2 <- iris %>% right_join(indiv_dist) 

