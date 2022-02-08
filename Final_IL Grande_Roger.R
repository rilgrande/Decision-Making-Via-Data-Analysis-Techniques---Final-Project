
# Roger IL Grande
# EM-622 Final Project - NFL Quarterbacks Comparison


# Load the necessary libraries
library(lubridate)
library(tidyr)
library(dplyr)
library(ggplot2)
library(plyr)
library(reshape)
library(tidyquant)

# Set working directory
setwd("~/Documents/R Projects")


# Vertical Bar Chart showing total sacks plus hits data for the four quarterbacks over 16 games segments of the sampled 48 games

RoethlisbergerData <- read.csv("Big Ben.csv", header = TRUE) # Import Ben Roethlisberger Advanced Passing Stats
BradyData <- read.csv("Brady.csv", header = TRUE) # Import Tom Brady Advanced Passing Stats
RodgersData <- read.csv("Rodgers.csv", header = TRUE) # Import Aaron Rodgers Advanced Passing Stats
WilsonData <- read.csv("Wilson.csv", header = TRUE) # Import Russel Wilson Advanced Passing Stats


# Subset data for Ben sacks and hits by year
Ben_Sacks_Hits <- subset(RoethlisbergerData, select = c("Year", "Sk", "Hits"))
Ben_Sacks_Hits <- Ben_Sacks_Hits[1:45,]

# Subset data for Brady sacks and hits by year
Brady_Sacks_Hits <- subset(BradyData, select = c("Year", "Sk", "Hits"))
Brady_Sacks_Hits <- Brady_Sacks_Hits[1:48,]

# Subset data for Rodgers sacks and hits by year
Rodgers_Sacks_Hits <- subset(RodgersData, select = c("Year", "Sk", "Hits"))
Rodgers_Sacks_Hits <- Rodgers_Sacks_Hits[1:48,]

# Subset data for Wilson sacks and hits by year
Wilson_Sacks_Hits <- subset(WilsonData, select = c("Year", "Sk", "Hits"))
Wilson_Sacks_Hits <- Wilson_Sacks_Hits[1:48,]



Ben_Sacks_Hits$Ben_Sk_Hits <- Ben_Sacks_Hits$Sk + Ben_Sacks_Hits$Hits # Sum sacks plus hits

Ben_Sacks_Hits[1:16, 1:1] <- "Season 1" # select rows and columns
Ben_Sacks_Hits[17:32, 1:1] <- "Season 2" # select rows and columns
Ben_Sacks_Hits[33:45, 1:1] <- "Season 3" # select rows and columns
Ben_Sacks_Hits[nrow(Ben_Sacks_Hits) + 1,] = c("Season 3", 0, 0, 0) # Fill in missing data to remain consistent with other players at 48 rows
Ben_Sacks_Hits[nrow(Ben_Sacks_Hits) + 1,] = c("Season 3", 0, 0, 0)
Ben_Sacks_Hits[nrow(Ben_Sacks_Hits) + 1,] = c("Season 3", 0, 0, 0)



Brady_Sacks_Hits$Brady_Sk_Hits <- Brady_Sacks_Hits$Sk + Brady_Sacks_Hits$Hits # Sum sacks plus hits

Brady_Sacks_Hits[1:16, 1:1] <- "Season 1" # select rows and columns
Brady_Sacks_Hits[17:32, 1:1] <- "Season 2" # select rows and columns
Brady_Sacks_Hits[33:48, 1:1] <- "Season 3" # select rows and columns


Rodgers_Sacks_Hits$Rodgers_Sk_Hits <- Rodgers_Sacks_Hits$Sk + Rodgers_Sacks_Hits$Hits # Sum sacks plus hits

Rodgers_Sacks_Hits[1:16, 1:1] <- "Season 1" # select rows and columns
Rodgers_Sacks_Hits[17:32, 1:1] <- "Season 2" # select rows and columns
Rodgers_Sacks_Hits[33:48, 1:1] <- "Season 3" # select rows and columns


