response <- GET("https://oda.ft.dk/API/")
json <- fromJSON(rawToChar(response$content))
FT_Types <- as.data.frame(json) %>% as_tibble() %>% rename("Type" = value.name,
                                                           "URL.prefix" = value.url) %>% 
  select(!odata.metadata)

usethis::use_r()