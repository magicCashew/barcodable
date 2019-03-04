/*
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


package com.prokarma.pkmst.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.prokarma.pkmst.model.InlineResponse200;
import com.prokarma.pkmst.model.InlineResponse400;
import org.junit.Test;
import org.junit.Ignore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

/**
 * API tests for ProductConversionApi
 */
@Ignore
public class ProductConversionApiTest {

    private final ObjectMapper objectMapper = new ObjectMapper();

    private final ProductConversionApi api = new ProductConversionApiController(objectMapper);

    private final String accept = "application/json";

    
    /**
     * Convert between UPC, EAN, and ASIN product codes.
     *
     * Returns the converted UPC, EAN, and ASIN codes.
     *
     * @throws Exception
     *          if the Api call fails
     */
    @Test
    public void convertCodeTest() throws Exception {
        String upcEanAsin = null;
    ResponseEntity<InlineResponse200> response = api.convertCode(upcEanAsin , accept);

        // TODO: test validations
    }
    
}
