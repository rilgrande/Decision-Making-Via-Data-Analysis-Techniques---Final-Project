# Decision-Making-Via-Data-Analysis-Techniques---Final-Project

See poster pdf file for more analysis

Plot 1: Vertical Bar Chart showing total sacks plus hits data for the four quarterbacks over 16 games segments of the sampled 48 games
See lines 21-111. This section uses the following data sets: Big Ben.csv, Brady.csv, Rodgers.csv, Wilson.csv

Import the data, subset the data by column for sacks and hits only, sum those columns, create a summarizing data frame with this information, and then plot the data.

The vertical bar chart clearly compares the frequency of hits and sacks side-by-side for the four quarterbacks across all of the four seasons. Ben Roethlisberger seems to have the fewest which is expected under his style of offense. Aaron Rodgers is known to get hit often so this is also expected. Russel Wilson has gotten hit more and more in recent games so this may indicate an issue with his pass protection/offensive line. Tom Brady has been hit a considerable amount considering his reputation of not being hit much.

Plot 2: Pie Charts for passing vs running yards gained by each of the five team's offenses during these games
See lines 117-227. This section uses the following data sets:

Steelers_Stats_2018.csv, Steelers_Stats_2019.csv, Steelers_Stats_2020.csv, Steelers_Stats_2021.csv, Patriots_Stats_2018.csv. Patriots_Stats_2019.csv, Bucs_Stats_2020.csv, Packers_Stats_2018.csv, Packers_Stats_2019.csv, Packers_Stats_2020.csv, Seahawks_Stats_2018.csv, Seahawks_Stats_2019.csv, Seahawks_Stats_2020.csv

Import the data, sum the passing and rushing yards across the different seasons while each player was playing in the game on that team, calculate the fractions of passing vs rushing yards, create a summarizing data frame with this information, and then plot the data.

The pie charts are a good choice to show the percentage breakdown of passing versus rushing. The Seahawks/Russel Wilson’s offense appear to be the most rushing-heavy offense, the Steelers are pass-heavy, and Brady’s team and the Packers have similar splits.

Plot 3: Horizontal Bar chart showing each quarterback's cumulative completion percentage in these games
See lines 232-262. This section uses the following data sets: Big Ben.csv, Brady.csv, Rodgers.csv, Wilson.csv

Use the imported data to create new data frames for each player with passing data only, stack those data frames vertically for easier plotting, and then plot the data.

The way this plot is presented provides a quick glance opportunity to see that all quarterbacks have an approximate 75% completion rate. Ben Roethlisberger attempted many more passes, and Russel Wilson completed many fewer passes (likely due to his offense’s running tendency as learned in the pie charts).

Plot 4: Scatter Plot showing passing yards game-by-game
See lines 267-290. This section uses the following data sets: Big Ben.csv, Brady.csv, Rodgers.csv, Wilson.csv

Use the imported data to construct a data frame with games 1 through 48 identified (to be used on the x-axis of the plot). Pull out the passing data only into four new data frames with the games 1 through 48 data frame and stack those four data frames vertically for easier plotting. Then, plot the data.

This plot aims to show the distribution of pass yards achieved by each quarterback, which appears to be somewhat evenly distributed.

Plot 5: Box Plot showing individual rushing statistics for the four quarterbacks
See lines 295 to 318. This section uses the following data sets: Ben_Rushing.csv, Brady_Rushing.csv, Rodgers_Rushing.csv, Wilson_Rushing.csv

Import the data, pull the running data only into new data frames for each player, stack those new data frames vertically for easier plotting, and plot the data.

The box plots aim to communicate how skilled these quarterbacks are as runners and if they have a tendency to gains yards via the running game. Russel Wilson clearly does run the ball followed next by Aaron Rodgers. Ben Roethlisberger has a career history of scrambling with the ball occasionally, and Tom Brady is usually a strict pocket passer.


