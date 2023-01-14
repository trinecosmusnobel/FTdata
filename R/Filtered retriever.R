retrieve_filtered <- function(search.type, sequence.size = 100, exact.match = FALSE, ...) {

  search.type <- tolower(search.type)       #convert type to lower

  base.url <- get.ft.data.url(search.type)  #get base url

  args <- list(...)                         #get additional argument

  #### STOP EXECUTION IF NOT ALLOWED

  if (!tolower(names(args[1])) %in% unname(possible.meta[search.type] %>% unlist())) {
    stop(paste0("Filtering based on the criteria \"",
                names(args[1]),
                "\" is not when searching for results of type \"",
                search.type,
                "\""))
  } #end of if
  if (length(args) == 0) {
    stop(paste0("This function only supports one filter function at a time"))
  } #end of if

  #### CHECK IF FILTER MATCHES TYPE

  ## main function
  ## main function
  ## main function
  ## main function
  ## main function
  ## main function
  ## main function

  if (length(args) == 1 & tolower(names(args[1])) %in% tolower(unlist(possible.meta[search.type]))) {

    filter.value         <- args[[1]]
    filter.type           <- tolower(names(args[1]))

    #### CHECK IF FILTER IS ID

    if (filter.type == "id") {

      base.url <- paste0("https://oda.ft.dk/api/", stringr::str_to_title(search.type), "(", filter.value, ")")

      base.content <- httr::GET(URLencode(base.url))
      content <- httr::content(base.content)
      results <- jsonlite::fromJSON(rawToChar(response$content)) %>% bind_rows()

      results

    }

    #### IF FILTER IS NOT ID, THIS IS THE MAIN "NORMAL" FUNCTION

    if (filter.type != "id") {

      #### IF EXACT MATCH IS QUERIED

      if (exact.match == TRUE) {

        if (is.numeric(filter.value) == TRUE) {
          base.url <- paste0(base.url, "&$filter=", filter.type, paste0(" eq ", filter.value))
        }

        if (is.character(filter.value) == TRUE) {
          base.url <- paste0(base.url, "&$filter=", filter.type, paste0(" eq '", filter.value, "'"))
        }

      }

      #### IF EXACT MATCH IS !NOT! QUERIED

      if (exact.match == FALSE) {

          if (is.numeric(filter.value) == TRUE) {
            base.url <- paste0(base.url, "&$filter=", paste0("substringof(", filter.value, ",", filter.type, ") eq true"))
          }

          if (is.character(filter.value) == TRUE) {
            base.url <- paste0(base.url, "&$filter=", paste0("substringof('", filter.value, "',", filter.type, ") eq true"))
          }

      }

      tryCatch({
        base.url <- URLencode(base.url)
      }, error = function(e) {
        base.url <- base.url
      })

      base.url <- gsub(" ", "%20", base.url)

      base.content <- httr::GET(base.url)
      content <- httr::content(base.content)
      entry.n <- as.numeric(content$odata.count) #number of total entries

      sequences <- seq(from = 0, to = ceiling(entry.n), by = sequence.size)
      scraper.urls <- URLencode(paste0(base.url, "&$skip=", sequences))

      results <- list()

      pb <- txtProgressBar(min = 0, max = length(scraper.urls), style = 3)

      #### SCRAPER LOOP

      for (i in seq(scraper.urls)) {

        response <- httr::GET(scraper.urls[i])
        json <- jsonlite::fromJSON(rawToChar(response$content))
        results[[i]] <- as.data.frame(json) %>% dplyr::as_tibble()
        setTxtProgressBar(pb, i)

      }

      results <- results %>% bind_rows()

      #### RETURN RESULTS
      results

    }
    }
    }

