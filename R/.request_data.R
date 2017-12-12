#' Get list of krdata
#'
#' Get list of data registered in krdata.
#'
#' @return Get tibble ?x5. 
#' @export
#' @import gsheet

get_list <- function(){
  tar <- "https://docs.google.com/spreadsheets/d/1onQ3ZL_a7EiA52lI3GlRo9CS_8TFX2dRZaO9of-NFsM/edit?usp=sharing"
  res <- gsheet::gsheet2tbl(tar)
  return(res)
}