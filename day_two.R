print('hello')

name <- "cynthia"
index_val <- substr(name, 1, 1)
print(index_val)

name_v <- c("janeth", "kola", "nemii", "bolaji")
new_names <- c()
for (i in name_v){
  y <- substr(i, 1,1)
  b <- substr(i, 2, nchar(i))
  cap <- toupper(y)
  fullname <- paste(cap, b, sep="")
  new_names <- c(new_names, fullname)
}
print(new_names)



f_name <- c("jamie", "kurt", "gerald")
last_name <- c("matt", "boolean", "celcius")

if (length(f_name) == length(last_name)){
  for (i in 1:length(f_name)){
    full_name <- paste(f_name[i], last_name[i], sep=" ")
    print(full_name)
  }
} else {
  print("no you cant!!!")
}


array <- c(3, 5, 1, 9, 2, 10, 11)
new_array <- sort(array)
mid <- length(new_array)/2
index <- round(mid)
a_index <- index + 1
if (length(array)%%2!=0){
med <- new_array[index]
print(new_array)
print(paste("the median of the list is", med, sep=" "))
} else if (length(array)%%2==0) {
  med <- (new_array[index] + new_array[a_index])/2
  print(new_array)
  print(paste("the median of the list is", med, sep=" "))
} else {
  print("array cant be manipulated!!")
}


