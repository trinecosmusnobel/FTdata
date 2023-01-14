---
output: github_document
---



# FTdata

Wrapper to use for the Danish Parliaments open data API.

## Installation

You can install `FTdata` from github with:


```r
devtools::install_github("trinecosmusnobel/FTdata")
```

## Examples


```r
# install.packages("devtools")
library(FTdata) #Load package

ft.retrieve(search.type = "debat") #Get all entries of type "debat"
#>   |                                               |                                       |   0%  |                                               |==                                     |   4%  |                                               |===                                    |   8%  |                                               |====                                   |  12%  |                                               |======                                 |  15%  |                                               |========                               |  19%  |                                               |=========                              |  23%  |                                               |==========                             |  27%  |                                               |============                           |  31%  |                                               |==============                         |  35%  |                                               |===============                        |  38%  |                                               |================                       |  42%  |                                               |==================                     |  46%  |                                               |====================                   |  50%  |                                               |=====================                  |  54%  |                                               |======================                 |  58%  |                                               |========================               |  62%  |                                               |==========================             |  65%  |                                               |===========================            |  69%  |                                               |============================           |  73%  |                                               |==============================         |  77%  |                                               |================================       |  81%  |                                               |=================================      |  85%  |                                               |==================================     |  88%  |                                               |====================================   |  92%  |                                               |====================================== |  96%  |                                               |=======================================| 100%
#> # A tibble: 2,573 × 32
#>    odata.metadata odata…¹ value…² value…³ value…⁴
#>    <chr>          <chr>     <int>   <int>   <int>
#>  1 https://oda.f… 2573         40       6      NA
#>  2 https://oda.f… 2573         80      11      NA
#>  3 https://oda.f… 2573        102      11      NA
#>  4 https://oda.f… 2573        105       6      NA
#>  5 https://oda.f… 2573        168       6      NA
#>  6 https://oda.f… 2573        259       6      NA
#>  7 https://oda.f… 2573        260       6      NA
#>  8 https://oda.f… 2573        261       6      NA
#>  9 https://oda.f… 2573        262       6      NA
#> 10 https://oda.f… 2573        263       6      NA
#> # … with 2,563 more rows, 27 more variables:
#> #   value.statusid <int>, value.titel <chr>,
#> #   value.titelkort <chr>,
#> #   value.offentlighedskode <chr>,
#> #   value.nummer <chr>,
#> #   value.nummerprefix <chr>,
#> #   value.nummernumerisk <chr>, …

ft.retrieve(search.type = "aktør", fornavn = "mette") #Get all entries of type "aktør" with first name "mette"
#>   |                                               |                                       |   0%  |                                               |=======================================| 100%# A tibble: 70 × 13
#>    odata.metadata odata…¹ value…² value…³ value…⁴
#>    <chr>          <chr>     <int>   <int> <lgl>  
#>  1 https://oda.f… 70           74       5 NA     
#>  2 https://oda.f… 70          135       5 NA     
#>  3 https://oda.f… 70          138       5 NA     
#>  4 https://oda.f… 70          197       5 NA     
#>  5 https://oda.f… 70          259       5 NA     
#>  6 https://oda.f… 70          263       5 NA     
#>  7 https://oda.f… 70          274       5 NA     
#>  8 https://oda.f… 70          354       5 NA     
#>  9 https://oda.f… 70          640       5 NA     
#> 10 https://oda.f… 70          854       5 NA     
#> # … with 60 more rows, 8 more variables:
#> #   value.navn <chr>, value.fornavn <chr>,
#> #   value.efternavn <chr>, value.biografi <chr>,
#> #   value.periodeid <lgl>,
#> #   value.opdateringsdato <chr>,
#> #   value.startdato <chr>, value.slutdato <chr>,
#> #   and abbreviated variable names …
```
