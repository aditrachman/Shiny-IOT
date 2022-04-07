library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(glue)
library(readxl)
library(lubridate)
library(ggthemes)
library(RMariaDB)
library(ggplot2)
library(googlesheets4)
library(timetk)

localuserpassword <- ""

storiesDb <-
  dbConnect(
    RMariaDB::MariaDB(),
    user = 'root',
    password = localuserpassword,
    dbname = 'teknomedika',
    host = 'localhost'
  )
dbListTables(storiesDb)
##start query
query <- paste("SELECT * FROM mesin5_b")
rs <- dbSendQuery(storiesDb, query)
kie <- dbFetch(rs)
kie2 <- slice(kie, 1:500)
kie3 <- slice(kie, 1:10)

##stop the query

fig <- plot_ly(kie2,
               labels = ~ kie2,
               values = ~ qty,
               type = 'pie')

bp <- ggplot(kie3, aes(x = "", y = waktu, fill = group)) +
  geom_bar(width = 1, stat = "identity")

jumlah <- sum(kie$qty)

##plot mesin 5
testo1 <-kie %>% 
  summarise_by_time(.date_var = waktu, .by = 'hour', tabel1 = sum(qty)) %>% 
  mutate(mingguke1 = week(waktu)) %>% 
  select(waktu,mingguke1,tabel1)

testo2 <-bro %>% 
  summarise_by_time(.date_var = waktu, .by = 'hour', tabel2 = sum(qty)) %>% 
  mutate(mingguke2 = week(waktu)) %>% 
  select(waktu,mingguke2,tabel2)

testo3 <-kie %>% 
  summarise_by_time(.date_var = waktu, .by = 'hour', tabel3 = sum(qty)) %>% 
  mutate(mingguke3 = week(waktu)) %>% 
  select(waktu,mingguke3,tabel3)

testo4 <-kie %>% 
  summarise_by_time(.date_var = waktu, .by = 'hour', tabel4 = sum(qty)) %>% 
  mutate(mingguke4 = week(waktu)) %>% 
  select(waktu,mingguke4,tabel4)



##spreadsheet conection
gs4_deauth()
gs4_auth(email = "aditrachman23@gmail.com", cache = ".secrets")
df <-
  read_sheet(
    "https://docs.google.com/spreadsheets/d/1TfqECSPfB_9vNfOv-3NsKO-n3ulq0r1ESm-mEx5yAxg/edit#gid=464822429&range=C3",
    sheet = "Laporan harian produksi"
  )
fg <- df %>% select("Jumlah Finish Goods")




