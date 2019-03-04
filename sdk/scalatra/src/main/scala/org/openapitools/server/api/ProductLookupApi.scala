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

import org.openapitools.server.model.InvalidCode
import org.openapitools.server.model.Item
import org.openapitools.server.model.NotFound

import java.io.File

import org.scalatra.ScalatraServlet
import org.scalatra.swagger._
import org.json4s._
import org.json4s.JsonDSL._
import org.scalatra.json.{ JValueResult, JacksonJsonSupport }
import org.scalatra.servlet.{ FileUploadSupport, MultipartConfig, SizeConstraintExceededException }

import scala.collection.JavaConverters._

class ProductLookupApi(implicit val swagger: Swagger) extends ScalatraServlet
  with FileUploadSupport
  with JacksonJsonSupport
  with SwaggerSupport {
  protected implicit val jsonFormats: Formats = DefaultFormats

  protected val applicationDescription: String = "ProductLookupApi"

  before() {
    contentType = formats("json")
    response.headers += ("Access-Control-Allow-Origin" -> "*")
  }
  

  val getItemByASINOperation = (apiOperation[Item]("getItemByASIN")
    summary "Find item by asin code"
    parameters(pathParam[String]("asin").description(""))
  )

  get("/api/v1/asin/:asin", operation(getItemByASINOperation)) {
    val asin = params.getOrElse("asin", halt(400))
    //println("asin: " + asin)
  }

  

  val getItemByEANOperation = (apiOperation[Item]("getItemByEAN")
    summary "Find item by UPC code"
    parameters(pathParam[String]("ean").description(""))
  )

  get("/api/v1/ean/:ean", operation(getItemByEANOperation)) {
    val ean = params.getOrElse("ean", halt(400))
    //println("ean: " + ean)
  }

  

  val getItemByUPCOperation = (apiOperation[Item]("getItemByUPC")
    summary "Find item by UPC code"
    parameters(pathParam[String]("upc").description(""))
  )

  get("/api/v1/upc/:upc", operation(getItemByUPCOperation)) {
    val upc = params.getOrElse("upc", halt(400))
    //println("upc: " + upc)
  }

}