Wilson_Sacks_Hits$Wilson_Sk_Hits <- Wilson_Sacks_Hits$Sk + Wilson_Sacks_Hits$Hits # Sum sacks plus hits

Wilson_Sacks_Hits[1:16, 1:1] <- "Season 1" # select rows and columns
Wilson_Sacks_Hits[17:32, 1:1] <- "Season 2" # select rows and columns
Wilson_Sacks_Hits[33:48, 1:1] <- "Season 3" # select rows and columns


# Calculate the sums of number of sacks + hits for each season and each player

Ben_Season_1 <- sum(as.integer(Ben_Sacks_Hits[1:16, 4:4])) # Ben Roethlisberger
Ben_Season_2 <- sum(as.integer(Ben_Sacks_Hits[17:32, 4:4]))
Ben_Season_3 <- sum(as.integer(Ben_Sacks_Hits[33:48, 4:4]))
Roethlisberger <- c(Ben_Season_1, Ben_Season_2, Ben_Season_3)

Brady_Season_1 <- sum(as.integer(Brady_Sacks_Hits[1:16, 4:4])) # Tom Brady
Brady_Season_2 <- sum(as.integer(Brady_Sacks_Hits[17:32, 4:4]))
Brady_Season_3 <- sum(as.integer(Brady_Sacks_Hits[33:48, 4:4]))
Brady <- c(Brady_Season_1, Brady_Season_2, Brady_Season_3)

Rodgers_Season_1 <- sum(as.integer(Rodgers_Sacks_Hits[1:16, 4:4])) # Aaron Rodgers
Rodgers_Season_2 <- sum(as.integer(Rodgers_Sacks_Hits[17:32, 4:4]))
Rodgers_Season_3 <- sum(as.integer(Rodgers_Sacks_Hits[33:48, 4:4]))
Rodgers <- c(Rodgers_Season_1, Rodgers_Season_2, Rodgers_Season_3)

Wilson_Season_1 <- sum(as.integer(Wilson_Sacks_Hits[1:16, 4:4])) # Russel Wilson
Wilson_Season_2 <- sum(as.integer(Wilson_Sacks_Hits[17:32, 4:4]))
Wilson_Season_3 <- sum(as.integer(Wilson_Sacks_Hits[33:48, 4:4]))
Wilson <- c(Wilson_Season_1, Wilson_Season_2, Wilson_Season_3)

Seasons <- c("Season 1", "Season 2", "Season 3")

# Create a data frame that summarizes all of these totals from above

All_Sacks_Hits <- data.frame(Season=c('Season 1', 'Season 2', 'Season 3'),
                 Player=c('Roethlisberger', 'Brady', 'Rodgers', 'Wilson'),
                 Sacks_Hits=c(Roethlisberger, Brady, Rodgers, Wilson))


ggplot(All_Sacks_Hits, aes(fill=Player, y=Sacks_Hits, x=Season)) + 
  geom_bar(position='dodge', stat='identity') + labs(title = "Total Sacks + Hits by Season", x = "Season", y = "Sacks + Hits") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(breaks=seq(0,120,12))
  




# Create pie charts for passing vs running yards gained by each of the five team's offenses during these games

Steelers_2018_Data <- read.csv("Steelers_Stats_2018.csv", header = TRUE) # Import for Roethlisberger
Steelers_2019_Data <- read.csv("Steelers_Stats_2019.csv", header = TRUE) # Import for Roethlisberger
Steelers_2020_Data <- read.csv("Steelers_Stats_2020.csv", header = TRUE) # Import for Roethlisberger
Steelers_2021_Data <- read.csv("Steelers_Stats_2021.csv", header = TRUE) # Import for Roethlisberger
Patriots_2018_Data <- read.csv("Patriots_Stats_2018.csv", header = TRUE) # Import for Brady
Patriots_2019_Data <- read.csv("Patriots_Stats_2019.csv", header = TRUE) # Import for Brady
Bucs_2020_Data <- read.csv("Bucs_Stats_2020.csv", header = TRUE) # Import for Brady
Packers_2018_Data <- read.csv("Packers_Stats_2018.csv", header = TRUE) # Import for Rodgers
Packers_2019_Data <- read.csv("Packers_Stats_2019.csv", header = TRUE) # Import for Rodgers
Packers_2020_Data <- read.csv("Packers_Stats_2020.csv", header = TRUE) # Import for Rodgers
Seahawks_2018_Data <- read.csv("Seahawks_Stats_2018.csv", header = TRUE) # Import for Wilson
Seahawks_2019_Data <- read.csv("Seahawks_Stats_2019.csv", header = TRUE) # Import for Wilson
Seahawks_2020_Data <- read.csv("Seahawks_Stats_2020.csv", header = TRUE) # Import for Wilson


