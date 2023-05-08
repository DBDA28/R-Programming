#Setting the working directory
setwd("F:/DBDA/R_Programming/day1/Datasets/Datasets")
cars93 <- read.csv("F:/DBDA/R_Programming/day1/Datasets/Datasets/Cars93.csv")
dim(cars93)
str(cars93)

#loading the strings as factors
autocoll <- read.csv(("AutoCollision.csv") , stringsAsFactors = T)
dim(autocoll)
str(autocoll)

#Preventing R from using first line as header
bolly <- read.csv("Bollywood_2015_2.csv", header=F)
colnames(bolly) <- c("movies","BO","Budget","Verdict")


#Changing the separator for csv and decimal character convention
Dia <- read.csv("Diamonds.csv", sep=";", dec=",")
#or
dia <- read.csv2("Diamonds.csv")

#Suppressing the warning " incomplete final line found by readTableHeader on 'members.txt'" and reading the data by skipping ther first row
#or add an empty line at the end in the data file
mem <- suppressWarnings(read.csv("members.txt",sep=" ",skip=1))

#reading excel file
install.packages("tidyverse")
library("readxl")
brupt <- read_excel("bankruptcy.xlsx",sheet='data')

#loading the data from excel by providing the range
qual1 <- read_excel("quality.xlsx",sheet='quality',
                    range='A1:D6')

qual2 <- read_excel("quality.xlsx",sheet='quality',
                    range='H1:J6')

#write data frame to csv file
write.csv(qual2, "qual2.csv",row.names = F)

#write data from to xlsx file
library(writexl)
write.xls(qual2,"qual2.xlsx")

#sub-setting a vector
x <- c(12,23,52,78,90,10,26,93,92,95,79)

#elements 1 to 5
x[1:5]

#elements greater than 50
x[x>50]

#sub-setting a matrix
m <- matrix(c(1:12),4,3);m
m[3,2]
m[2,]
m[,3]
m[,3,drop=F]

#sub-setting data-frame AKA slicing
autocoll[5,]
autocoll[1:5,]
autocoll[20:25,]
autocoll[,3:4]

#Filtering data frame
ss <- subset(autocoll, Vehicle_Use == 'Business');ss
ss2 <- subset(autocoll, Claim_Count > 400);ss2
ss3 <- subset(autocoll, Age=='A' & Severity > 500);ss3
ss4 <- subset(autocoll, Age=='A' & Severity > 500);ss4

ss_cars <- subset(cars93, Type=='Small' & Price>10, select =c(Manufacturer,Model,Price,Origin));ss_cars


#Lab Exercises
#Q1.
odr <- read.csv("Orders.csv", stringsAsFactors = T)
odrs <- subset(odr, Payment.Terms == 'Online'); odrs

#Q2.
data("mtcars")
write.csv(mtcars,"mtcars.csv")                  

#Q3
dia <- read.csv2("Diamonds.csv")
dd <- subset(dia, cut=='Premium' & color=='J');dd

#Q4
dd2 <- data.frame(dia$carat,dia$color,dia$depth,dia$price);dd2

#Q5
mm <- read.csv("mtcars.csv")
mm2 <- mm[c(2,18,30,12),];mm2


### Tidyverse
library(tidyverse)
tbl_mtcars <- as_tibble(mtcars)
class(tbl_mtcars)

s_autoc <- arrange(autocoll, Claim_Count)
s_autoc <- arrange(autocoll, desc(Claim_Count));s_autoc

#magrittr
ssutoc <-  autocoll %>% arrange(Claim_Count)
s_autoc <- arrange(autocoll, Vehicle_Use, Severity)
s_autoc <- arrange(autocoll, Vehicle_Use, desc(Severity));s_autoc

#Selecting
ss_cars <- select(cars93,1:4);ss_cars
ss_cars <- select(cars93,Model:Price);ss_cars
ss_cars <- select(cars93, contains("en"));ss_cars

#filter
filter(cars93, Manufacturer %in% c("Acura","Audi"))
cars93$Manufacturer





  









