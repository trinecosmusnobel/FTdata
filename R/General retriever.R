ft.retrieve <- function(search.type, sequence.size = 100, exact.match = FALSE, ...) {

  args <- list(...)

  if (length(args) > 0) {
    result <- retrieve_filtered(search.type, sequence.size = 100, exact.match = FALSE, ...)
    print(result)
  }

  if (length(args) == 0) {

    base.url          <- get.ft.data.url(search.type)
    base.content      <- httr::GET(URLencode(base.url))

    content           <- content(base.content)
    entry.n           <- as.numeric(content$odata.count)

    sequences         <- seq(from = 0, to = ceiling(entry.n), by = sequence.size)
    scraper.urls      <- URLencode(paste0(base.url, "&$skip=", sequences))

    results <- list()

    pb <- txtProgressBar(min = 0, max = length(scraper.urls), style = 3)

    for (i in seq(scraper.urls)) {

      response <- httr::GET(scraper.urls[i])
      json <- fromJSON(rawToChar(response$content))
      results[[i]] <- as.data.frame(json) %>% as_tibble()
      setTxtProgressBar(pb, i)

    }

    results <- results %>% bind_rows()

    results

    }

}
