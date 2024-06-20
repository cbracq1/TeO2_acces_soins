ggsurvey(indiv_pd) +
  aes(x = originegeo2, fill = c_nobb) +
  geom_bar(position = "fill") +
  scale_fill_hue(direction = 0) +coord_flip() 
  
ggsurvey(indiv_pd) +
  aes(x = originegeo2, fill = c_nobbq_e) +
  geom_bar(position = "fill") +
  scale_fill_hue(direction = 0) +coord_flip()   
  
  
  
  labs(
    x = "Origine",
    y = "Proportion",
    fill = "Amis de la même origine\n hors famille rencontrés \ndans les 2 dernières semaines"
  )# + scale_fill_manual(values = c("Presque tous" = "#016c59",      "Plus de la moitié" = "#1c9099",       "La moitié"   = "#67a9cf", "Moins de la moitié" = "#a6bddb",     "Presque aucun ou aucun" ="#d0d1e6",        "Pas d'amis hors famille" ="#fd8d3c", "Refus ou ne sait pas" ="#636363"))+
 +coord_flip() 
# theme(legend.position = "bottom") 
  
cprop(svytable(~c_nobbq_f+originegeo2, indiv_pd))
cprop(svytable(~c_nobbq_b+originegeo2, indiv_pd))
cprop(svytable(~c_nobbq_c+originegeo2, indiv_pd))


indiv <- indiv %>% mutate(contraception = case_when(c_nobbq_flag%in%c("-1", "-2")|c_nobbpq_flag%in%c("-1", "-2")~"Refus ou ne sait pas",
                                             (c_nobb=="Oui"&c_nobbq_f=="Modalité citée")| (c_nobb!="Oui" & c_nobbpq_l=="Modalité citée")~"Méthode ogino, des températures,\n du calendrier, abstinence périodique",
                                             c_nobb=="Oui"&c_nobbq_a == "Modalité citée"~"Pilule",
                                             c_nobb=="Oui" & c_nobbq_b == "Modalité citée"~"Stérilet",
                                             c_nobb=="Oui"&c_nobbq_c == "Modalité citée"~"Implant",
                                             (c_nobb=="Oui"&(c_nobbq_i == "Modalité citée"|c_nobbq_h == "Modalité citée"))| (c_nobb!="Oui" & (c_nobbq_a == "Modalité citée"|c_nobbq_b == "Modalité citée"))~"Stérilisation",
                                             (c_nobb=="Oui"& c_nobbq_a != "Modalité citée"& 
                                               c_nobbq_b != "Modalité citée"& c_nobbq_c != "Modalité citée"& 
                                               c_nobbq_d != "Modalité citée"& c_nobbq_e == "Modalité citée"&
                                               c_nobbq_f != "Modalité citée"& c_nobbq_g != "Modalité citée"& 
                                               c_nobbq_h != "Modalité citée"& c_nobbq_i != "Modalité citée"& 
                                               c_nobbq_j != "Modalité citée"& c_nobbq_k != "Modalité citée") | (c_nobb!="Oui" & c_nobbpq_n=="Modalité citée")~"Retrait seul",
                                             (c_nobb=="Oui"& c_nobbq_a != "Modalité citée"& 
                                               c_nobbq_b != "Modalité citée"& c_nobbq_c != "Modalité citée"& 
                                               c_nobbq_d == "Modalité citée"& c_nobbq_e != "Modalité citée"&
                                               c_nobbq_f != "Modalité citée"& c_nobbq_g != "Modalité citée"& 
                                               c_nobbq_h != "Modalité citée"& c_nobbq_i != "Modalité citée"& 
                                               c_nobbq_j != "Modalité citée"& c_nobbq_k != "Modalité citée") | (c_nobb!="Oui" & c_nobbpq_j=="Modalité citée")~"Préservatif seul",
                                             c_nobb!="Oui"&(c_nobbpq_c=="Modalité citée"|c_nobbpq_d=="Modalité citée"|c_nobbpq_e=="Modalité citée"|c_nobbpq_f=="Modalité citée"|
                                                              c_nobbpq_g=="Modalité citée"|c_nobbpq_h=="Modalité citée"|c_nobbpq_i=="Modalité citée"|c_nobbpq_m=="Modalité citée")~"Pas de besoin de contraception",
                                             c_nobbpq_k=="Modalité citée"&c_nobbpq_nbval=="1"~"Pas de contraception pour\n raisons philosophiques ou religieuses",
                                              TRUE~"Autre"))

