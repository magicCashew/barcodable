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

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVariantMap>
#include <QDebug>

#include "OAIHelpers.h"
#include "OAIProductLookupApiRequest.h"

namespace OpenAPI {

OAIProductLookupApiRequest::OAIProductLookupApiRequest(QHttpEngine::Socket *s, OAIProductLookupApiHandler* hdl) : QObject(s), socket(s), handler(hdl) {
    auto headers = s->headers();
    for(auto itr = headers.begin(); itr != headers.end(); itr++) {
        requestHeaders.insert(QString(itr.key()), QString(itr.value()));
    }
}

OAIProductLookupApiRequest::~OAIProductLookupApiRequest(){
    disconnect(this, nullptr, nullptr, nullptr);
    qDebug() << "OAIProductLookupApiRequest::~OAIProductLookupApiRequest()";
}

QMap<QString, QString>
OAIProductLookupApiRequest::getRequestHeaders() const {
    return requestHeaders;
}

void OAIProductLookupApiRequest::setResponseHeaders(const QMultiMap<QString, QString>& headers){
    for(auto itr = headers.begin(); itr != headers.end(); ++itr) {
        responseHeaders.insert(itr.key(), itr.value());
    }
}


QHttpEngine::Socket* OAIProductLookupApiRequest::getRawSocket(){
    return socket;
}


void OAIProductLookupApiRequest::getItemByASINRequest(const QString& asinstr){
    qDebug() << "/magicCashew/barcodable/1.0.0/api/v1/asin/{asin}";
    connect(this, &OAIProductLookupApiRequest::getItemByASIN, handler, &OAIProductLookupApiHandler::getItemByASIN);

    
    QString asin;
    fromStringValue(asinstr, asin);
    

    emit getItemByASIN(asin);
}


void OAIProductLookupApiRequest::getItemByEANRequest(const QString& eanstr){
    qDebug() << "/magicCashew/barcodable/1.0.0/api/v1/ean/{ean}";
    connect(this, &OAIProductLookupApiRequest::getItemByEAN, handler, &OAIProductLookupApiHandler::getItemByEAN);

    
    QString ean;
    fromStringValue(eanstr, ean);
    

    emit getItemByEAN(ean);
}


void OAIProductLookupApiRequest::getItemByUPCRequest(const QString& upcstr){
    qDebug() << "/magicCashew/barcodable/1.0.0/api/v1/upc/{upc}";
    connect(this, &OAIProductLookupApiRequest::getItemByUPC, handler, &OAIProductLookupApiHandler::getItemByUPC);

    
    QString upc;
    fromStringValue(upcstr, upc);
    

    emit getItemByUPC(upc);
}



void OAIProductLookupApiRequest::getItemByASINResponse(const OAIItem& res){
    writeResponseHeaders();
    QJsonDocument resDoc(::OpenAPI::toJsonValue(res).toObject());
    socket->writeJson(resDoc);
    if(socket->isOpen()){
        socket->close();
    }
}

void OAIProductLookupApiRequest::getItemByEANResponse(const OAIItem& res){
    writeResponseHeaders();
    QJsonDocument resDoc(::OpenAPI::toJsonValue(res).toObject());
    socket->writeJson(resDoc);
    if(socket->isOpen()){
        socket->close();
    }
}

void OAIProductLookupApiRequest::getItemByUPCResponse(const OAIItem& res){
    writeResponseHeaders();
    QJsonDocument resDoc(::OpenAPI::toJsonValue(res).toObject());
    socket->writeJson(resDoc);
    if(socket->isOpen()){
        socket->close();
    }
}


void OAIProductLookupApiRequest::getItemByASINError(const OAIItem& res, QNetworkReply::NetworkError error_type, QString& error_str){
    Q_UNUSED(error_type); // TODO: Remap error_type to QHttpEngine::Socket errors
    writeResponseHeaders();
    Q_UNUSED(error_str);  // response will be used instead of error string
    QJsonDocument resDoc(::OpenAPI::toJsonValue(res).toObject());
    socket->writeJson(resDoc);
    if(socket->isOpen()){
        socket->close();
    }
}

void OAIProductLookupApiRequest::getItemByEANError(const OAIItem& res, QNetworkReply::NetworkError error_type, QString& error_str){
    Q_UNUSED(error_type); // TODO: Remap error_type to QHttpEngine::Socket errors
    writeResponseHeaders();
    Q_UNUSED(error_str);  // response will be used instead of error string
    QJsonDocument resDoc(::OpenAPI::toJsonValue(res).toObject());
    socket->writeJson(resDoc);
    if(socket->isOpen()){
        socket->close();
    }
}

void OAIProductLookupApiRequest::getItemByUPCError(const OAIItem& res, QNetworkReply::NetworkError error_type, QString& error_str){
    Q_UNUSED(error_type); // TODO: Remap error_type to QHttpEngine::Socket errors
    writeResponseHeaders();
    Q_UNUSED(error_str);  // response will be used instead of error string
    QJsonDocument resDoc(::OpenAPI::toJsonValue(res).toObject());
    socket->writeJson(resDoc);
    if(socket->isOpen()){
        socket->close();
    }
}


void OAIProductLookupApiRequest::sendCustomResponse(QByteArray & res, QNetworkReply::NetworkError error_type){
    Q_UNUSED(error_type); // TODO
    socket->write(res);
    if(socket->isOpen()){
        socket->close();
    }    
}

void OAIProductLookupApiRequest::sendCustomResponse(QIODevice *res, QNetworkReply::NetworkError error_type){
    Q_UNUSED(error_type);  // TODO
    socket->write(res->readAll());
    if(socket->isOpen()){
        socket->close();
    }
}

}