#rm(list=ls())
dane <- read.csv2("C:/Users/Daniel/Desktop/projekt_lot/lot_satysfakcja2.csv", header = TRUE, stringsAsFactors = FALSE)

#sprawdzenie czy są braki danych
sum(is.na(dane)) # liczba nulli
which(apply(is.na(dane), 2, any)==T)

#braki danych zmiennej Arrival_Delay_in_Minutes 393

median(dane$Arrival_Delay_in_Minutes, na.rm=TRUE) #0
dane$Arrival_Delay_in_Minutes[is.na(dane$Arrival_Delay_in_Minutes)] = median(dane$Arrival_Delay_in_Minutes, na.rm=TRUE)

levels(dane$Arrival_Delay_in_Minutes)
sum(is.na(dane))
summary(dane$Arrival_Delay_in_Minutes)


#kategoryzacja zmiennej zależnej
dane$satisfaction[dane$satisfaction=="dissatisfied"] <- 0
dane$satisfaction[dane$satisfaction=='satisfied' ] <- 1

typeof(dane$satisfaction)
dane$satisfaction<- as.numeric_version(dane$satisfaction)



wykres_y <- ggplot(dane, aes(factor(satisfaction)), main="Wykres liczebności zmiennej zależnej") 
wykres_y2<-wykres_y + geom_bar() +scale_x_discrete(name="Satisfaction")+
        scale_y_continuous(name="ilość")
View(wykres_y2)

