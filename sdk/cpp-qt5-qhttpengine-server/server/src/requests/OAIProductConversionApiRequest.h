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

#ifndef OAI_OAIProductConversionApiRequest_H
#define OAI_OAIProductConversionApiRequest_H

#include <QObject>
#include <QStringList>
#include <QMultiMap>
#include <QNetworkReply>
#include <QSharedPointer>

#include <qhttpengine/socket.h>
#include "OAIInline_response_200.h"
#include "OAIInline_response_400.h"
#include <QString>
#include "OAIProductConversionApiHandler.h"

namespace OpenAPI {

class OAIProductConversionApiRequest : public QObject
{
    Q_OBJECT

public:
    OAIProductConversionApiRequest(QHttpEngine::Socket *s, OAIProductConversionApiHandler* handler);
    virtual ~OAIProductConversionApiRequest();

    void convertCodeRequest(const QString& upc___ean___asin);
    

    void convertCodeResponse(const OAIInline_response_200& res);
    

    void convertCodeError(const OAIInline_response_200& res, QNetworkReply::NetworkError error_type, QString& error_str);
    

    void sendCustomResponse(QByteArray & res, QNetworkReply::NetworkError error_type);

    void sendCustomResponse(QIODevice *res, QNetworkReply::NetworkError error_type);

    QMap<QString, QString> getRequestHeaders() const;

    QHttpEngine::Socket* getRawSocket();

    void setResponseHeaders(const QMultiMap<QString,QString>& headers);

signals:
    void convertCode(QString upc___ean___asin);
    

private:
    QMap<QString, QString> requestHeaders;
    QMap<QString, QString> responseHeaders;
    QHttpEngine::Socket  *socket;
    OAIProductConversionApiHandler *handler;

    inline void writeResponseHeaders(){
        QHttpEngine::Socket::HeaderMap resHeaders;
        for(auto itr = responseHeaders.begin(); itr != responseHeaders.end(); ++itr) {
            resHeaders.insert(itr.key().toUtf8(), itr.value().toUtf8());
        }
        socket->setHeaders(resHeaders);
        socket->writeHeaders();
    }
};

}

#endif // OAI_OAIProductConversionApiRequest_H