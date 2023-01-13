get.ft.data.url <- function(type) {

  library(httr)
  library(dplyr)
  library(jsonlite)

  prefix <- FT_Types %>% mutate(Type = tolower(Type)) %>% filter(Type == tolower(type)) %>% pull(URL.prefix)
  base_url <- paste0("http://oda.ft.dk/api/", prefix, "?$inlinecount=allpages")
  base_url

}

