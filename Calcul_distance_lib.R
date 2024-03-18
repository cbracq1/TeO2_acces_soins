

#### Calcul distances libéraux

source("Libraries.R")

### Bases de donnéesetab
if (!exists("indiv")) {source("recours.Rmd")}
if (!exists("bpe_parcom")) {bpe_parcom <- read_sas("W:/A2031/GEN_A2031200_DCOMPSAS/QUALITE_GEOLOC20.sas7bdat")}
if (!exists("bpe_parxy")) {
  bpe_parxy <- read_sas("W:/A2031/GEN_A2031200_DCOMPSAS/BPE2020.sas7bdat")
  bpe_parxy <- bpe_parxy %>% 
    select(an, an_ref, CAPACITE, depcom, idetab, idservice, iris, 
           lambert_x, lambert_y, QUALITE_XY, SDOM, TYPEQU) %>% 
    filter(TYPEQU %in% c("D201", "D202", "D203", "D113", "D206", "D207", "D208", "D209", 
                         "D210", "D307", "D211", "D212", "D213", "D214", "D221", "D231", 
                         "D232", "D233", "D235", "D236", "D237", "D238", "D239", "D240", 
                         "D243", "D302"))
  
  
  
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


dist_min <- function(typequ){
  bpe1 <- bpe_parxy_sf %>% filter(TYPEQU == typequ)
  distances_minimales <- st_distance(teo_xy_sf, bpe1)  # Renvoie une matrice de distances
  
  # Trouver la distance minimale pour chaque individu
  distance_minimale_individu <- apply(distances_minimales, 1, min)
  return(distance_minimale_individu)}

teo_xy_sf$lib_medge_1km <- etab_moins_de(1000, "D201")#doute sur le fait que les colonnes restent bien dans le même ordre
teo_xy_sf$lib_dist_min_medge <- dist_min("D201")
teo_xy_sf$lib_cardio_1km <- etab_moins_de(1000, "D202")
teo_xy_sf$lib_dist_min_cardio <- dist_min("D202")
teo_xy_sf$lib_dermato_1km <- etab_moins_de(1000, "D203")
teo_xy_sf$lib_dist_min_dermato <- dist_min("D203")
teo_xy_sf$lib_gastro_1km <- etab_moins_de(1000, "D206")
teo_xy_sf$lib_dist_min_gastro <- dist_min("D206")
teo_xy_sf$lib_psychiatre_1km <- etab_moins_de(1000, "D207")#il galère parce qu'il y en a beaucoup probablement
teo_xy_sf$lib_dist_min_psychiatre <- dist_min("D207")
teo_xy_sf$lib_ophtalmo_1km <- etab_moins_de(1000, "D208")
teo_xy_sf$lib_dist_min_ophtalmo <- dist_min("D208")
teo_xy_sf$lib_orl_1km <- etab_moins_de(1000, "D209")
teo_xy_sf$lib_dist_min_orl <- dist_min("D209")
teo_xy_sf$lib_ped_1km <- etab_moins_de(1000, "D210")
teo_xy_sf$lib_dist_min_ped <- dist_min("D210")
teo_xy_sf$lib_pneumo_1km <- etab_moins_de(1000, "D211")
teo_xy_sf$lib_dist_min_pneumo <- dist_min("D211")
teo_xy_sf$lib_gynéco_1km <- etab_moins_de(1000, "D214")
teo_xy_sf$lib_dist_min_gynéco <- dist_min("D214")
teo_xy_sf$lib_dent_1km <- etab_moins_de(1000, "D221")
teo_xy_sf$lib_dist_min_dent <- dist_min("D221")
teo_xy_sf$lib_sf_1km <- etab_moins_de(1000, "D231")
teo_xy_sf$lib_dist_min_sf <- dist_min("D231")
teo_xy_sf$lib_psychologue_1km <- etab_moins_de(1000, "D243")
teo_xy_sf$lib_dist_min_psychologue <- dist_min("D243")
teo_xy_sf$lib_labo_1km <- etab_moins_de(1000, "D302")
teo_xy_sf$lib_dist_min_labo <- dist_min("D302")


teo_dist <- teo_xy_sf %>% select(IDENT_MEN, matches("^lib_dist_min_\\w*$"), matches("_5km$"))


indiv_ident <- indiv %>% select(ident_fa)

teo_dist_ident <- left_join(indiv_ident, teo_dist, by = c("ident_fa" = "IDENT_MEN"))
teo_dist_ident <- teo_dist_ident %>% select(-geometry)

write_parquet(teo_dist_ident, "distances_lib.parquet")

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










