print("hello world!!!!!")

v <- c(6, 6.7, 10, 15, 12.5, 8)

sum_v <- 0
for (i in v){
  sum_v <- i + sum_v
}

mean_value <- sum_v/length(v)
print(mean_value)


s_tring <- "james"
print(nchar(s_tring))

t_vector <- c("kate", "moyes", "judah", "lenin")
#print(length(t_vector))
for (i in t_vector){
  print(nchar(i))
}


data_set <- c(4, 10, 12, 13, 5, 8.9, 1.4, 1.3)
n <- length(data_set)

sum_data <-0
for (i in data_set){
  sum_data <- i + sum_data
}

mean_data <- sum_data/n

data_i <- c()
for (i in data_set){
  a <- i - mean_data
  data_i <- c(data_i, (a **2))
}


sum_idata <-0
for (i in data_i){
  sum_idata <- i + sum_idata
}

std_dev <- (sum_idata/n)**(1/2)
print(std_dev)


t <- c(3, 10, 22, 11, 8, 12)
min_val <- t[1]
for (i in t){
  if (i < pos_val){
    pos_val <- i
    
  }
}
print(min_val)









