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
/* tslint:disable:no-unused-variable member-ordering */

import { Observable } from "rxjs/Observable";
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import IHttpClient from "../IHttpClient";
import { inject, injectable } from "inversify";
import { IAPIConfiguration } from "../IAPIConfiguration";
import { Headers } from "../Headers";
import HttpResponse from "../HttpResponse";

import { InvalidCode } from '../model/invalidCode';
import { Item } from '../model/item';
import { NotFound } from '../model/notFound';

import { COLLECTION_FORMATS }  from '../variables';



@injectable()
export class ProductLookupService {
    private basePath: string = 'https://virtserver.swaggerhub.com/magicCashew/barcodable/1.0.0';

    constructor(@inject("IApiHttpClient") private httpClient: IHttpClient,
        @inject("IAPIConfiguration") private APIConfiguration: IAPIConfiguration ) {
        if(this.APIConfiguration.basePath)
            this.basePath = this.APIConfiguration.basePath;
    }

    /**
     * Find item by asin code
     * Returns a single item
     * @param asin ASIN code of item to return
     
     */
    public getItemByASIN(asin: string, observe?: 'body', headers?: Headers): Observable<Item>;
    public getItemByASIN(asin: string, observe?: 'response', headers?: Headers): Observable<HttpResponse<Item>>;
    public getItemByASIN(asin: string, observe: any = 'body', headers: Headers = {}): Observable<any> {
        if (!asin){
            throw new Error('Required parameter asin was null or undefined when calling getItemByASIN.');
        }

        headers['Accept'] = 'application/json';

        const response: Observable<HttpResponse<Item>> = this.httpClient.get(`${this.basePath}/api/v1/asin/${encodeURIComponent(String(asin))}`, headers);
        if (observe == 'body') {
               return response.map(httpResponse => <Item>(httpResponse.response));
        }
        return response;
    }


    /**
     * Find item by UPC code
     * Returns a single item
     * @param ean EAN code of item to return
     
     */
    public getItemByEAN(ean: string, observe?: 'body', headers?: Headers): Observable<Item>;
    public getItemByEAN(ean: string, observe?: 'response', headers?: Headers): Observable<HttpResponse<Item>>;
    public getItemByEAN(ean: string, observe: any = 'body', headers: Headers = {}): Observable<any> {
        if (!ean){
            throw new Error('Required parameter ean was null or undefined when calling getItemByEAN.');
        }

        headers['Accept'] = 'application/json';

        const response: Observable<HttpResponse<Item>> = this.httpClient.get(`${this.basePath}/api/v1/ean/${encodeURIComponent(String(ean))}`, headers);
        if (observe == 'body') {
               return response.map(httpResponse => <Item>(httpResponse.response));
        }
        return response;
    }


    /**
     * Find item by UPC code
     * Returns a single item
     * @param upc UPC code of item to return
     
     */
    public getItemByUPC(upc: string, observe?: 'body', headers?: Headers): Observable<Item>;
    public getItemByUPC(upc: string, observe?: 'response', headers?: Headers): Observable<HttpResponse<Item>>;
    public getItemByUPC(upc: string, observe: any = 'body', headers: Headers = {}): Observable<any> {
        if (!upc){
            throw new Error('Required parameter upc was null or undefined when calling getItemByUPC.');
        }

        headers['Accept'] = 'application/json';

        const response: Observable<HttpResponse<Item>> = this.httpClient.get(`${this.basePath}/api/v1/upc/${encodeURIComponent(String(upc))}`, headers);
        if (observe == 'body') {
               return response.map(httpResponse => <Item>(httpResponse.response));
        }
        return response;
    }

}