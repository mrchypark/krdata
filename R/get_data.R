#' Get Dataset in krdata
#'
#' Get dataset registered in krdata.
#'
#' @param dataId ID what you want to get from list.
#' @param dataList list of data from get_list function.
#' @return Returns True if the data was successfully loaded.
#' @export

get_data <- function(dataId, dataList) {
  
  data <- dataList[dataList$id == dataId, "data"]
  type <- dataList[dataList$id == dataId, "type"]
  tarUrl <- dataList[dataList$id == dataId, "getUrl"]
  
  if (type == "package") {
    install_package(data, tarUrl)
  }
  
  if (type == "rda") {
    download_rda(tarUrl)
  }
  
  if (type %in% c("tsv", "csv", "txt")) {
    download_file(tarUrl, data, type) 
  }
  
}

#' @importFrom devtools install_url
#' @importFrom devtools install_github
#' @importFrom urltools url_parse
#' @importFrom stringr str_count

install_package <- function(data, tarUrl) {
  
  urlParam <- url_parse(as.character(tarUrl))
  
  chk_sl <- str_count(urlParam$path, "/")
  chk_gh <- "github.com" == urlParam$domain
  
  if (chk_sl == 1 & chk_gh) {
    install_github(urlParam$path, dependencies = TRUE)
  }
  
  if (chk_sl > 1 & chk_gh) {
    install_url(tarUrl, dependencies = TRUE)
  }
  
  if (!chk_gh) {
    install_url(tarUrl, dependencies = TRUE)
  }
  
  require(data, character.only = TRUE)
  
}

#' @importFrom utils download.file

download_rda <- function(tarUrl) {
  
  tmp <- tempfile()
  download.file(as.character(tarUrl), destfile = tmp)
  load(tmp)
  
}

#' @importFrom readr read_csv
#' @importFrom readr read_tsv
#' @importFrom readr read_table
download_file <- function(tarUrl, data, type) {

  if(type=="csv"){
    assign(as.character(data), read_csv(as.character(tarUrl)))
  }
  if(type=="txt"){
    assign(as.character(data), read_table(as.character(tarUrl)))
  }
  if(type=="tsv"){
    assign(as.character(data), read_tsv(as.character(tarUrl)))
  }
  
}