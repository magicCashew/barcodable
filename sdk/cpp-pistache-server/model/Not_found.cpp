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
*/


#include "Not_found.h"

namespace org {
namespace openapitools {
namespace server {
namespace model {

Not_found::Not_found()
{
    m_Message = "";
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

void to_json(nlohmann::json& j, const Not_found& o)
{
    j = nlohmann::json();
    if(o.messageIsSet())
        j["message"] = o.m_Message;
    if(o.statusIsSet())
        j["status"] = o.m_Status;
}

void from_json(const nlohmann::json& j, Not_found& o)
{
    if(j.find("message") != j.end())
    {
        j.at("message").get_to(o.m_Message);
        o.m_MessageIsSet = true;
    } 
    if(j.find("status") != j.end())
    {
        j.at("status").get_to(o.m_Status);
        o.m_StatusIsSet = true;
    } 
}

std::string Not_found::getMessage() const
{
    return m_Message;
}
void Not_found::setMessage(std::string const& value)
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
void Not_found::setStatus(int32_t const value)
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
