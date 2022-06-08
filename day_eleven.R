library(RColorBrewer)

library(readr)
df <- read_csv("Brewery_data.csv")
View(df)

print(colnames(df))
#par(mar = c(1, 1, 1, 1))
plant_cost <- df$PLANT_COST
hist(plant_cost)

frame_df <- df[df$YEARS == 2019 & df$COUNTRIES == "Ghana", ]
View(frame_df)

plot(frame_df$PROFIT, type="l")

hist(df$PLANT_COST, breaks = 5, col=brewer.pal(4, "Set3"),
     main="Histogram showing plant cost")

plot(frame_df$UNIT_PRICE, type = "l",
     main='Profit against month')


barplot(frame_df$UNIT_PRICE, col=brewer.pal(3, "Set1"))

boxplot(frame_df$UNIT_PRICE~frame_df$MONTHS, col="red")

plot(x=frame_df$UNIT_PRICE, y=frame_df$PROFIT, col="red")

#plot(frame_df)

barplot(table(frame_df$BRANDS))
pie(table(frame_df$BRANDS))


heatmap(as.matrix(frame_df))
df_val <- data.frame(frame_df$UNIT_PRICE, frame_df$PROFIT)
heatmap(as.matrix(df_val))



View(iris)
class(iris)
library(magrittr)
#library(leaflet)
install.packages(c("rgl", "car"))

library("car")
#data("iris")
a <- iris$Sepal.Length
b <- iris$Petal.Length
c <- iris$Petal.Width

scatter3d(x = a, y = b, z = c)
scatter3d(x = frame_df$UNIT_PRICE, y =frame_df$PROFIT ,
          z = frame_df$QUANTITY)

http://www.sthda.com/english/wiki/amazing-interactive-3d-scatter-plots-r-software-and-data-visualization