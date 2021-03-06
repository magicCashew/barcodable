package org.openapitools.api

import org.openapitools.model.InvalidCode
import org.openapitools.model.Item
import org.openapitools.model.NotFound
import org.springframework.http.HttpStatus
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity

import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestPart
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.validation.annotation.Validated
import org.springframework.web.context.request.NativeWebRequest
import org.springframework.beans.factory.annotation.Autowired

import javax.validation.Valid
import javax.validation.constraints.DecimalMax
import javax.validation.constraints.DecimalMin
import javax.validation.constraints.Max
import javax.validation.constraints.Min
import javax.validation.constraints.NotNull
import javax.validation.constraints.Pattern
import javax.validation.constraints.Size

import kotlin.collections.List
import kotlin.collections.Map

@RestController
@Validated
@RequestMapping("\${api.base-path:/magicCashew/barcodable/1.0.0}")
class ProductLookupApiController() {


    @RequestMapping(
        value = ["/api/v1/asin/{asin}"],
        produces = ["application/json"], 
        method = [RequestMethod.GET])
    fun getItemByASIN( @PathVariable("asin") asin: kotlin.String
): ResponseEntity<Item> {
        return ResponseEntity(HttpStatus.NOT_IMPLEMENTED)
    }


    @RequestMapping(
        value = ["/api/v1/ean/{ean}"],
        produces = ["application/json"], 
        method = [RequestMethod.GET])
    fun getItemByEAN( @PathVariable("ean") ean: kotlin.String
): ResponseEntity<Item> {
        return ResponseEntity(HttpStatus.NOT_IMPLEMENTED)
    }


    @RequestMapping(
        value = ["/api/v1/upc/{upc}"],
        produces = ["application/json"], 
        method = [RequestMethod.GET])
    fun getItemByUPC( @PathVariable("upc") upc: kotlin.String
): ResponseEntity<Item> {
        return ResponseEntity(HttpStatus.NOT_IMPLEMENTED)
    }
}
