library("readr")
path <- "C:/Users/USER/Desktop/Data 1/diabetes.csv"
df <- read_csv(path)
View(df)

cols <- colnames(df)
print(cols)

print(nrow(df))
print(ncol(df))

a_val <- df$Age >=50
b_val <- df[a_val,]
sum(a_val)


d_val <- which(a_val)
print(d_val)

print(df[d_val,])

age_dependency <- function(age_val){
  a_val <- df$Age >=age_val
  b_val <- df[a_val,]
  print(b_val)
  
}

age_dependency(25)



age_outcome_dependency <- function(age, outcome_val){
age_outcome <- df$Age > age  & df$Outcome == outcome_val
a_out <- df[age_outcome, ]
print(a_out)
}

age_outcome_dependency(38, 1)



a.mean_val  <- function(out_val){
  mean_out_a <- df$Outcome == out_val
  df_out <- df[mean_out_a, ]
  ped <- mean(df_out$DiabetesPedigreeFunction)
  value<- paste("the mean of outcome ", out_val, "pedigree function", ped, sep = " ")
  return(value)
  
}

zero_out <- a.mean_val(0)
print(zero_out)
one_out <- a.mean_val(1)
print(one_out)

mean_out_a <- df$Outcome == 1
df_out <- df[mean_out_a, ]
View(df_out)
ped <- mean(df_out$DiabetesPedigreeFunction)
print(ped)
#value<- paste("the mean of outcome ", out_val, "pedigree function", ped, sep = " ")


unique_age_val <- unique(df$Age)
bp_mean <- c()
for (i in unique_age_val){
  bp <- df$Age == i
  df_age <- df[bp, ]
  mean_bp <- mean(df_age$BloodPressure)
  bp_mean <- c(bp_mean, mean_bp)
}
print(bp_mean)

new_bp_mean <- data.frame(
  age_val = unique_age_val,
  mean_BP = bp_mean
  
)

print(new_bp_mean)

max_bp <- min(new_bp_mean$mean_BP)
a <- new_bp_mean$mean_BP == max_bp
new_bp_mean[a, ]
#print(unique_age_val)



mean_out_a <- df$Outcome == 1
df_out <- df[mean_out_a, ]
View(df_out)
ped <- mean(df_out$DiabetesPedigreeFunction)
print(ped)
#value<- paste("the mean of outcome ", out_val, "pedigree function", ped, sep = " ")


unique_age_val <- unique(df$Age)
bp_mean <- c()
for (i in unique_age_val){
  bp <- df$Age == i
  df_age <- df[bp, ]
  mean_bp <- sum(df_age$BloodPressure)
  bp_mean <- c(bp_mean, mean_bp)
}
print(bp_mean)

new_bp_mean <- data.frame(
  age_val = unique_age_val,
  mean_BP = bp_mean
  
)

print(new_bp_mean)

max_bp <- min(new_bp_mean$mean_BP)
a <- new_bp_mean$mean_BP == max_bp
new_bp_mean[a, ]



vals <- df$BloodPressure
bp_percent <- c()
for (i in vals){
 percent_bp <- round((i/ sum(df$BloodPressure))* 100, 3)
 bp_percent <- c(bp_percent, percent_bp)
}

data_percent <- data.frame(
  bloodpressure = vals,
  perecntage = bp_percent
)
print(data_percent)
View(data_percent)
