## Hands-on Ch5p2

library(gapminder)
library(tidyverse)
library(socviz)

Part 1
# Question: By using *vjust* argument in geom_text() function, label all points in the vertical direction above or below each point. (two plots should be drawn, below and above each point by changing the value of *vjust*)

by_country <- organdata %>% group_by(consent_law, country) %>%
  summarize(donors_mean= mean(donors, na.rm = TRUE),
            donors_sd = sd(donors, na.rm = TRUE),
            gdp_mean = mean(gdp, na.rm = TRUE),
            health_mean = mean(health, na.rm = TRUE),
            roads_mean = mean(roads, na.rm = TRUE),
            cerebvas_mean = mean(cerebvas, na.rm = TRUE))

x <- ggplot(data = by_country, mapping = aes(x = roads_mean, y = donors_mean, label = country))
x + geom_point() + geom_text(vjust = 1.5,hjust=-.1)

# Part 2)
# For the summarized *gss_sm* dataset grouped by only *padeg*, label the mean of children and siblings based on the paternal degree.

View(gss_sm)
by_gss <- gss_sm %>% group_by(padeg) %>%
  summarize(childs_mean= mean(childs, na.rm = TRUE),
            sibs_mean = mean(sibs, na.rm = TRUE)) 
x <- ggplot(data = by_gss, mapping = aes(x = childs_mean, y = sibs_mean, label = padeg))
x + geom_point() + geom_text_repel()


## Part 3) 
# Question: For the by-country dataframe, choose observations from the united state of america (ccdoe=USA) after 1998, and then highlight them in the plot of road fatalities average against the average percentage of donors. 

organdata$ind <- organdata$ccode %in% c("USA") &
  organdata$year > 1998
x <- ggplot(data = organdata, mapping = aes(x = roads, y = donors, color = ind))
x + geom_point() + geom_text_repel(data = subset(organdata, ind), mapping = aes(label = ccode)) + guides(color = "none")   

## Part 4)
# Using gapminder dataset, specify the outliers in the plot of gdpPercap over lifeExp. 
x <-ggplot(gapminder, aes(x=gdpPercap, y=lifeExp))
x + geom_point() + annotate(geom = "rect", xmin = 75000, xmax = 120000, ymin = 50, ymax = 70, fill = "purple", alpha = 0.2) + annotate(geom = "text", x = 60000, y = 75, label = "High Life expectancies with a \nvery good GDP's.", hjust = 0)
