/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * The version of the OpenAPI document: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


package org.openapitools.api;

import org.openapitools.model.InvalidCode;
import org.openapitools.model.Item;
import org.openapitools.model.NotFound;
import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.apache.cxf.jaxrs.client.JAXRSClientFactory;
import org.apache.cxf.jaxrs.client.ClientConfiguration;
import org.apache.cxf.jaxrs.client.WebClient;
import org.apache.cxf.jaxrs.ext.multipart.Attachment;


import com.fasterxml.jackson.jaxrs.json.JacksonJsonProvider;
import com.fasterxml.jackson.jaxrs.xml.JacksonXMLProvider;
import org.apache.cxf.jaxrs.provider.MultipartProvider;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * Barcodable.com API
 *
 * <p>Barcodable.com API
 *
 * API tests for ProductLookupApi.
 */
public class ProductLookupApiTest {

    private ProductLookupApi api;

    @Before
    public void setup() {
        List<?> providers = Arrays.asList(new JacksonJsonProvider(), new JacksonXMLProvider(), new MultipartProvider());

        api = JAXRSClientFactory.create("https://virtserver.swaggerhub.com/magicCashew/barcodable/1.0.0", ProductLookupApi.class, providers);
        org.apache.cxf.jaxrs.client.Client client = WebClient.client(api);

        ClientConfiguration config = WebClient.getConfig(client); 
    }

    
    /**
     * Find item by asin code
     *
     * Returns a single item
     *
     * @throws ApiException if the API call fails
     */
    @Test
    public void getItemByASINTest() throws Exception {
        // TODO: assign appropriate parameter values
        String asin = null;

        // TODO: delete this line and uncomment the next
        // Item response = api.getItemByASIN(asin);
        // TODO: complete test assertions
    }
    
    /**
     * Find item by UPC code
     *
     * Returns a single item
     *
     * @throws ApiException if the API call fails
     */
    @Test
    public void getItemByEANTest() throws Exception {
        // TODO: assign appropriate parameter values
        String ean = null;

        // TODO: delete this line and uncomment the next
        // Item response = api.getItemByEAN(ean);
        // TODO: complete test assertions
    }
    
    /**
     * Find item by UPC code
     *
     * Returns a single item
     *
     * @throws ApiException if the API call fails
     */
    @Test
    public void getItemByUPCTest() throws Exception {
        // TODO: assign appropriate parameter values
        String upc = null;

        // TODO: delete this line and uncomment the next
        // Item response = api.getItemByUPC(upc);
        // TODO: complete test assertions
    }
    
}
