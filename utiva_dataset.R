library("readr")
library("dplyr")

path <- "C:/Users/USER/Desktop/Data 1/Assignment/Brewery_data.csv"
df <- read_csv(path)
View(df)

territory <- c()

for (country in df$COUNTRIES){
  
  if (country == "Nigeria" | country == "Ghana"){
    territory <- c(territory, "Anglophone")
  } else {
    territory <- c(territory, "Francophone")
  }
  
}

df2 <- mutate(df, TERRITORY = territory, .after = "COUNTRIES")
View(df2)

data <- mutate(df2, PERC_PROFIT = ((df2$PROFIT / prof) * 100), 
               .after = "PROFIT")
View(data)

#### 1 ####
profit <- sum(df$PROFIT)
print(profit)

#### 2 ####
terr_profit <- function(territory){  
  mask <- df2$TERRITORY == territory
  pos <- which(mask)
  profit <- sum(df2$PROFIT[pos])
  return(profit)
}

terr_profit("Anglophone")
terr_profit("Francophone")

#### 3 ####
profit <- function(year){
  a <- df$YEARS == year
  aa <- df[a,]
  inx <- which.max(aa$PROFIT)
  return(aa$COUNTRIES[inx])
}

profit(2017)
profit(2018)
profit(2019)

#### 4 ####
highest <- which.max(df$PROFIT)
c <- df$YEARS[highest]


#### 5 ####





#### 6 ####
d <- df$YEARS == 2018 & df$MONTHS == "December"
dd <- df[d,]
View(dd)
min(dd$PROFIT)

#### 7 ####
mm <- df$YEARS == 2019
m <- df[mm,]
View(m)
prof <- sum(m$PROFIT)
prof
pp <- (m$PROFIT / prof) * 100

df3 <- mutate(m, PERC_PROFIT = pp, .after = "PROFIT")
View(df3)
