/*
 * Barcodable.com API
 *
 * Barcodable.com API
 *
 * API version: 1.5.0
 * Contact: support@barcodable.com
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package openapi

import (
	"encoding/json"
	"net/http"
	"strings"

	"github.com/gorilla/mux"
)

// A ProductLookupApiController binds http requests to an api service and writes the service results to the http response
type ProductLookupApiController struct {
	service ProductLookupApiServicer
}

// NewProductLookupApiController creates a default api controller
func NewProductLookupApiController(s ProductLookupApiServicer) Router {
	return &ProductLookupApiController{ service: s }
}

// Routes returns all of the api route for the ProductLookupApiController
func (c *ProductLookupApiController) Routes() Routes {
	return Routes{ 
		{
			"GetItemByASIN",
			strings.ToUpper("Get"),
			"/magicCashew/barcodable/1.0.0/api/v1/asin/{asin}",
			c.GetItemByASIN,
		},
		{
			"GetItemByEAN",
			strings.ToUpper("Get"),
			"/magicCashew/barcodable/1.0.0/api/v1/ean/{ean}",
			c.GetItemByEAN,
		},
		{
			"GetItemByUPC",
			strings.ToUpper("Get"),
			"/magicCashew/barcodable/1.0.0/api/v1/upc/{upc}",
			c.GetItemByUPC,
		},
	}
}

// GetItemByASIN - Find item by asin code
func (c *ProductLookupApiController) GetItemByASIN(w http.ResponseWriter, r *http.Request) { 
	params := mux.Vars(r)
	asin := params["asin"]
	result, err := c.service.GetItemByASIN(asin)
	if err != nil {
		w.WriteHeader(500)
		return
	}
	
	EncodeJSONResponse(result, nil, w)
}

// GetItemByEAN - Find item by UPC code
func (c *ProductLookupApiController) GetItemByEAN(w http.ResponseWriter, r *http.Request) { 
	params := mux.Vars(r)
	ean := params["ean"]
	result, err := c.service.GetItemByEAN(ean)
	if err != nil {
		w.WriteHeader(500)
		return
	}
	
	EncodeJSONResponse(result, nil, w)
}

// GetItemByUPC - Find item by UPC code
func (c *ProductLookupApiController) GetItemByUPC(w http.ResponseWriter, r *http.Request) { 
	params := mux.Vars(r)
	upc := params["upc"]
	result, err := c.service.GetItemByUPC(upc)
	if err != nil {
		w.WriteHeader(500)
		return
	}
	
	EncodeJSONResponse(result, nil, w)
}