# Ben Roethlisberger team offense totals

Ben_Team_Total_Passing <- colSums(as.data.frame(Steelers_2018_Data$OffPassY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Steelers_2019_Data$OffPassY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Steelers_2020_Data$OffPassY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Steelers_2021_Data$OffPassY), na.rm = FALSE, dims = 1)

Ben_Team_Total_Passing <- as.integer(Ben_Team_Total_Passing)

Ben_Team_Total_Rushing <- colSums(as.data.frame(Steelers_2018_Data$OffRushY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Steelers_2019_Data$OffRushY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Steelers_2020_Data$OffRushY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Steelers_2021_Data$OffRushY), na.rm = FALSE, dims = 1)

Ben_Team_Total_Rushing <- as.integer(Ben_Team_Total_Rushing)

Ben_Team_Total_Yards <- Ben_Team_Total_Passing + Ben_Team_Total_Rushing

Ben_Team_Pass_Pct <- (Ben_Team_Total_Passing / Ben_Team_Total_Yards) * 100

Ben_Team_Rush_Pct <- (Ben_Team_Total_Rushing / Ben_Team_Total_Yards) * 100


# Tom Brady team offense totals

Brady_Team_Total_Passing <- colSums(as.data.frame(Patriots_2018_Data$OffPassY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Patriots_2019_Data$OffPassY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Bucs_2020_Data$OffPassY), na.rm = FALSE, dims = 1)

Brady_Team_Total_Passing <- as.integer(Brady_Team_Total_Passing)
           
Brady_Team_Total_Rushing <- colSums(as.data.frame(Patriots_2018_Data$OffRushY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Patriots_2019_Data$OffRushY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Bucs_2020_Data$OffRushY), na.rm = FALSE, dims = 1)

Brady_Team_Total_Rushing <- as.integer(Brady_Team_Total_Rushing)

Brady_Team_Total_Yards <- Brady_Team_Total_Passing + Brady_Team_Total_Rushing

Brady_Team_Pass_Pct <- (Brady_Team_Total_Passing / Brady_Team_Total_Yards) * 100

Brady_Team_Rush_Pct <- (Brady_Team_Total_Rushing / Brady_Team_Total_Yards) * 100


# Aaron Rodgers team offense totals

Rodgers_Team_Total_Passing <- colSums(as.data.frame(Packers_2018_Data$OffPassY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Packers_2019_Data$OffPassY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Packers_2020_Data$OffPassY), na.rm = FALSE, dims = 1)

Rodgers_Team_Total_Passing <- as.integer(Rodgers_Team_Total_Passing)

Rodgers_Team_Total_Rushing <- colSums(as.data.frame(Packers_2018_Data$OffRushY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Packers_2019_Data$OffRushY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Packers_2020_Data$OffRushY), na.rm = FALSE, dims = 1)

Rodgers_Team_Total_Rushing <- as.integer(Rodgers_Team_Total_Rushing)

Rodgers_Team_Total_Yards <- Rodgers_Team_Total_Passing + Rodgers_Team_Total_Rushing

Rodgers_Team_Pass_Pct <- (Rodgers_Team_Total_Passing / Rodgers_Team_Total_Yards) * 100

Rodgers_Team_Rush_Pct <- (Rodgers_Team_Total_Rushing / Rodgers_Team_Total_Yards) * 100


# Russel Wilson team offense totals