indiv$contraception <- factor(as.factor(indiv$contraception), levels =c("Pilule", "Implant", "Stérilet", 
                                                      "Méthode ogino, des températures,\n du calendrier, abstinence périodique",
                                                      "Préservatif seul","Retrait seul", "Stérilisation", "Pas de contraception pour\n raisons philosophiques ou religieuses", 
                                                      "Pas de besoin de contraception", "Autre", "Refus ou ne sait pas"))
indiv_pd <-svydesign(ids = indiv$ident_fa, data = indiv, weights = indiv$poidsi)


ggsurvey(indiv_pd) +
  aes(x = originegeo2, fill = contraception) +
  geom_bar(position = "fill") + scale_fill_manual(values=c("#f768a1", "#fb6a4a", "#c994c7", "#08519c", 
                                                           "#6baed6", "#99d8c9", "#33a02c", "#74c476", "#fed976", "#d9d9d9","#bdbdbd"))+
   coord_flip() 

indiv_f <- indiv %>% filter(sexee=="Féminin")
indiv_f_pd <-svydesign(ids = indiv_f$ident_fa, data = indiv_f, weights = indiv_f$poidsi)
ggsurvey(indiv_f_pd) +
  aes(x = originegeo2, fill = contraception) +
  geom_bar(position = "fill") + scale_fill_manual(values=c("#f768a1", "#fb6a4a", "#c994c7", "#08519c", 
                                                           "#6baed6", "#99d8c9", "#33a02c", "#74c476", "#fed976", "#d9d9d9","#bdbdbd"))+
  coord_flip() 

indiv_frott <- indiv %>% filter(sexee=="Féminin") %>% filter(agenq>=25)
indiv_frott_pd <-svydesign(ids = indiv_frott$ident_fa, data = indiv_frott, weights = indiv_frott$poidsi)

ggsurvey(indiv_frott_pd) +
  aes(x = originegeo2, fill = contraception) + scale_fill_manual(values=c("#f768a1", "#fb6a4a", "#c994c7", "#08519c", 
                                                                          "#6baed6", "#99d8c9", "#33a02c", "#74c476", "#fed976", "#d9d9d9","#bdbdbd"))+
  geom_bar(position = "fill")  +
  labs(
    x = "Origine",
    y = "Proportion",
    fill = NULL
  ) +
  coord_flip() +
  theme(legend.position = "bottom")

indiv_pasgyn <- indiv %>% filter(sexee=="Féminin") %>% filter(s_medeciq_d == "Modalité non citée") %>% filter(frott_ap_25 == "Pas de frottis")
indiv_pasgyn_pd <-svydesign(ids = indiv_pasgyn$ident_fa, data = indiv_pasgyn, weights = indiv_pasgyn$poidsi)


ggsurvey(indiv_pasgyn_pd) +
  aes(x = originegeo2, fill = contraception) + scale_fill_manual(values=c("#f768a1", "#fb6a4a", "#c994c7", "#08519c", 
                                                                          "#6baed6", "#99d8c9", "#33a02c", "#74c476", "#fed976", "#d9d9d9","#bdbdbd"))+
  geom_bar(position = "fill") +
  labs(
    x = "Origine",
    y = "Proportion",
    fill = NULL
  ) +
  coord_flip() +
  theme(legend.position = "bottom")


