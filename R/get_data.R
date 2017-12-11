#' Get Comment
#'
#' Get naver news comments
#' if you want to get data only comment, enter command like below.
#' getComment(url)$result$commentList[[1]]
#'
#' @param turl like 'http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=056&aid=0010335895'.
#' @param pageSize is a number of comments per page. defult is 10.
#' @param page is defult is 1.
#' @param sort you can select favorite, reply, old, new. favorite is defult.
#' @return Get data.frame.
#' @export
#' @import httr
#' @import jsonlite
#' @import stringr