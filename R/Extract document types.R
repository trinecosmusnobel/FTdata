response <- httr::GET("https://oda.ft.dk/API/")
json <- jsonlite::fromJSON(rawToChar(response$content))
FT_Types <- as.data.frame(json) %>% dplyr::as_tibble() %>% dplyr::rename("Type" = value.name,
                                                           "URL.prefix" = value.url) %>%
  dplyr::select(!odata.metadata)
