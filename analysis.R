install.packages("plotly")
install.packages(c("ggplot2", "sf", "rnaturalearth", "rnaturalearthdata", "rgeos"))
library(plotly)
library(tidyverse)
# Setting working directory to access the downloaded dataset
setwd("/Users/divyakapur/Documents/CS544/finalproject")
getwd()
# Importing dataset as csv file
meteorites <- read_csv("meteorite-landings.csv")
# Converting dataset to tibble
as_tibble(meteorites)
ncol(meteorites)
colnames(meteorites)
head(meteorites)
summary(meteorites)

# Plot of mass
summary(meteorites$mass)
log_mass <- log(meteorites$mass)
cbind(meteorites, log_mass)

# Box plot of population mass
mass_boxplot <- plot_ly(meteorites, x = ~log_mass, type = "box", name = "Mass (scaled by log)")
mass_boxplot

# Histogram of population mass
mass_histogram <- plot_ly(meteorites, x = ~log_mass, type = "histogram") %>%
  layout(title = "Mass (scaled by log) of population")
mass_histogram

# Histogram of sample mass with sample size = 1000
meteorites_sample1 <- meteorites[sample(nrow(meteorites), 1000),]
meteorites_sample1
sample1_log_mass <- log(meteorites_sample1$mass)
sample1_mass_histogram <- plot_ly(meteorites_sample1, x = ~sample1_log_mass, type = "histogram") %>%
  layout(title = "Mass (scaled by log) of sample size n = 1000")
sample1_mass_histogram

# Histogram of sample mass with sample size = 5000
meteorites_sample2 <- meteorites[sample(nrow(meteorites), 5000),]
meteorites_sample2
sample2_log_mass <- log(meteorites_sample2$mass)
sample2_mass_histogram <- plot_ly(meteorites_sample2, x = ~sample2_log_mass, type = "histogram") %>%
  layout(title = "Mass (scaled by log) of sample size n = 5000")
sample2_mass_histogram

# Histogram of sample mass with sample size = 10000
meteorites_sample3 <- meteorites[sample(nrow(meteorites), 10000),]
meteorites_sample3
sample3_log_mass <- log(meteorites_sample3$mass)
sample3_mass_histogram <- plot_ly(meteorites_sample3, x = ~sample3_log_mass, type = "histogram") %>%
  layout(title = "Mass (scaled by log) of sample size n = 10000")
sample3_mass_histogram

# Histogram of all meteorite landings grouped by year
meteorites %>% group_by(year)
year_plot <- plot_ly(meteorites, x = ~year, type = "histogram", xbins = list(start=1900, end=2020, size=1)) %>% 
  layout(xaxis = list(range = c(1900, 2014)), title = "Meteorite Landings by Year")
year_plot

# Histogram of all meteorite landings grouped by decade
decade_plot <- plot_ly(meteorites, x = ~year, type = "histogram", xbins = list(start=1900, end=2020, size=10)) %>% 
  layout(xaxis = list(range = c(1900, 2014)), title = "Meteorite Landings by Decade")
decade_plot

# Histogram of observed meteorite landings grouped by year
fell_meteorites <- as_tibble(filter(meteorites, fall == "Fell"), na.rm = TRUE)
fell_meteorites
fell_year_plot <- plot_ly(fell_meteorites, x = ~year, type = "histogram", xbins = list(start=1900, end=2020, size=1)) %>% 
  layout(xaxis = list(range = c(1900, 2014)), title = "Observed Meteorite Landings by Year")
fell_year_plot

# Histogram of found meteorites grouped by year
found_meteorites <- as_tibble(filter(meteorites, fall == "Found"), na.rm = TRUE)
found_meteorites
found_year_plot <- plot_ly(found_meteorites, x = ~year, type = "histogram", xbins = list(start=1900, end=2020, size=1)) %>% 
  layout(xaxis = list(range = c(1900, 2014)), title = "Meteorites Found by Year")
found_year_plot

