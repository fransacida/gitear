library(httr)
library(jsonlite)

base_url <- Sys.getenv("URI")
api_key <- Sys.getenv("TOKEN")
owner <- Sys.getenv("USUARIO")

repo <- Sys.getenv("REPOSITORIO_PRUEBA")
org <- Sys.getenv("ORGANIZACION_PRUEBA") 
id_org <- Sys.getenv("ID_ORG")

id_hook <- Sys.getenv("ID_HOOK")

id_issue <- Sys.getenv("ID_ISSUE")

title <- Sys.getenv("TITLE")
body <- Sys.getenv("BODY")
state <- Sys.getenv("STATE")

time <- Sys.getenv("TIME")

id_comment <-Sys.getenv("ID_COMMENT")

