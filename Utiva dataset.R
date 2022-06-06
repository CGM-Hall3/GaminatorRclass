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
df$Cdf$Cdf$Cdf$CCOUNTRIES

#### 5 ####
