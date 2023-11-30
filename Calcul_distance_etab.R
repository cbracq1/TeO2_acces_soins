#### Calcul distances étab

source("Libraries.R")

### Bases de données
if (!exists("indiv")) {source("recours.Rmd")}
if (!exists("bpe_parcom")) {bpe_parcom <- read_sas("W:/A2031/GEN_A2031200_DCOMPSAS/QUALITE_GEOLOC20.sas7bdat")}
if (!exists("bpe_parxy")) {
  bpe_parxy <- read_sas("W:/A2031/GEN_A2031200_DCOMPSAS/BPE2020.sas7bdat")
  bpe_parxy <- bpe_parxy %>% 
    select(an, an_ref, CAPACITE, depcom, idetab, idservice, iris, 
           lambert_x, lambert_y, QUALITE_XY, SDOM, TYPEQU) %>% 
    filter(TYPEQU %in% c("D101", "D102", "D103", "D104", "D105", "D106", "D107", "D108", "D110", "D307"))

  ## Recodage
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
    "Pharmacie" = "D307"
  )

## on enlève les DROM
bpe_parxy <- bpe_parxy %>% 
  filter(!grepl("^97", depcom))
}

if (!exists("teo_xy")) {teo_xy <- read_sas("X:/HAB-TeO/TeO2/8_Aval/1_source/tables_DSAU/ech_teo2_xy.sas7bdat")}

### On construit deux objets sf

teo_xy_sf <- teo_xy %>% 
  filter(!is.na(X)|!is.na(Y)) %>% 
  sf::st_as_sf(coords = c("X", "Y"),
                           crs = 2154)
bpe_parxy_sf <- bpe_parxy %>% 
  filter(!is.na(lambert_x)|!is.na(lambert_y)) %>% 
  sf::st_as_sf(coords = c("lambert_x", "lambert_y"),
               crs = 2154)#crs pour lambert France

plot(bpe_parxy_sf$geometry)
plot(teo_xy_sf$geometry)

### Fonction

etab_moins_de<- function(distance_en_m, typequ){
  bpe1 <- bpe_parxy_sf %>% filter(TYPEQU == typequ)
  dist <- data.frame(st_is_within_distance(teo_xy_sf$geometry, bpe1$geometry, distance_en_m, sparse = FALSE)) #à moins de 5km
  dist <- dist %>% 
    mutate(var = rowSums(dist)) %>% select(var)
  return(dist$var)
}


teo_xy_sf$urg_5km <- etab_moins_de(5000, "D106")#doute sur le fait que les colonnes restent bien dans le même ordre



dist_min <- function(typequ){
  bpe1 <- bpe_parxy_sf %>% filter(TYPEQU == typequ)
  distances_minimales <- st_distance(teo_xy_sf, bpe1)  # Renvoie une matrice de distances
  
  # Trouver la distance minimale pour chaque individu
  distance_minimale_individu <- apply(distances_minimales, 1, min)
  return(distance_minimale_individu)}


teo_xy_sf$dist_min_urg <- dist_min("D106")

teo_xy_sf$mat_5km <- etab_moins_de(5000, "D107")
teo_xy_sf$dist_min_mat <- dist_min("D107")
teo_xy_sf$centre_5km <- etab_moins_de(5000, "D108")
teo_xy_sf$dist_min_centre <- dist_min("D108")
teo_xy_sf$prev_5km <- etab_moins_de(5000, "D110")
teo_xy_sf$dist_min_prev <- dist_min("D110")
teo_xy_sf$pharma_5km <- etab_moins_de(1000, "D307")#il galère parce qu'il y en a beaucoup probablement
teo_xy_sf$dist_min_pharma <- dist_min("D307")
teo_xy_sf$court_5km <- etab_moins_de(5000, "D101")
teo_xy_sf$dist_min_court <- dist_min("D101")
teo_xy_sf$moyen_5km <- etab_moins_de(5000, "D102")
teo_xy_sf$dist_min_moyen <- dist_min("D102")
teo_xy_sf$long_5km <- etab_moins_de(5000, "D103")
teo_xy_sf$dist_min_long <- dist_min("D103")
teo_xy_sf$psy_5km <- etab_moins_de(5000, "D104")
teo_xy_sf$dist_min_psy <- dist_min("D104")
teo_xy_sf$cancer_5km <- etab_moins_de(5000, "D105")
teo_xy_sf$dist_min_cancer <- dist_min("D105")

teo_dist <- teo_xy_sf %>% select(IDENT_MEN, matches("^dist_min_\\w*$"), matches("_5km$"))


indiv_ident <- indiv %>% select(ident_fa)

teo_dist_ident <- left_join(indiv_ident, teo_dist, by = c("ident_fa" = "IDENT_MEN"))
teo_dist_ident <- teo_dist_ident %>% select(-geometry)

write_parquet(teo_dist_ident, "distances_etab.parquet")

## Tests 

# ### Echantillon
# sample_teo <- teo_xy_sf[sample(nrow(teo_xy_sf), 99),] 
# sample_bpe <- bpe_parxy_sf[sample(nrow(bpe_parxy_sf), 100),]
# 
# 
# ### Un étab à moins de 5 km?
# dist <- data.frame(st_is_within_distance(sample_teo$geometry, sample_bpe$geometry, 5000, sparse = FALSE)) #à moins de 5km
# 
# dist <- dist %>% 
#   mutate(cinqkm = rowSums(dist)) %>% select(cinqkm)
# sample_teo$cinqkm <- dist$cinqkm










