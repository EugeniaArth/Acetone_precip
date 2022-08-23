#For paper Acetone precipitation
library(ggplot2)
library(dplyr)
library(skimr)
library("xlsx")

C.sericea <- read.csv("C.sericae_30-80acetone_corr.csv", head=TRUE,dec = ",", sep=";", stringsAsFactors=FALSE)
C.sericea$Group <- as.factor(C.sericea$Group)
C.sericea$Protein..mg.mL
C.sericea$Активность..nkat.mg.1.of.protein


Protein <- ggplot(data=C.sericea, aes(x=Group, y=Protein..mg.mL)) +
  geom_boxplot() +
  xlab("Группа") + ylab("Содержание белка, мг/мл") + 
  theme_light()
Protein
png("Protein.png")
Activity <- ggplot(data=C.sericea, aes(x=Group, y=Активность..nkat.mg.1.of.protein)) +
  geom_boxplot() +
  xlab("Группа") + ylab("Активность, нкат на мг белка") + 
  theme_light()
Activity
png("Activity.png")


Stat <- C.sericea %>% group_by(Group) %>% skim
write.xlsx(Stat, file = "Desc.stat.xlsx", 
           col.names = TRUE, row.names = TRUE, append = TRUE) 

