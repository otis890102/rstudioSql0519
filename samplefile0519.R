#以dbExecute()函數建立表格與輸入觀測值
user_location <- "C:\Users\江承翰\Documents\RSQLiteDB"
db_path <- paste0(user_location,"demo.db")
con <- dbConnect(RSQLite::SQLite(),dbname = db_path)
#---------------
create_statement <- "CREATE TABLE cities (city TEXT NOT NULL,country TEXT NOT NULL);"

dbExecute(con,statement = create_statement)

dbListTables(con)

dbReadTable(con,"cities")

dbListFields(con,name = "cities")

#---------------

insert_statement <- "INSERT INTO cities (city,country) values ('Taipei','Taiwan'),('Boston','United States'),('Tokyo','Japan');"

dbExecute(con,statement = insert_statement)

dbReadTable(con,"cities")

dbListFields(con,name = "cities")

dbListFields(con,name = "gapminder")

dbGetQuery(con,statement = "SELECT * FROM cities WHERE city = 'Tokyo';")
           
dbDisconnect(con)           