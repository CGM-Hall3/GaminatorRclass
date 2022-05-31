install.packages('readr')

library('readr')

path_data <- "C:/Users/USER/Downloads/Iris.csv"
#"C:\Users\USER\Downloads\Iris.csv"
df_table <- read_csv(path_data)
#print(df_table)
View(df_table)
class(df_table)
head(df_table)
for (i in colnames(df_table)){
  print(i)
}
ncol(df_table)
nrow(df_table)
