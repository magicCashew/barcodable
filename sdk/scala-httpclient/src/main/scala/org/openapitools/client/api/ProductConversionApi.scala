/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * OpenAPI spec version: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

package org.openapitools.client.api

import java.text.SimpleDateFormat

import org.openapitools.client.model.InlineResponse200
import org.openapitools.client.model.InlineResponse400
import org.openapitools.client.{ApiInvoker, ApiException}

import collection.mutable
import com.sun.jersey.multipart.FormDataMultiPart
import com.sun.jersey.multipart.file.FileDataBodyPart
import com.wordnik.swagger.client._
import com.wordnik.swagger.client.ClientResponseReaders.Json4sFormatsReader._
import com.wordnik.swagger.client.RequestWriters.Json4sFormatsWriter._

import java.net.URI
import java.io.File
import java.util.Date
import java.util.TimeZone
import javax.ws.rs.core.MediaType

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent._
import scala.concurrent.duration._
import scala.collection.mutable.HashMap
import scala.util.{Failure, Success, Try}

import org.json4s._

class ProductConversionApi(
  val defBasePath: String = "https://virtserver.swaggerhub.com/mindviser/barcodable/1.0.0",
  defApiInvoker: ApiInvoker = ApiInvoker
) {
  private lazy val dateTimeFormatter = {
    val formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    formatter.setTimeZone(TimeZone.getTimeZone("UTC"))
    formatter
  }
  private val dateFormatter = {
    val formatter = new SimpleDateFormat("yyyy-MM-dd")
    formatter.setTimeZone(TimeZone.getTimeZone("UTC"))
    formatter
  }
  implicit val formats = new org.json4s.DefaultFormats {
    override def dateFormatter = dateTimeFormatter
  }
  implicit val stringReader: ClientResponseReader[String] = ClientResponseReaders.StringReader
  implicit val unitReader: ClientResponseReader[Unit] = ClientResponseReaders.UnitReader
  implicit val jvalueReader: ClientResponseReader[JValue] = ClientResponseReaders.JValueReader
  implicit val jsonReader: ClientResponseReader[Nothing] = JsonFormatsReader
  implicit val stringWriter: RequestWriter[String] = RequestWriters.StringWriter
  implicit val jsonWriter: RequestWriter[Nothing] = JsonFormatsWriter

  var basePath: String = defBasePath
  var apiInvoker: ApiInvoker = defApiInvoker

  def addHeader(key: String, value: String): mutable.HashMap[String, String] = {
    apiInvoker.defaultHeaders += key -> value
  }

  val config: SwaggerConfig = SwaggerConfig.forUrl(new URI(defBasePath))
  val client = new RestClient(config)
  val helper = new ProductConversionApiAsyncHelper(client, config)

  /**
   * Convert between UPC, EAN, and ASIN product codes.
   * Returns the converted UPC, EAN, and ASIN codes.
   *
   * @param upcEanAsin UPC, EAN, or ASIN 
   * @return InlineResponse200
   */
  def convertCode(upcEanAsin: String): Option[InlineResponse200] = {
    val await = Try(Await.result(convertCodeAsync(upcEanAsin), Duration.Inf))
    await match {
      case Success(i) => Some(await.get)
      case Failure(t) => None
    }
  }

  /**
   * Convert between UPC, EAN, and ASIN product codes. asynchronously
   * Returns the converted UPC, EAN, and ASIN codes.
   *
   * @param upcEanAsin UPC, EAN, or ASIN 
   * @return Future(InlineResponse200)
   */
  def convertCodeAsync(upcEanAsin: String): Future[InlineResponse200] = {
      helper.convertCode(upcEanAsin)
  }

}

class ProductConversionApiAsyncHelper(client: TransportClient, config: SwaggerConfig) extends ApiClient(client, config) {

  def convertCode(upcEanAsin: String)(implicit reader: ClientResponseReader[InlineResponse200]): Future[InlineResponse200] = {
    // create path and map variables
    val path = (addFmt("/api/v1/convert/{upc | ean | asin}")
      replaceAll("\\{" + "upc | ean | asin" + "\\}", upcEanAsin.toString))

    // query params
    val queryParams = new mutable.HashMap[String, String]
    val headerParams = new mutable.HashMap[String, String]

    if (upcEanAsin == null) throw new Exception("Missing required parameter 'upcEanAsin' when calling ProductConversionApi->convertCode")


    val resFuture = client.submit("GET", path, queryParams.toMap, headerParams.toMap, "")
    resFuture flatMap { resp =>
      process(reader.read(resp))
    }
  }


}
