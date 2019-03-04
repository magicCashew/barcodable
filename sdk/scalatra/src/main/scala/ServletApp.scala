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


package org.openapitools.app

import org.scalatra.swagger.{ ApiInfo, SwaggerWithAuth, Swagger }
import org.scalatra.swagger.{ JacksonSwaggerBase, Swagger }
import org.scalatra.ScalatraServlet
import org.json4s.{ DefaultFormats, Formats }

class ResourcesApp(implicit protected val swagger: OpenAPIApp)
  extends ScalatraServlet with JacksonSwaggerBase {
  before() {
    response.headers += ("Access-Control-Allow-Origin" -> "*")
  }
}

class OpenAPIApp extends Swagger(apiInfo = OpenAPIInfo.apiInfo, apiVersion = "1.0", swaggerVersion = Swagger.SpecVersion)

object OpenAPIInfo {
  val apiInfo = ApiInfo(
    """Barcodable.com API""",
    """Barcodable.com API""",
    """http://org.openapitools""",
    """support@barcodable.com""",
    """Apache 2.0""",
    """http://www.apache.org/licenses/LICENSE-2.0.html""")
}