Wilson_Team_Total_Passing <- colSums(as.data.frame(Seahawks_2018_Data$OffPassY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Seahawks_2019_Data$OffPassY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Seahawks_2020_Data$OffPassY), na.rm = FALSE, dims = 1)

Wilson_Team_Total_Passing <- as.integer(Wilson_Team_Total_Passing)

Wilson_Team_Total_Rushing <- colSums(as.data.frame(Seahawks_2018_Data$OffRushY), na.rm = FALSE, dims = 1) +
  colSums(as.data.frame(Seahawks_2019_Data$OffRushY), na.rm = FALSE, dims = 1) + colSums(as.data.frame(Seahawks_2020_Data$OffRushY), na.rm = FALSE, dims = 1)

Wilson_Team_Total_Rushing <- as.integer(Wilson_Team_Total_Rushing)

Wilson_Team_Total_Yards <- Wilson_Team_Total_Passing + Wilson_Team_Total_Rushing

Wilson_Team_Pass_Pct <- (Wilson_Team_Total_Passing / Wilson_Team_Total_Yards) * 100

Wilson_Team_Rush_Pct <- (Wilson_Team_Total_Rushing / Wilson_Team_Total_Yards) * 100


# Make pie charts showing passing/rushing offensive breakdown

All_Yards_Summary = data.frame(Player <- c('Roethlisberger','Roethlisberger','Brady','Brady','Rodgers','Rodgers',
                             'Wilson', 'Wilson'),
                Offense <- c('Passing','Rushing','Passing','Rushing',
                            'Passing','Rushing','Passing','Rushing'),
                value <- c(Ben_Team_Pass_Pct, Ben_Team_Rush_Pct, Brady_Team_Pass_Pct, Brady_Team_Rush_Pct, Rodgers_Team_Pass_Pct, Rodgers_Team_Rush_Pct, Wilson_Team_Pass_Pct, Wilson_Team_Rush_Pct))

All_Yards_Summary$Player <- factor(All_Yards_Summary$Player)
All_Yards_Summary$Offense <- factor(All_Yards_Summary$Offense) 

ggplot(data=All_Yards_Summary, aes(x=" ", y=value, group=Offense, colour=Offense, fill=Offense)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) + 
  facet_grid(.~ Player) +
  theme_void()




# Make horizontal bar chart showing each quarterback's cumulative completion percentage in these games

Ben_Total_Pass_Completions <- sum(as.integer(RoethlisbergerData[1:45, 11:11])) # Roethlisberger total pass completions
Ben_Total_Pass_Attempts <- sum(as.integer(RoethlisbergerData[1:45, 12:12])) # Roethlisberger total pass attempts

Brady_Total_Pass_Completions <- sum(as.integer(BradyData[1:45, 11:11])) # Brady total pass completions
Brady_Total_Pass_Attempts <- sum(as.integer(BradyData[1:45, 12:12])) # Brady total pass attempts

Rodgers_Total_Pass_Completions <- sum(as.integer(RodgersData[1:45, 11:11])) # Rodgers total pass completions
Rodgers_Total_Pass_Attempts <- sum(as.integer(RodgersData[1:45, 12:12])) # Rodgers total pass attempts

Wilson_Total_Pass_Completions <- sum(as.integer(WilsonData[1:45, 11:11])) # Wilson total pass completions
Wilson_Total_Pass_Attempts <- sum(as.integer(WilsonData[1:45, 12:12])) # Wilson total pass attempts



# Construct the data frame with the attempts and completions data
Pass_Completion_Rate <- data.frame(Player=c('Roethlisberger', 'Roethlisberger', 'Brady', 'Brady', 'Rodgers', 'Rodgers', 'Wilson', 'Wilson'),
                             Pass=c('Completions','Attempts', 'Completions', 'Attempts', 'Completions', 'Attempts', 'Completions', 'Attempts'),
                             Number_Passes=c(Ben_Total_Pass_Completions, Ben_Total_Pass_Attempts, Brady_Total_Pass_Completions, Brady_Total_Pass_Attempts, Rodgers_Total_Pass_Completions,
                                             Rodgers_Total_Pass_Attempts, Wilson_Total_Pass_Completions, Wilson_Total_Pass_Attempts))


