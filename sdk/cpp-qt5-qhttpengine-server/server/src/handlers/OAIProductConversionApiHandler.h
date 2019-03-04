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

#ifndef OAI_OAIProductConversionApiHandler_H
#define OAI_OAIProductConversionApiHandler_H

#include <QObject>

#include "OAIInline_response_200.h"
#include "OAIInline_response_400.h"
#include <QString>

namespace OpenAPI {

class OAIProductConversionApiHandler : public QObject
{
    Q_OBJECT
    
public:
    OAIProductConversionApiHandler();
    virtual ~OAIProductConversionApiHandler();


public slots:
    virtual void convertCode(QString upc___ean___asin);
    

};

}

#endif // OAI_OAIProductConversionApiHandler_H