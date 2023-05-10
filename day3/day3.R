setwd("F:/DBDA/R_Programming/day1/Datasets/Datasets")
cars93 <- read.csv("Cars93.csv")
library(dplyr)
cars93_1 = rename(cars93, Minimum=Min.Price)
cars93_1

cars93ranger = cars93$Max.Price - cars93$Min.Price
#or
cars93_2 <- mutate(cars93,range=Max.Price  -Min.Price);cars93_2





summarise(cars93,avg_price = mean(Price, na.rm =T),
                  sd_price = sd(Price,na.rm = T))

grp_cars93 <- group_by(cars93,Type)
summarise(grp_cars93, avg_price = mean (Price, na.rm =T),
          sd_price = sd(Price, na.rm = T))

cars93 %%
  group_by(Type) %%
  summarise(avg_price = mean(Price, na.rm=T),
            sd_price = sd(Price, na.rm= T))


##Exercise

#Q1
survey <-  read.csv('survey.csv', stringsAsFactors = T);survey
malenonsmokers <- filter(survey, Smoke %in% c("Never"), Sex %in% c("Male"));malenonsmokers

#Q2
#our solution
pulsegt80 <- survey %>% filter(Pulse > 80) 
dd <- data.frame(pulsegt80$Sex,pulsegt80$Exer,pulsegt80$Pulse,pulsegt80$Smoke)
#or
#teacher's solution
Pulsegt80 <-  survey %>% filter(Pulse > 80) %>% select(Sex, Exer, Smoke, Pulse)

#Q3
RtHand <- survey %>%
            mutate(Ratio_Hnd = Wr.Hnd / NW.Hnd) %>%
              select(Ratio_Hnd, Clap, Age)

#Q4
DecStats <- survey %>% 
              summarise(avg_age = mean(Age),
                sd_age = sd(Age))
#Q5
DecGrp <- survey %>%
            group_by(Sex) %>%
              summarise(avg_age=mean(Age),
                sd_age = sd(Age))

#
item <- read.csv("Items.csv")
order <- read.csv("Orders.csv")
details <- read.csv("Ord_Details.csv")
df <- inner_join(order, details, by='Order.ID')
comb_df <- inner_join(item,df,by='Item.ID')

#or
combo_df2 <- order %>%
                inner_join(details, by='Order.ID') %>%
                  inner_join(item, by='Item.ID')

#Gathering and spreading
library(tidyr)
tab <-  table4a
gather(table4a, `1999`,`2000`,key='year', value="cases") #back ticks are in the data for year
#or
table4a %>% gather(`1999`,`2000`, key='year',value='cases')
#or
table4a %>% gather(-country, key='year',value='cases')

#Gathering and spreading for table4b
#although gather function will be soon deprecated
tab1 <- table4b
gather(table4b, `1999`,`2000`,key='year',value='population')
#or
table4b %>% gather(-country,key='year',value='population')

table4b %>% pivot_longer(-country, names_to="year", values_to = "population")

#Spreading
#spread is soon to be deprecated
table2 %>% spread(key="type",value="count")

table2 %>% pivot_wider(names_from="type",values_from = "count")

#Separate
table3
#by default uses the separator
table3 %>% separate(rate, into = c('case','population'),convert = T)

#Unite
table5
table5 %>% unite(new_col, century, year, sep = "")

                    