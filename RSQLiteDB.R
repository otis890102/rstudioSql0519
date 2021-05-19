#------------------------------
#Author:otis
#date:20210519
#------------------------------
rm(list=ls())
#------------------------------
##1.install.packages
#pkgs <- c("RSQLite","DBI");
#install.packages(pkgs);
##2.載入DBI套件與RSQLite
library(DBI)
library(RSQLite)
##3.在本機端(Local)建立DB_20200519
#--建立SQLite資料庫連線
Con1.DB <- dbConnect(RSQLite::SQLite(),dbname = "DB_20210519")

dbListTable(Con1.DB)
#character(0)#空白的資料庫產生
#-----------------------------
##4.資料庫使用完後，記得要將連線關閉
dbDisconnect(Con1.DB)
#----------------------------
##5.試著將"iris" dataset 寫入"DB_iris.db"
con2.DB <- dbConnect(RSQLite::SQLite(),dbname = "DB_iris")

dbWriteTable(con2.DB)
dbListTables(con2.DB)
dbDisconnect(con2.DB)
#----------------------------
##6.建立資料庫中的表格資料
#-- 試著將"gapminder" dataset 寫入"DB_gapminder.db
#install.packages("gapminder")
#library("gapminder")
con3.DB <- dbConnect(RSQLite::SQLite(),dbname = "DB_gapminder")

dbListTables(con3.DB)
#---將gapminder這個資料框(tibble格式)寫入demo.db
dbWriteTable(con3.DB,name = "gapminder",value=gapminder)

dbListTables(con3.DB)
#---觀察表格中的資料
dbListTables(con3.DB,name = "gapminder")
#---觀察表格中有那些變數
dbListFields(con3.DB,name = "gapminder")
#---讀取整張資料庫表格
dbReadTable(con3.DB,name = "gapminder")
#---Query"country"
dbGetQuery(con3.DB,statement = "SELECT * FROM gapminder WHERE country = 'Taiwan';")
#---Query"year"
dbGetQuery(con3.DB,statement = "SELECT * FROM gapminder WHERE year = '2007';")
#---
dbDisconnect(con3.DB)