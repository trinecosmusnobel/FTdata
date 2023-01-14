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

ft.retrieve(search.type = "aktør", fornavn = "mette") #Get all entries of type "aktør" with first name "mette"

```
