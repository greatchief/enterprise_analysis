rm(list=ls()
library(readstata13)
ES2015MY <- read.dta13("Malaysia-2015-full data.dta")


library("tidyverse")
library("plotly")
library("oidnChaRts")
library("highcharter")

#type of business (b1) by region (a2)
ES2015MY %>%
  group_by(a2, b1) %>%
  summarise(total = sum(id)) %>%
  ungroup() %>%
  hchart("bar",
         hcaes(y = total,
               x = a2,
               group = b1))
ES2015MY %>%
  group_by(a2, b1) %>%
  summarise(total = sum(id)) %>%
  ungroup() %>%
  hchart("bar",
         hcaes(y = total,
               x = a2,
               group = b1)) %>%
  hc_plotOptions(series = list(stacking = "stack"))

ES2015MY %>%
  group_by(a2, b1) %>%
  summarise(total = sum(id)) %>%
  ungroup() %>%
  hchart("bar",
         hcaes(y = total,
               x = a2,
               group = b1)) %>%
  hc_plotOptions(series = list(stacking = "percent")) %>%
  hc_tooltip(shared = TRUE)


## =================== gVis
library("DT")
datatable(ES2015MY, 
          rownames = FALSE,
          filter = list(position = "top"))
datatable(
  ES2015MY,
  rownames = FALSE,
  extensions = 'Buttons',
  options = list(dom = 'Bfrtip', buttons = I('colvis'))
)

library("stringr")
ES2015MY %>%
  datatable(
    rownames = FALSE,
    colnames = pretty_headers,
    filter = list(position = "top"),
    options = list(language = list(sSearch = "Filter:"))
  )
