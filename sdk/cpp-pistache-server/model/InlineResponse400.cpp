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


#include "Inline_response_400.h"

namespace org {
namespace openapitools {
namespace server {
namespace model {

Inline_response_400::Inline_response_400()
{
    m_Message = "";
    m_MessageIsSet = false;
    m_Status = 0;
    m_StatusIsSet = false;
    
}

Inline_response_400::~Inline_response_400()
{
}

void Inline_response_400::validate()
{
    // TODO: implement validation
}

nlohmann::json Inline_response_400::toJson() const
{
    nlohmann::json val = nlohmann::json::object();

    if(m_MessageIsSet)
    {
        val["message"] = ModelBase::toJson(m_Message);
    }
    if(m_StatusIsSet)
    {
        val["status"] = m_Status;
    }
    

    return val;
}

void Inline_response_400::fromJson(const nlohmann::json& val)
{
    if(val.find("message") != val.end())
    {
        setMessage(val.at("message"));
    }
    if(val.find("status") != val.end())
    {
        setStatus(val.at("status"));
    }
    
}


std::string Inline_response_400::getMessage() const
{
    return m_Message;
}
void Inline_response_400::setMessage(std::string const& value)
{
    m_Message = value;
    m_MessageIsSet = true;
}
bool Inline_response_400::messageIsSet() const
{
    return m_MessageIsSet;
}
void Inline_response_400::unsetMessage()
{
    m_MessageIsSet = false;
}
int32_t Inline_response_400::getStatus() const
{
    return m_Status;
}
void Inline_response_400::setStatus(int32_t const value)
{
    m_Status = value;
    m_StatusIsSet = true;
}
bool Inline_response_400::statusIsSet() const
{
    return m_StatusIsSet;
}
void Inline_response_400::unsetStatus()
{
    m_StatusIsSet = false;
}

}
}
}
}
