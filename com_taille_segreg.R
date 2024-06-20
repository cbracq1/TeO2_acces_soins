com <- BDD_ctx %>% select(code_commune_original_TeO2, com_pop_ind_pond, com_pct_immi) %>% distinct()
ggplot(com, aes(x = com_pop_ind_pond, y = com_pct_immi)) +
  geom_point(size = 2, alpha = 0.05)  +                      # Ajouter le nuage de points
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Ajouter la droite de régression
  labs(title = "Nuage de points avec droite de régression",
       x = "Nombre d'habitants dans la commune",
       y = "Pourcentage d'immigrés dans la commune") +            # Ajouter des labels
  theme_minimal()    