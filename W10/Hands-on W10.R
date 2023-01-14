## Hands-on 1
library(gapminder)
library(tidyverse)
library(ggrepel)
library(socviz)

# Considering American Sociological Association Section Membership dataset (asasec), For 2013 show the relatioship between members and revenues and also cosider different colors for having journal. Use the linear prediction line.

asasec<- asasec
p1 <- ggplot(data= subset(asasec,Year==2013), mapping = aes(x=Members, y= Revenues))
p1 + geom_point(mapping=aes(color= Journal))+ geom_smooth(method = "lm")


## Hands-on 2
# Lebel those outliers with revenue bigger than $10,000

p1 <- ggplot(data = subset(asasec, Year == 2013), mapping = aes(x = Members, y = Revenues, label = Sname))
p2 <- p1 + geom_smooth(method = "lm", se = FALSE, color = "gray80") + geom_point(mapping = aes(color = Journal))
p3 <- p2 +n geom_text_repel(data=subset(asasec, Year == 2013 & Revenues > 10000), size = 2)

## Hands-on 3
# Revise the code below to use *Accent* for color
p <- ggplot(data = organdata,
            mapping = aes(x = roads, y = donors, color = world))
p + geom_point(size = 1.5) +
  theme(legend.position = "top")

p + scale_color_brewer(palette="Accent")

## Hands-on 4
# Find Lehigh university and Rutgers University color codes and dispaly it here 

universitycolors <- c("#4B2913","#CC0033")
color_comp(universitycolors)
