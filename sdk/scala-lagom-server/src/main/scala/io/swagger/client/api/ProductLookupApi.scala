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

package io.swagger.client.api

import akka.{Done, NotUsed}
import com.lightbend.lagom.scaladsl.api.transport.Method
import com.lightbend.lagom.scaladsl.api.{Service, ServiceCall}
import play.api.libs.json._
import com.lightbend.lagom.scaladsl.api.deser.PathParamSerializer

import io.swagger.client.model.InvalidCode
import io.swagger.client.model.Item
import io.swagger.client.model.NotFound

trait ProductLookupApi extends Service {


  final override def descriptor = {
    import Service._
    named("ProductLookupApi").withCalls(
      restCall(Method.GET, "/api/v1/asin/:asin", getItemByASIN _), 
      restCall(Method.GET, "/api/v1/ean/:ean", getItemByEAN _), 
      restCall(Method.GET, "/api/v1/upc/:upc", getItemByUPC _)
    ).withAutoAcl(true)
  }


  /**
    * Find item by asin code
    * Returns a single item
    *  
    * @param asin ASIN code of item to return 
    * @return Item
    */
  def getItemByASIN(asin: String): ServiceCall[NotUsed ,Item]
  
  /**
    * Find item by UPC code
    * Returns a single item
    *  
    * @param ean EAN code of item to return 
    * @return Item
    */
  def getItemByEAN(ean: String): ServiceCall[NotUsed ,Item]
  
  /**
    * Find item by UPC code
    * Returns a single item
    *  
    * @param upc UPC code of item to return 
    * @return Item
    */
  def getItemByUPC(upc: String): ServiceCall[NotUsed ,Item]
  

  }
