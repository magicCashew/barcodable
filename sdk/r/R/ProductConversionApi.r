# Barcodable.com API
#
# Barcodable.com API
#
# OpenAPI spec version: 1.5.0
# Contact: support@barcodable.com
# Generated by: https://openapi-generator.tech

#' @title ProductConversion operations
#' @description openapi.ProductConversion
#'
#' @field path Stores url path of the request.
#' @field apiClient Handles the client-server communication.
#' @field userAgent Set the user agent of the request.
#'
#' @importFrom R6 R6Class
#'
#' @section Methods:
#' \describe{
#'
#' convert_code Convert between UPC, EAN, and ASIN product codes.
#'
#' }
#'
#' @export
ProductConversionApi <- R6::R6Class(
  'ProductConversionApi',
  public = list(
    userAgent = "OpenAPI-Generator/1.0.0/r",
    apiClient = NULL,
    initialize = function(apiClient){
      if (!missing(apiClient)) {
        self$apiClient <- apiClient
      }
      else {
        self$apiClient <- ApiClient$new()
      }
    },
    convert_code = function(upc___ean___asin, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      urlPath <- "/api/v1/convert/{upc | ean | asin}"
      if (!missing(`upc___ean___asin`)) {
        urlPath <- gsub(paste0("\\{", "upc | ean | asin", "\\}"), `upc___ean___asin`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
                jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    }
  )
)