ggplot(Pass_Completion_Rate, aes(fill=Pass, y=Number_Passes, x=Player)) + 
  geom_bar(position='dodge', stat='identity') + labs(title = "Pass Completion Rate", x = "Player", y = "Number of Passes") + 
  coord_flip() +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_text(
    aes(label = Number_Passes),
    colour = "black", size = 5,
    vjust = 1, position = position_dodge(0.9))




# Create a scatter plot showing passing yards game-by-game

Games <- (c('1', '2', '3', '4', '5', '6', '7','8', '9', '10', '11', '12', '13', '14', '15',
                                              '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29',
                                              '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43',
                                              '44', '45', '46', '47', '48'))
Games <- as.integer(Games)

# Create new data frames with the passing data only                   
Ben_Games <- data.frame(Games, Player=(rep(c("Roethlisberger"), times = 48)), Yards=c(RoethlisbergerData[1:48,13:13]))
Brady_Games <- data.frame(Games, Player=(rep(c("Brady"), times = 48)), Yards=c(BradyData[1:48,13:13]))
Rodgers_Games <- data.frame(Games, Player=(rep(c("Rodgers"), times = 48)), Yards=c(RodgersData[1:48,13:13]))
Wilson_Games <- data.frame(Games, Player=(rep(c("Wilson"), times = 48)), Yards=c(WilsonData[1:48,13:13]))
                            
Stacked_Yards = bind_rows(Ben_Games, Brady_Games, Rodgers_Games, Wilson_Games) # Stack the data vertically to be used in the scatter plot


ggplot(Stacked_Yards, aes(x = Games, y= Yards, colour = Player, group = 1)) +
  geom_point() +
  theme_bw() +
  labs(title = "Pass Yardage Game Breakdown", x = "Game", y = "Pass Yards") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks=seq(0,48,2)) +
  scale_y_continuous(breaks=seq(0,450,50))




# Create a box plot showing individual rushing statistics for the four quarterbacks

RoethlisbergerRush <- read.csv("Ben_Rushing.csv", header = TRUE) # Import Ben Roethlisberger Advanced Rushing Stats
BradyRush <- read.csv("Brady_Rushing.csv", header = TRUE) # Import Tom Brady Advanced Rushing Stats
RodgersRush <- read.csv("Rodgers_Rushing.csv", header = TRUE) # Import Aaron Rodgers Advanced Rushing Stats
WilsonRush <- read.csv("Wilson_Rushing.csv", header = TRUE) # Import Russel Wilson Advanced Rushing Stats

# Create new data frames with the rushing data only
Ben_Rushing <- data.frame(Player=(rep(c("Roethlisberger"), times = 48)), Rush_Yards=c(RoethlisbergerRush[1:48,12:12]))
Brady_Rushing <- data.frame(Player=(rep(c("Brady"), times = 48)), Rush_Yards=c(BradyRush[1:48,12:12]))
Rodgers_Rushing <- data.frame(Player=(rep(c("Rodgers"), times = 48)), Rush_Yards=c(RodgersRush[1:48,12:12]))
Wilson_Rushing <- data.frame(Player=(rep(c("Wilson"), times = 48)), Rush_Yards=c(WilsonRush[1:48,12:12]))

Stacked_Rushing = bind_rows(Ben_Rushing, Brady_Rushing, Rodgers_Rushing, Wilson_Rushing) # Stack the data vertically to be used in the box plot


ggplot(Stacked_Rushing, aes(x=Player, y=Rush_Yards, fill=Player)) +
  geom_boxplot(alpha=0.7) +
  scale_fill_brewer(palette="Set1") +
  stat_summary(fun=mean, geom="point", shape=20, size=5, color="red", fill="red") +
  labs(title = "Individual Rush Yardage", x = "Player", y = "Rush Yards") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(breaks=seq(0,100,10)) +
  coord_flip() # Flips the plots to be horizontal


# Thank you!

