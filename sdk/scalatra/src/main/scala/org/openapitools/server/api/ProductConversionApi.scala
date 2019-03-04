/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * OpenAPI spec version: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 */


package org.openapitools.server.api

import org.openapitools.server.model.InlineResponse200
import org.openapitools.server.model.InlineResponse400

import java.io.File

import org.scalatra.ScalatraServlet
import org.scalatra.swagger._
import org.json4s._
import org.json4s.JsonDSL._
import org.scalatra.json.{ JValueResult, JacksonJsonSupport }
import org.scalatra.servlet.{ FileUploadSupport, MultipartConfig, SizeConstraintExceededException }

import scala.collection.JavaConverters._

class ProductConversionApi(implicit val swagger: Swagger) extends ScalatraServlet
  with FileUploadSupport
  with JacksonJsonSupport
  with SwaggerSupport {
  protected implicit val jsonFormats: Formats = DefaultFormats

  protected val applicationDescription: String = "ProductConversionApi"

  before() {
    contentType = formats("json")
    response.headers += ("Access-Control-Allow-Origin" -> "*")
  }
  

  val convertCodeOperation = (apiOperation[InlineResponse200]("convertCode")
    summary "Convert between UPC, EAN, and ASIN product codes."
    parameters(pathParam[String]("upc Pipe ean Pipe asin").description(""))
  )

  get("/api/v1/convert/:upc | ean | asin", operation(convertCodeOperation)) {
    val upc Pipe ean Pipe asin = params.getOrElse("upc Pipe ean Pipe asin", halt(400))
    //println("upc Pipe ean Pipe asin: " + upc Pipe ean Pipe asin)
  }

}
