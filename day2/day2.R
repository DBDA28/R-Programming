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

#Suppressing the warining " incomplete final line found by readTableHeader on 'members.txt'" and reading the data by skipping ther first row
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