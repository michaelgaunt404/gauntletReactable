# gauntletReactable

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

This R package provides a set of functions which allow the user to query and process Replica data. Using user inputs, SQL queries area made to the Replica Big Query database. The results of those queries are returned to the user in the form of CSVs. Convenience functions are used to convert tabular data to spatial `SF` objects. 

#### Intent of this package:

This package is intended to lower the overhead when working with Replica data. Specifically, to make it extremely easy with little cost to acquire Replica data and to produce some basic analytic tools (dashboards) to quickly gain useful insights.  

#### What you can do with this package:
    
:heavy_check_mark: Make queries directly to and acquire data from Replica's Big Query database using your own inputs and custom geometry     
:heavy_check_mark: Create data sets from your queries and use them to: 
    
+ Quantify trip ODs  
+ Aggregate network link volumes  
+ Produce trip origin kernel density estimates (KDE)   
+ Identify trip origin hotspots and coldspots  

:heavy_check_mark: Create interactive, filterable map widgets that help you further inspect your data 

> **_NOTE:_** The usage of this package requires the user to have an account with Replica and access to Google BigQuery via Replica. 

## Installation

Install the development version from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("michaelgaunt404/gauntletReactable")
```

``` r
library(gauntletReactable)
```


## Usage
