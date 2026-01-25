rm(list=ls())

library(here)
library(sf)

# Chargement de la base de données 
load("dat.RData")

# Chargement du fonds de carte
com <- st_read("commune.shp")

# Procédure pour choisir les départements de la région BFC
datBFC <- subset(dat,dat$REG %in% c("26","43"))   # Utilisation de l'identifiant de région pour la base de données
comBFC <- subset(com,com$CODE_DEP %in% c("21","25","70","39","58","71","90","89")) # Utilisation de l'identifiant de département pour le fonds de carte
plot(comBFC)

# Appariement du fonds de carte et de la base de données
comBFC <- merge(comBFC,datBFC,by.x="INSEE_COM",by.y="CODGEO")
rm(dat,com,datBFC)
