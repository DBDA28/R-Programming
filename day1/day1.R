p <- 5000
r <- 8
t <- 2
si <- p*r*t/100
si
ls()
data('airquality')
d <- c(3.5, 0.9, 2.4, 12.5)
d
class(d)
f <- c("a","wer","ft")
class(f)
d*2

# simple interest calc with the help of vectors
principal_vec <- c(14000, 100000, 25000, 50000)
time_vec <- c(1,2,3,5,6)
rate_vec <- c(8,9,10,11)
print(si <- principal_vec*rate_vec*time_vec/100)
class(si)
length(si)

#list datatype in R
tg <- list(34,'sd',T)
class(tg)
tg*3

#factor datatype in R 
#it is generally used for storing categorically data
#One can think of factor as an integer vector where each integer has a label
s <- c('a','b','b','s','a')
print(sf <- factor(s))
class(s)

print(g <- c(3,'a','d',3,'e',4))
class(g)
print(gf <-  factor(g))


#Missing values
f <- NA
is.na(f)

x <- c(34,NA,42,42,NA,423)
is.na(x)
#Returns the sum of 'NA' in the vector x
sum(is.na(x))

#Airquality
data('airquality')
class(airquality)
#counting the missing values in columns Ozone, Solar.R, Wind
sum(is.na(airquality$Ozone))
sum(is.na(airquality$Solar.R))
sum(is.na(airquality$Wind))
sum(is.na(airquality$Temp))

#Not a Number
d <- 0
e <- 0
w <- d/e
is.nan(w)
is.na(w)

#Some infinities are bigger than other infinities
d <- 49
e <- 0
w <- d/e
is.infinite(w)
is.finite(w)

#Binding
a <- c(3,5,6,12)
b <- c(0,2,2.3,12)

rbind(a,b)
cbind(a,b)

#Matrix
print(mat <- matrix(10,3,2))
print(mat2 <- matrix(c(2,3,2,4,2,4),3,2))
print(mat3 <- matrix(c(2,4,3,2,2,4),3,3, byrow = T))

#Data Frame
a <- c(3,5,6,2)
b <- c(2,2,3,5)
print(ds <- data.frame(a,b))

#Importing from csv
A <- read.csv("F:/DBDA/R_Programming/day1/Datasets/Datasets/A.csv")
path <- file.path("F:","DBDA","R_Programming","day1","Datasets","Datasets","A.csv")
A <- read.csv(path)
colnames(A)
str(A)
dim(A)

w <- list(a=c(3,4,1), b=c("q","k"),c=c(1,2,3,5,7))
colnames(w)

#elements
names(w)

#accessing the elements of w
w$a
w$b
w$c
