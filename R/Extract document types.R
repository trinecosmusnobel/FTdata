response <- httr::GET("https://oda.ft.dk/API/")
json <- jsonlite::fromJSON(rawToChar(response$content))
FT_Types <- as.data.frame(json) %>% as_tibble() %>% rename("Type" = value.name,
                                                           "URL.prefix" = value.url) %>%
  dplyr::selectselect(!odata.metadata)

usethis::use_r()
