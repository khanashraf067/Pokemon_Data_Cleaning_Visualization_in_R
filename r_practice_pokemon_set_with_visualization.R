pokemon<-read.csv("E:/r programming/pokemon.csv")
View(pokemon)


#checking number of rows and columns
nrow(pokemon)
ncol(pokemon)


#tabulation of categorical column
table(pokemon$is_legendary)
table(pokemon$generation)
table(pokemon$type1)

#min_max hp
min(pokemon$hp)
max(pokemon$hp)

#checking missing value
is.na(pokemon$abilities)
sum(is.na(pokemon$abilities))

#remaining column
colnames(pokemon)[colnames(pokemon)=='type1']<-"primary_type"
View(pokemon)
colnames(pokemon)[colnames(pokemon)=='type2']<-"secondary_type"

colnames(pokemon)[colnames(pokemon)=='name']<-"pokemon_name"
----------------------------------------------------------------------------
 install.packages("pipefittr") 
#grass_pokemon
install.packages("dplyr")
library(dplyr)

pokemon %>% filter(pokemon$primary_type=="grass")-> grass_pokemon
View(grass_pokemon)
min(grass_pokemon$speed)
max(grass_pokemon$speed)

mean(grass_pokemon$speed)
mean(grass_pokemon$sp_attack)
mean(grass_pokemon$sp_defense)

#visualizing stats of grass-pokemon
#hp
library(ggplot2)
ggplot(data=grass_pokemon,aes(x=hp))+geom_histogram()
ggplot(data=grass_pokemon,aes(x=hp))+geom_histogram(fill="palegreen4")
#height
ggplot(data=grass_pokemon,aes(x=height_m))+geom_histogram()

#weight
ggplot(data=grass_pokemon,aes(x=weight_kg))+geom_histogram()


#legendary vs not-legendary
ggplot(data=grass_pokemon,aes(x=is_legendary))+geom_bar()

#extracting fire pokemon same as grass pokemon
#generation
ggplot(data=grass_pokemon,aes(x=generation,fill=as.factor(generation)))+geom_bar()

#secondary_type
ggplot(data=grass_pokemon,aes(x=secondary_type,fill=secondary_type))+geom_bar()

#sp_attack vs sp_defense
ggplot(data=grass_pokemon,aes(x=sp_attack,y=sp_defense))+geom_point(col="red")

#height vs weight
ggplot(data=grass_pokemon,aes(x=height_m,y=weight_kg))+geom_point(col="pink")

#against_ice
ggplot(data = grass_pokemon, aes(x=against_ice))+geom_histogram()

#against_poison
ggplot(data = grass_pokemon, aes(x=against_poison))+geom_histogram()


#save ggplot
ggsave("POKEMON POWER ANALYSIS.png")


