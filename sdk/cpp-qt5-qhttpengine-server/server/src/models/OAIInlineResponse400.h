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

/*
 * OAIInline_response_400.h
 *
 * 
 */

#ifndef OAIInline_response_400_H
#define OAIInline_response_400_H

#include <QJsonObject>


#include <QString>

#include "OAIObject.h"

namespace OpenAPI {

class OAIInline_response_400: public OAIObject {
public:
    OAIInline_response_400();
    OAIInline_response_400(QString json);
    ~OAIInline_response_400() override;

    QString asJson () const override;
    QJsonObject asJsonObject() const override;
    void fromJsonObject(QJsonObject json) override;
    void fromJson(QString jsonString) override;

    QString getMessage() const;
    void setMessage(const QString &message);

    qint32 getStatus() const;
    void setStatus(const qint32 &status);

    virtual bool isSet() const override;
    virtual bool isValid() const override;

private:
    void init();
    QString message;
    bool m_message_isSet;
    bool m_message_isValid;
    qint32 status;
    bool m_status_isSet;
    bool m_status_isValid;
};

}

#endif // OAIInline_response_400_H