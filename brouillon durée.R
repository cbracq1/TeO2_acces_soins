# A  faire
indiv_dure <- indiv_dist %>% filter(group1 == "Immigré (né étranger à l'étranger y compris réintégrés)") %>% select(origine_tous_g2, durtotfrm, dist_min_urg, s_medeciq_g, s_renonc)
indiv_dure$durtotfrm <- as.numeric(indiv_dure$durtotfrm)
esquisse::esquisser(indiv_dure)

library(ggplot2)


class_colors_origin <- c("Immigrés d'Afrique sahélienne" = "#6B8E23", "Immigrés d'autres pays de l'UE27" = "dodgerblue", 
                         "Immigrés d'autres pays d'Europe" = "deepskyblue", 
                         "Immigrés du Portugal" = "blue4", "Immigrés d'Afrique guinéenne ou centrale" = "#9ACD32",
                         "Immigrés du Maroc/Tunisie" = "#458B74", "Immigrés d'Algérie" = "#54FF9F", "Immigrés d'Espagne ou d'Italie" = "blue",
                         "Immigrés d'autres pays" = "grey",  "Immigrés d'autres pays d'Afrique" = "#32CD32","Immigrés de Turquie ou du Moyen-Orient" = "#8B6508",
                         "Immigrés de Chine" = "#EE0000", "Immigrés d'Asie du Sud-est" = "#FF8247", "Immigrés d'autres pays d'Asie" = "#A52A2A")



ggplot(indiv_dure) +
 aes(x = durtotfrm, fill = origine_tous_g2) +
 geom_density(adjust = 1L) +
 labs(x = "Durée totale passée en France (en années)", fill = "Origine géographique") +
 theme_minimal() +
 theme(legend.position = "bottom") +
 facet_wrap(vars(origine_tous_g2))+
  scale_fill_manual(values = class_colors_origin, guide = guide_legend(title = "Origine géographique")) 

ggplot(indiv_dure) +
 aes(x = durtotfrm) +
 geom_density(adjust = 1L, fill = "#112446") +
 labs(x = "Durée totale passée en France (en années)") +
 theme_minimal()

