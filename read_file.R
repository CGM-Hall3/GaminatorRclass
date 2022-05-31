install.packages('readr')

library('readr')

path_data <- "/c/Users/USER/Downloads/Iris.csv"
df_table <- read_csv(path_data)
print(df_table)
