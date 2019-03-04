/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * OpenAPI spec version: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI-Generator 4.0.0-beta2.
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */



#include "Not_found.h"

namespace org {
namespace openapitools {
namespace client {
namespace model {

Not_found::Not_found()
{
    m_Message = utility::conversions::to_string_t("");
    m_MessageIsSet = false;
    m_Status = 0;
    m_StatusIsSet = false;
}

Not_found::~Not_found()
{
}

void Not_found::validate()
{
    // TODO: implement validation
}

web::json::value Not_found::toJson() const
{
    web::json::value val = web::json::value::object();

    if(m_MessageIsSet)
    {
        val[utility::conversions::to_string_t("message")] = ModelBase::toJson(m_Message);
    }
    if(m_StatusIsSet)
    {
        val[utility::conversions::to_string_t("status")] = ModelBase::toJson(m_Status);
    }

    return val;
}

void Not_found::fromJson(const web::json::value& val)
{
    if(val.has_field(utility::conversions::to_string_t("message")))
    {
        const web::json::value& fieldValue = val.at(utility::conversions::to_string_t("message"));
        if(!fieldValue.is_null())
        {
            setMessage(ModelBase::stringFromJson(fieldValue));
        }
    }
    if(val.has_field(utility::conversions::to_string_t("status")))
    {
        const web::json::value& fieldValue = val.at(utility::conversions::to_string_t("status"));
        if(!fieldValue.is_null())
        {
            setStatus(ModelBase::int32_tFromJson(fieldValue));
        }
    }
}

void Not_found::toMultipart(std::shared_ptr<MultipartFormData> multipart, const utility::string_t& prefix) const
{
    utility::string_t namePrefix = prefix;
    if(namePrefix.size() > 0 && namePrefix.substr(namePrefix.size() - 1) != utility::conversions::to_string_t("."))
    {
        namePrefix += utility::conversions::to_string_t(".");
    }

    if(m_MessageIsSet)
    {
        multipart->add(ModelBase::toHttpContent(namePrefix + utility::conversions::to_string_t("message"), m_Message));
    }
    if(m_StatusIsSet)
    {
        multipart->add(ModelBase::toHttpContent(namePrefix + utility::conversions::to_string_t("status"), m_Status));
    }
}

void Not_found::fromMultiPart(std::shared_ptr<MultipartFormData> multipart, const utility::string_t& prefix)
{
    utility::string_t namePrefix = prefix;
    if(namePrefix.size() > 0 && namePrefix.substr(namePrefix.size() - 1) != utility::conversions::to_string_t("."))
    {
        namePrefix += utility::conversions::to_string_t(".");
    }

    if(multipart->hasContent(utility::conversions::to_string_t("message")))
    {
        setMessage(ModelBase::stringFromHttpContent(multipart->getContent(utility::conversions::to_string_t("message"))));
    }
    if(multipart->hasContent(utility::conversions::to_string_t("status")))
    {
        setStatus(ModelBase::int32_tFromHttpContent(multipart->getContent(utility::conversions::to_string_t("status"))));
    }
}

utility::string_t Not_found::getMessage() const
{
    return m_Message;
}

void Not_found::setMessage(const utility::string_t& value)
{
    m_Message = value;
    m_MessageIsSet = true;
}

bool Not_found::messageIsSet() const
{
    return m_MessageIsSet;
}

void Not_found::unsetMessage()
{
    m_MessageIsSet = false;
}

int32_t Not_found::getStatus() const
{
    return m_Status;
}

void Not_found::setStatus(int32_t value)
{
    m_Status = value;
    m_StatusIsSet = true;
}

bool Not_found::statusIsSet() const
{
    return m_StatusIsSet;
}

void Not_found::unsetStatus()
{
    m_StatusIsSet = false;
}

}
}
}
}
