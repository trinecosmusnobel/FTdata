get.ft.data.url <- function(type) {

  library(httr)
  library(dplyr)
  library(jsonlite)

  prefix <- FT_Types %>% dplyr::mutate(Type = tolower(Type)) %>% dplyr::filter(Type == tolower(type)) %>% dplyr::pull(URL.prefix)
  base_url <- paste0("http://oda.ft.dk/api/", prefix, "?$inlinecount=allpages")
  base_url

}

