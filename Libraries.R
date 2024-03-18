### Libraries
library(xtable)
library(modelsummary)
library(questionr)
library(tidyverse)
library(dplyr)
library(arrow)
library(haven)
library(labelled)#pour passer les labels en factor
library(survey)#pondérations
library(gtsummary)
theme_gtsummary_language("fr", decimal.mark = ",", big.mark = " ")
library(ggplot2)
library(srvyr)#pondérations avec dplyr
library(sf)#calcul distance géo
library(estimatr)
library(scales)
library(cowplot)

# Pour les AFM
library(FactoMineR)
library(explor)
library(Factoshiny)
library(corrplot)