#kategoryzacja zmiennych zależnych binarnych
 #1. Gender
 dane$Gender[dane$Gender=='Male'] <- 0
 dane$Gender[dane$Gender=='Female'] <- 1
 #2. Customer_Type
 dane$Customer_Type[dane$Customer_Type=='disloyal Customer'] <-0
 dane$Customer_Type[dane$Customer_Type=='Loyal Customer'] <- 1
 #3. Type_of_Travel
 dane$Type_of_Travel[dane$Type_of_Travel=='Personal Travel'] <- 0
 dane$Type_of_Travel[dane$Type_of_Travel=='Business travel'] <- 1
 table (dane$Type_of_Travel)

 
 #przetwarzanie zmiennych porządkowych
 # 1. Seat_comfort
 dane$Seat_comfort[dane$Seat_comfort==0 | dane$Seat_comfort==1 | dane$Seat_comfort==2] <- 0
 dane$Seat_comfort[dane$Seat_comfort==3 | dane$Seat_comfort==4 | dane$Seat_comfort==5] <- 1
 
 #2.Departure_Arrival_time_convenient
 dane$Departure_Arrival_time_convenient[dane$Departure_Arrival_time_convenient==0 | dane$Departure_Arrival_time_convenientt==1 | dane$Departure_Arrival_time_convenient==2] <- 0
 dane$Departure_Arrival_time_convenient[dane$Departure_Arrival_time_convenient==3 | dane$Departure_Arrival_time_convenient==4 | dane$Departure_Arrival_time_convenient==5] <- 1
 
 #3.Food_and_drink
 dane$Food_and_drink[dane$Food_and_drink==0 | dane$Food_and_drink==1 | dane$Food_and_drink==2] <- 0
 dane$Food_and_drink[dane$Food_and_drink==3 | dane$Food_and_drink==4 | dane$Food_and_drink==5] <- 1
 
 #4.Gate_location
 dane$Gate_location[dane$Gate_location==0 | dane$Gate_location==1 | dane$Gate_location==2] <- 0
 dane$Gate_location[dane$Gate_location==3 | dane$Gate_location==4 | dane$Gate_location==5] <- 1
 
 #5.Inflight_wifi_service
 dane$Inflight_wifi_service[dane$Inflight_wifi_service==0 | dane$Inflight_wifi_service==1 | dane$Inflight_wifi_service==2] <- 0
 dane$Inflight_wifi_service[dane$Inflight_wifi_service==3 | dane$Inflight_wifi_service==4 | dane$Inflight_wifi_service==5] <- 1
 
 #6.Inflight_entertainment
 dane$Inflight_entertainment[dane$Inflight_entertainment==0 | dane$Inflight_entertainment==1 | dane$Inflight_entertainment==2] <- 0
 dane$Inflight_entertainment[dane$Inflight_entertainment==3 | dane$Inflight_entertainment==4 | dane$Inflight_entertainment==5] <- 1
 
 #7.Online_support
 dane$Online_support[dane$Online_support==0 | dane$Online_support==1 | dane$Online_support==2] <- 0
 dane$Online_support[dane$Online_support==3 | dane$Online_support==4 | dane$Online_support==5] <- 1
 
 #8.Ease_of_Online_booking
 dane$Ease_of_Online_booking[dane$Ease_of_Online_booking==0 | dane$Ease_of_Online_booking==1 | dane$Ease_of_Online_booking==2] <- 0
 dane$Ease_of_Online_booking[dane$Ease_of_Online_booking==3 | dane$Ease_of_Online_booking==4 | dane$Ease_of_Online_booking==5] <- 1
 
 #9.On_board_service
 dane$On_board_service[dane$On_board_service==0 | dane$On_board_service==1 | dane$On_board_service==2] <- 0
 dane$On_board_service[dane$On_board_service==3 | dane$On_board_service==4 | dane$On_board_service==5] <- 1
 
 #10.Leg_room_service
 dane$Leg_room_service[dane$Leg_room_service==0 | dane$Leg_room_service==1 | dane$Leg_room_service==2] <- 0
 dane$Leg_room_service[dane$Leg_room_service==3 | dane$Leg_room_service==4 | dane$Leg_room_service==5] <- 1
 
 #11.Baggage_handling
 dane$Baggage_handling[dane$Baggage_handling==0 | dane$Baggage_handling==1 | dane$Baggage_handling==2] <- 0
 dane$Baggage_handling[dane$Baggage_handling==3 | dane$Baggage_handling==4 | dane$Baggage_handling==5] <- 1
 
 #12.Checkin_service
 dane$Checkin_service[dane$Checkin_service==0 | dane$Checkin_service==1 | dane$Checkin_service==2] <- 0
 dane$Checkin_service[dane$Checkin_service==3 | dane$Checkin_service==4 | dane$Checkin_service==5] <- 1
 
 #13.Cleanliness
 dane$Cleanliness[dane$Cleanliness==0 | dane$Cleanliness==1 | dane$Cleanliness==2] <- 0
 dane$Cleanliness[dane$Cleanliness==3 | dane$Cleanliness==4 | dane$Cleanliness==5] <- 1
 
 #14.Online_boarding
 dane$Online_boarding[dane$Online_boarding==0 | dane$Online_boarding==1 | dane$Online_boarding==2] <- 0
 dane$Online_boarding[dane$Online_boarding==3 | dane$Online_boarding==4 | dane$Online_boarding==5] <- 1
 
 #15.Class
 dane$Class[dane$Class=='Eco'] <- 0
 dane$Class[dane$Class=='Eco Plus'] <- 1
 dane$Class[dane$Class=='Business'] <- 2
 
 View(dane)
 
 typeof(dane$satisfaction)
 dane$satisfaction<- as.numeric(dane$satisfaction)
 typeof(dane$Gender)
 dane$Gender<- as.numeric(dane$Gender)
 typeof(dane$Customer_Type)
 dane$Customer_Type<- as.numeric(dane$Customer_Type)
 typeof(dane$Class)
 dane$Class<- as.numeric(dane$Class)
 typeof(dane$Type_of_Travel)
 dane$Type_of_Travel<- as.numeric(dane$Type_of_Travel)
 


 #korelacja
 dane_kor <- subset(dane, select = c( 'Gender', 'Customer_Type', 'Age',
                                          'Type_of_Travel' , 'Class' ,
                                          'Flight_Distance', 'Seat_comfort',
                                          'Departure_Arrival_time_convenient',
                                          'Food_and_drink', 'Gate_location', 'Inflight_wifi_service',
                                          'Inflight_entertainment', 'Online_support',
                                          'Ease_of_Online_booking', 'On_board_service',
                                          'Leg_room_service', 'Baggage_handling',
                                          'Checkin_service', 'Cleanliness', 'Online_boarding',
                                          'Departure_Delay_in_Minutes', 'Arrival_Delay_in_Minutes'))
 
 korelacja<-cor(dane_kor)
 View(korelacja)
 
 #usunięcie zmiennych wykluczonych w korelacji
 dane2 <- subset(dane, select = c( 'satisfaction', 'Gender', 'Customer_Type', 'Age',
                                       'Class' ,
                                      'Flight_Distance', 'Seat_comfort',
                                      'Departure_Arrival_time_convenient',
                                       'Inflight_wifi_service',
                                       'On_board_service',
                                      'Checkin_service',  
                                      'Departure_Delay_in_Minutes'))
 #sprawdzenie wspóliniowości VIF
 
# install.packages("car")
 library(car)
 #wspóliniowość zmiennych
 model_glm<-glm(satisfaction~.,family=binomial(),data=dane2)
 summary(model_glm)
 vif<-vif(model_glm)
View(vif)



r2_mf<-model_glm$null.deviance/-2
r2_mf2<-model_glm$deviance/-2

#pseudo r kwadrat
(r2_mf-r2_mf2)/r2_mf



#ilorazy szans 
require(MASS)
or<-exp(cbind(coef(model_glm), confint(model_glm)))
View(or)
write.csv2(or, file = "odds_ratio.csv")

#przedzialy ufnosci
#library(MASS)
#przedzialy<-confint(model_glm)
#View(przedzialy)

#szanse<-exp(coef(model_glm))
#View(szanse)

durbinWatsonTest(glm(satisfaction~., family=binomial(link="logit"),data=dane2))

  
