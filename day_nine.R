library("readr")
#install.packages("janitor")
library("janitor")
library("dplyr")
#install.packages("lubridate")
library("lubridate")

path <- "C:/Users/USER/Desktop/Data 1/Assignment/finnstats/FinData.csv"
df <- read_csv(path)
View(df)
print(colnames(df))

clean_df <- clean_names(df)
print(colnames(clean_df))
View(clean_df)

tabyl(clean_df, last_name)

for (i in colnames(clean_df)){
  summ <- tabyl(clean_df, i)
  print(summ)
}

for (i in colnames(clean_df)){
formatt <- clean_df %>% tabyl(i) %>% 
  adorn_pct_formatting(digits=2, affix_sign=TRUE)
print(formatt)
}

clean_df %>% tabyl(employee_status, full_time) %>%
  adorn_totals(where = c("row", "col"))


clean_df %>% tabyl(employee_status, full_time, subject)

# Removing empty cols and rows
new_clean <- clean_df %>% remove_empty(which = c("rows"))
clean_new <- new_clean %>% remove_empty(which = c("cols"))
View(clean_new)

# Check for duplicates
clean_new %>% get_dupes(first_name)
dat <- clean_new %>% get_dupes(first_name, certification_9)
View(dat)

b <- clean_new$hire_date
print(b)

# Splitting the numerics and strings
filtered_one <- clean_new %>% filter(!grepl('/', hire_date))
View(filtered_one)
filtered_two <- clean_new %>% filter(grepl('/', hire_date))
View(filtered_two)

# Changing the numerics to date format
num_date <- as.numeric(filtered_one$hire_date)
clean_date <- excel_numeric_to_date(num_date)
clean_date

clean_one <- filtered_one %>% mutate(hire_date = clean_date)
View(clean_one)

# Changing the strings to date format
new_dt <- mdy(filtered_two$hire_date)
clean_two <- filtered_two %>% 
  mutate(hire_date = new_dt)
View(clean_two)

# Concatting the data frames together
new_df <- rbind(clean_one, clean_two)
View(new_df)

# Checking for null values
# for (i in colnames(new_df)){
# k <- sum(is.na(new_df[i]))
# p <- paste(i, "=>", k, sep=" ")
# print(p)
# }

# Replacing null values with the mode
new_df$subject[is.na(new_df$subject)] <- "English"
# new_df$certification_9[is.na(new_df$certification_9)] <- mode(new_df$certification_9)
# new_df$certification_10[is.na(new_df$certification_10)] <- mode(new_df$certification_10)

# Getting value counts
print(table(new_df$subject))
print(table(new_df$certification_9))
#print(mode(new_df$subject))
print(unique(new_df$subject))

# Replacing bullshit values with the mode
new_df$subject[new_df$subject == "#REF!"] <- "English"
View(new_df)

colnames(new_df)
# Splitting the data frame % numbers and #N/A values
filtered_percent <- new_df %>% filter(!grepl('%',percent_allocated ))
filtered_percent2 <- new_df %>% filter(grepl('%',percent_allocated ))
View(filtered_percent)

# Creating a new vector to hold all the clean numbers
new_col <- c()
# Looping through the dirty numeric column
for (num in filtered_percent2$percent_allocated){
  # Getting all the digits before the %
  new <- substr(num, 1, nchar(num) - 1)
  # Changing the datatype
  num_new <- as.numeric(new)
  # Appending to the empty vector
  new_col <- c(new_col, num_new)
}

# Adding the new column to the data frame
filtered_percent2 <- mutate(filtered_percent2, percent_allocated = new_col)
View(filtered_percent2)

# Replacing the bullshit values with the mean
mm <- mean(filtered_percent2$percent_allocated)
filtered_percent$percent_allocated[filtered_percent$percent_allocated == "#N/A"] <- mm
View(filtered_percent)

# Concatting the data frames back together
new_df <- rbind(filtered_percent, filtered_percent2)
View(new_df)

# Writting the clean df to a file
write.csv(new_df,
          "C:\\Users\\USER\\Desktop\\clean_data.csv",
          row.names = FALSE)







