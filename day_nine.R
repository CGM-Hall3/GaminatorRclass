library("readr")
#install.packages("janitor")
library("janitor")
library("dplyr")


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

clean_df %>% tabyl(employee_status, full_time) %>% adorn_totals()

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

f1_date <- c()
for (i in filtered_one$hire_date){
clean_date <- excel_numeric_to_date(as.numeric(i))
#print(clean_date)
f1_date <- c(f1_date, clean_date)
}
print(f1_date)
#clean_date <- excel_numeric_to_date(i)