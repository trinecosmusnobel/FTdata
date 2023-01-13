ft.retrieve <- function(search.type, sequence.size = 100, exact.match = FALSE, ...) {
  library(httr)
  library(dplyr)
  library(jsonlite)
  args <- list(...)

  if (length(args) > 0) {
    result <- retrieve_filtered(search.type, sequence.size = 100, exact.match = FALSE, ...)
    print(result)
  }

  if (length(args) == 0) {

    base.url          <- get.ft.data.url(search.type)
    base.content      <- httr::GET(URLencode(base.url))

    content           <- httr::content(base.content)
    entry.n           <- as.numeric(content$odata.count)

    sequences         <- seq(from = 0, to = ceiling(entry.n), by = sequence.size)
    scraper.urls      <- URLencode(paste0(base.url, "&$skip=", sequences))

    results <- list()

    pb <- txtProgressBar(min = 0, max = length(scraper.urls), style = 3)

    for (i in seq(scraper.urls)) {

      response <- httr::GET(scraper.urls[i])
      json <- jsonlite::fromJSON(rawToChar(response$content))
      results[[i]] <- as.data.frame(json) %>% dplyr::as_tibble()
      setTxtProgressBar(pb, i)

    }

    results <- results %>% dplyr::bind_rows()

    results

    }

}
