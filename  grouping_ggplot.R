#introduction to sorting and grouping

df <- data.frame(Titanic)
View(df)
class(df)
library(dplyr)
library(readr)

number_passengers <- df %>%
  summarise(num_passengers = sum(Freq))

class <- df %>%
  group_by(Class)%>%
  summarise(sum(Freq))
View(class)

sex <- df %>%
  select(Sex, Age, Freq)%>%
  filter(Sex == "Female")
View(sex)

arr <- df %>%
  arrange(desc(Freq))
View(arr)






library("readr")
library("dplyr")
library("ggplot2")

path <- "C:/Users/USER/Desktop/Data 1/R_course/GaminatorRclass/Brewery_data.csv"
df <- read_csv(path)
View(df)

col <- ifelse(df$COUNTRIES == "Nigeria" | df$COUNTRIES == "Ghana", 
       "Anglophone", "Francophone")
df2 <- df %>%
  mutate(TERRITORY = col, .after="COUNTRIES")
View(df2)

df3 <- df2$YEARS == 2018 | df2$YEARS == 2019
new_df <- df2[df3, ]
View(new_df)
franc <- new_df[new_df$TERRITORY == "Francophone", ]
View(franc)

franc2 <- franc %>%
  select(BRANDS, QUANTITY)%>%
  group_by(BRANDS)%>%
  summarise(sum_qty = sum(QUANTITY))
ff <- franc2[order(franc2$sum_qty, decreasing = TRUE),]
View(ff)
slice(ff,1:3)
  ff %>%
    ggplot(aes(BRANDS,sum_qty))+
    geom_col(position = "dodge")+
   coord_flip()+
labs(title = "Most Consumed Brands",
     subtitle = "the Anglophone Territory")  
  df %>% 
    ggplot(aes(QUANTITY))+
    geom_his()
  