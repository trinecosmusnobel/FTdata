#Possible search criteria for each type of document search

response <- httr::GET("https://oda.ft.dk/API/")
json <- jsonlite::fromJSON(rawToChar(response$content))
FT_Types <- as.data.frame(json) %>% as_tibble() %>% rename("Type" = value.name,
                                                           "URL.prefix" = value.url) %>%
  dplyr::select(!odata.metadata)


possible.meta <- list()

for (i in seq(FT_Types$URL.prefix)) {

  response <- httr::GET(paste0("https://oda.ft.dk/API/", (FT_Types$URL.prefix[i])))
  df <- jsonlite::fromJSON(rawToChar(response$content))$value %>% as_tibble()

  possible.meta[[i]] <- colnames(df)

  }

names(possible.meta) <- tolower(FT_Types$Type)

possible.meta
