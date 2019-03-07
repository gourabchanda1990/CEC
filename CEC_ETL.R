#Set the working directory 
start_time <- proc.time()
setwd("Y:/01 Projects/PDC/Carelines/2018/Alteryx_Input")
#load the packages required 
library(xlsx)
library(dplyr)
#choose the file and read the file into a given carelines dataset 
input.carelines <- read.csv("carelines_metrics_cb.csv",header=T)
#convert the input dataset into a tibble using tbl_df() 

inputset <- tbl_df(input.carelines)
#seggregate the inputset tibble into 4 tibbles based on the 4 Big C's category 

output.food <- inputset%>%
  filter(category =="Food")
output.hc <- inputset%>%
  filter(category=="Home Care")
output.pc <- inputset%>%
  filter(category=="Personal Care")
output.ref <- inputset%>%
  filter(category == "Refreshment")
#Write the given extracted tibble back to the csv files 
write.csv(output.food,file = "Y:/01 Projects/PDC/Carelines/2018/Alteryx_Input/CB_Food.csv",
          row.names = F)
write.csv(output.pc,file = "Y:/01 Projects/PDC/Carelines/2018/Alteryx_Input/CB_Personal Care.csv",
          row.names = FALSE)
write.csv(output.hc,file = "Y:/01 Projects/PDC/Carelines/2018/Alteryx_Input/CB_Home Care.csv",
          row.names = F)
write.csv(output.ref,file = "Y:/01 Projects/PDC/Carelines/2018/Alteryx_Input/CB_Refreshment.csv",
          row.names = F)
