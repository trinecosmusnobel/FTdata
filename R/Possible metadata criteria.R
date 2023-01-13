#Possible search criteria for each type of document search

response <- GET("https://oda.ft.dk/API/")
json <- fromJSON(rawToChar(response$content))
FT_Types <- as.data.frame(json) %>% as_tibble() %>% rename("Type" = value.name,
                                                           "URL.prefix" = value.url) %>% 
  select(!odata.metadata)


possible.meta <- list()

for (i in seq(FT_Types$URL.prefix)) {
  
  response <- GET(paste0("https://oda.ft.dk/API/", (FT_Types$URL.prefix[i])))
  df <- fromJSON(rawToChar(response$content))$value %>% as_tibble()
  
  possible.meta[[i]] <- colnames(df)

  }

names(possible.meta) <- tolower(FT_Types$Type)

possible.meta