# Stacked histogram of both observed and found meteorites grouped by year
found_fell_by_year <- plot_ly(alpha=0.6) %>%
  add_histogram(data=fell_meteorites, x = ~year, type = "histogram", xbins = list(start=1900, end=2020, size=1)) %>%
  add_histogram(data=found_meteorites, x = ~year, type = "histogram", xbins = list(start=1900, end=2020, size=1)) %>%
  layout(xaxis = list(range = c(1900, 2014)), barmode = "stack")
found_fell_by_year
nrow(fell_meteorites)
nrow(found_meteorites)
# The number of found meteorites exceeds the number of meteorites observed falling so greatly 
# that it is difficult to visualize the two histograms overlaid with each other 

# Loading packages needed to create maps
library("ggplot2")
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")
library("rgeos")

# Geographic distribution of all meteorite landings
world <- ne_countries(scale = "medium", returnclass = "sf")
longitudes <- na.omit(meteorites$reclong)
# Removing weird longitudes from the data set
#outlier <- which(longitudes > 180)
#outlier
#longitudes <- longitudes[-outlier]
#longitudes
latitudes <- na.omit(meteorites$reclat)
#latitudes <- latitudes[-outlier]
latitudes
points <- data.frame(longitude = longitudes, latitude = latitudes)
points
map <- ggplot(data = world) + geom_sf(color= "black", fill = "lightgreen") + 
  geom_point(data = points, aes(x=longitude, y=latitude), size = 0.5, color = "Purple", fill = "Medium Purple 1", pch = 21) +
  ggtitle("Meteorite Landings")
map

# Geographic distribution of observed meteorite landings
fell_longitudes <- na.omit(fell_meteorites$reclong)
fell_latitudes <- na.omit(fell_meteorites$reclat)
fell_points <- data.frame(longitude = fell_longitudes, latitude = fell_latitudes)
fell_map <- ggplot(data = world) + geom_sf(color= "black", fill = "lightgreen") + 
  geom_point(data = fell_points, aes(x=longitude, y=latitude), size = 0.5, color = "Deep Pink", fill = "Pink", pch = 21) +
  ggtitle("Observed Meteorite Landings")
fell_map

#Geographic distribution of found meteorites
found_longitudes <- na.omit(found_meteorites$reclong)
#found_outlier <- which(found_longitudes>180)
#found_longitudes <- found_longitudes[-found_outlier]
found_latitudes <- na.omit(found_meteorites$reclat)
#found_latitudes <-found_latitudes[-found_outlier]
found_points <- data.frame(longitude = found_longitudes, latitude = found_latitudes)
found_map <- ggplot(data = world) + geom_sf(color= "black", fill = "lightgreen") +
  geom_point(data = found_points, aes(x=longitude, y=latitude), size = 0.5, color = "Blue", fill = "Light Blue", pch = 21) +
  ggtitle("Found Meteorites")
found_map

# Geographic distribution of observed + found meteorites
found_fell_map <- ggplot(data = world) + geom_sf(color= "black", fill = "lightgreen") + 
  geom_point(data = fell_points, aes(x=longitude, y=latitude), size = 0.5, color = "Deep Pink", fill = "Pink", pch = 21) +
  geom_point(data = found_points, aes(x=longitude, y=latitude), size = 0.5, color = "Blue", fill = "Light Blue", pch = 21) +
  ggtitle("Observed Meteorite Landings + Found Meteorites")
found_fell_map

# Geographic distribution of meteorite landings, size of points based on mass
mass_points <- data.frame(id = meteorites$id, mass = meteorites$mass, longitude = meteorites$reclong, latitude = meteorites$reclat)
mass_points <- na.omit(mass_points)
mass_points
map_by_mass <- ggplot(data = world) + geom_sf(color= "black", fill = "lightgreen") + 
  geom_point(data = mass_points, aes(x=longitude, y=latitude, size = mass, color = mass)) +
  ggtitle("Meteorite Landings") + scale_color_gradient(low="blue", high="red")
map_by_mass
