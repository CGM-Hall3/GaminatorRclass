a <- c(6, 10, 12, 3, 1)
b <- c(4, 13, 8,9, 5)
d <- a-b
#print(d)
sum_d <- 0
for (i in d){
  sum_d <- i + sum_d
}
#print(sum_d)
mean_d <- sum_d/length(d)
#print(mean_d)
std_arr <- c()
for (i in d){
  k <- i - mean_d
  std_arr <- c(std_arr, (k**2))
}
#print(std_arr)
std_sum <- 0
for (i in std_arr){
  std_sum <- i + std_sum
}
print(std_sum)

std_dev <- (std_sum/length(d)) **(1/2)
print(std_dev)


max_b <- b[1]
for (i in b){
  if (i > max_b)
    max_b = i
}
print(max_b)

sum_a <- 0
for (i in a){
  sum_a <- i + sum_a
}
print(sum_a)
mean_a <- sum_a/length(a)

q_ans <- mean_a/max_b
print(q_ans)


d <- c('jamie', 'kate', 'pogba')
t <- c('kate', 'john', 'jamie')
`%!in%` <- Negate(`%in%`)
for (i in d){
  if (i %!in% t){
   l <-  nchar(i)
   print(l)
  }
}




y <- d[!(d %in% t)]
for (i in y){
  print(nchar(i))
}

value <- readline(prompt="Enter your number: ")
value2 <- readline(prompt="Enter second number: ")
print(as.integer(value) + as.integer(value2))

arr <- c()
range_arr <- as.integer(readline(prompt="enter range for array: "))
for (i in 1:range_arr){
  enter_val <- as.integer(readline(prompt="Enter value for array: "))
  arr <- c(arr, enter_val)
}
print(arr)


perm <- readline(prompt="enter value: ")
count <- nchar(perm)
def_count <- 1
for (i in 1:count){
  def_count <- i * def_count
}
print(paste(perm, "can be arranged", def_count, "times", sep=" "))


temp <- as.numeric(readline(prompt="enter temperature value: "))
unit <- tolower(readline(prompt="enter unit(F/C): "))
if (unit == 'f'){
  celcius <- (9/5) * (temp - 32)
  print(paste("the temperature value is ", celcius, "degrees celcius", sep=" "))
} else if (unit == 'c'){
  fahr <- (5/9) *(temp + 32)
  print(paste("the temperature value is ", fahr, "degrees fahrenheit", sep = " "))
} else {
  print("invalid input!!")
}


range_max <- as.integer(readline(prompt = 'eneter max range: '))
arr_val <- c()
for (i in 1:range_max){
  arr_val <- c(arr_val, readline(prompt="enter array values: "))
}

for (i in arr_val){
  k <- 1
  b <- nchar(i)
  for (n in 1:b){
    k <- k * n
  }
  print(paste("the permutation of ", i, "is", k, sep=" "))
}













