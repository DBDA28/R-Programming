install.packages('XML')
library(XML)
filePath <- ("F:/DBDA/R_Programming/day1/Datasets/Datasets/foods.xml")
document <- xmlTreeParse(filePath,useInternalNodes = T)
rootNode <- xmlRoot(document)
names(rootNode)
class(rootNode)

rootNode[1]
rootNode[[1]]

#xml to dataframe
library(xml2)
food <-  read_xml(filePath)
xml_root(food)
xml_length(food)
xml_children(food)

xml_child(food, search=4)

obs <- xml_child(food, search=4)
des <- xml_child(obs,"description")
xml_contents(des)

library(magrittr)
food %>% xml_child(search =4) %>%
        xml_child("description") %>%
  xml_contents()

food %>% xml_child(search =3) %>%
       xml_child("price") %>%
  xml_contents()

#or alternative to magrittr operator is |> which does not require the magrittr library
food |> xml_child(search =3) |>
       xml_child("price") |>
  xml_contents()

##writing to XML
setwd("F:/DBDA/R_Programming/day1/Datasets/Datasets")
install.packages("MESS")
library(MESS)
write.xml(mtcars,"mtcar.xml")

#accessing the data from json file
install.packages("jsonlite")
library(jsonlite)
jsonData <-  fromJSON("contacts.txt")
class(jsonData)
names(jsonData)

#nested objects
jsonData$phoneNumber
class(jsonData$phoneNumber)
jsonData$phoneNumber$number

#Convert data frames into JSON
mt_JSON <-  toJSON(mtcars)
mt_JSON
mt_DS <- fromJSON(mt_JSON) 
mt_DS

#Exercise
jsonData <- fromJSON("GB_category_id.json")
class(jsonData)
names(jsonData)
jsonData$kind
jsonData$etag


#Graphics and plotting in R
some_bar <- c(3412,434,556,76,3)
barplot(some_bar)

cars93 <- read.csv("cars93.csv")
table(cars93$Type)
barplot(table(cars93$Type),col="pink", horiz=F) 
barplot(table(cars93$Price.Category),col="lightgreen", horiz=T) 
barplot(table(cars93$Type),
        main="Types of Cars",
        col="darksalmon")

#Histogram
hist(cars93$Price,col="steelblue1")
plot(cars93$Price,cars93$MPG.city,
     main="Price vs MPG",
     xlab="Price",
     ylab="mileage in city")

#line graph
gasoline <- read.csv("Gasoline.csv")
plot(gasoline$Week,gasoline$Sales, xlab="week",ylab="sales",type="b",col="darkred")

#Box-plot 
boxplot(cars93$Price,col = "steelblue")
boxplot(cars93$Price ~ cars93$Type,col ="powderblue")

#ggplot2
#facet groups the scatter plot by AirBags
library(ggplot2)
ggplot(data=cars93,aes(x=Price, y=MPG.city,col=AirBags))+
  geom_point()+facet_grid(~AirBags)+labs(x="Price",y="Mileage City")

ggplot(data=cars93,aes(x=Price, y=MPG.city,col=AirBags))+
  geom_point()+geom_smooth(method="lm",se=F)+labs(x="Price",y="Mileage City")

#Box-plot with ggplot
ggplot(data = cars93,aes(x=Type,y=Price,fill=Type))+geom_boxplot()
ggplot(data = cars93,aes(x=AirBags,y=Price,fill=AirBags))+facet_grid(~AirBags)+geom_boxplot()

#Histogram with ggplot
ggplot(data = cars93,aes(x=Price))+geom_histogram(bins=10,fill="black",color="lightgreen")
ggplot(data = cars93,aes(x=Price))+geom_histogram(binwidth=5,fill="black",color="lightgreen")

#Bar plot with ggplot
ggplot(data = cars93,aes(x=Type,fill="salmon"))+geom_bar()
ggplot(data = cars93,aes(x=DriveTrain,fill=DriveTrain))+geom_bar()

#stacked bar
ggplot(data = cars93,aes(x=Type,fill=AirBags))+geom_bar()

#non stacked bar(readable)
ggplot(data = cars93,aes(x=Type,fill=AirBags))+geom_bar(position = 'dodge')

library(dplyr)
sum_car <- cars93 %>% 
  group_by(AirBags) %>% 
  summarise(avg_price=mean(Price,na.rm=T))

ggplot(data=sum_car,
       aes(x=AirBags,y=avg_price,fill=AirBags))+
  geom_bar(stat='identity')

sum_car <- cars93 %>% 
  group_by(DriveTrain) %>% 
  summarise(avg_price=mean(Price,na.rm=T))

ggplot(data=sum_car,
       aes(x=DriveTrain,y=avg_price,fill=DriveTrain))+
  geom_bar(stat='identity')

ggplot(data=cars93,
        aes(x=Price,y=MPG.city, size=EngineSize))+
          geom_point(color="rosybrown3",alpha=0.4)

#Theme
sum_car <- cars93 %>% 
  group_by(AirBags) %>% 
  summarise(avg_price=mean(Price,na.rm=T))

ggplot(data=sum_car,
       aes(x=AirBags,y=avg_price,fill=AirBags))+
  geom_bar(stat="identity")+theme_void()
