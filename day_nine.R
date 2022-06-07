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

new_clean <- clean_df %>% remove_empty(whic = c("rows"))
clean_new <- new_clean %>% remove_empty(whic = c("cols"))
View(clean_new)

clean_new %>% get_dupes(first_name)
dat <- clean_new %>% get_dupes(first_name, certification_9)
View(dat)

b <- clean_new$hire_date
print(b)

filtered_one <- clean_new %>% filter(!grepl('/', hire_date))
View(filtered_one)
filtered_two <- clean_new %>% filter(grepl('/', hire_date))
View(filtered_two)
glimpse(filtered_two)
num_date <- as.numeric(filtered_one$hire_date)
clean_date <- excel_numeric_to_date(num_date)
clean_date

clean_one <- filtered_one %>% mutate(hire_date = clean_date)
View(clean_one)

new_dt <- mdy(filtered_two$hire_date)
clean_two <- filtered_two %>% 
  mutate(hire_date = new_dt)
View(clean_two)

new_df <- rbind(clean_one, clean_two)
View(new_df)

# for (i in colnames(new_df)){
# k <- sum(is.na(new_df[i]))
# p <- paste(i, "=>", k, sep=" ")
# print(p)
# }

# new_df$subject[is.na(new_df$subject)] <- mode(new_df$subject)
# new_df$certification_9[is.na(new_df$certification_9)] <- mode(new_df$certification_9)
# new_df$certification_10[is.na(new_df$certification_10)] <- mode(new_df$certification_10)
