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


#include "Inline_response_200.h"

namespace org {
namespace openapitools {
namespace server {
namespace model {

Inline_response_200::Inline_response_200()
{
    m_UpcsIsSet = false;
    m_EansIsSet = false;
    m_AsinsIsSet = false;
    m_Message = "";
    m_MessageIsSet = false;
    
}

Inline_response_200::~Inline_response_200()
{
}

void Inline_response_200::validate()
{
    // TODO: implement validation
}

nlohmann::json Inline_response_200::toJson() const
{
    nlohmann::json val = nlohmann::json::object();

    {
        nlohmann::json jsonArray;
        for( const auto& item : m_Upcs )
        {
            jsonArray.push_back(ModelBase::toJson(item));
        }
        
        if(jsonArray.size() > 0)
        {
            val["upcs"] = jsonArray;
        } 
    }
    {
        nlohmann::json jsonArray;
        for( const auto& item : m_Eans )
        {
            jsonArray.push_back(ModelBase::toJson(item));
        }
        
        if(jsonArray.size() > 0)
        {
            val["eans"] = jsonArray;
        } 
    }
    {
        nlohmann::json jsonArray;
        for( const auto& item : m_Asins )
        {
            jsonArray.push_back(ModelBase::toJson(item));
        }
        
        if(jsonArray.size() > 0)
        {
            val["asins"] = jsonArray;
        } 
    }
    if(m_MessageIsSet)
    {
        val["message"] = ModelBase::toJson(m_Message);
    }
    

    return val;
}

void Inline_response_200::fromJson(const nlohmann::json& val)
{
    {
        m_Upcs.clear();
        if(val.find("upcs") != val.end())
        {
            for( const auto& item : val["upcs"] )
            {
                m_Upcs.push_back(item);
                
            }
        }
    }
    {
        m_Eans.clear();
        if(val.find("eans") != val.end())
        {
            for( const auto& item : val["eans"] )
            {
                m_Eans.push_back(item);
                
            }
        }
    }
    {
        m_Asins.clear();
        if(val.find("asins") != val.end())
        {
            for( const auto& item : val["asins"] )
            {
                m_Asins.push_back(item);
                
            }
        }
    }
    if(val.find("message") != val.end())
    {
        setMessage(val.at("message"));
    }
    
}


std::vector<std::string>& Inline_response_200::getUpcs()
{
    return m_Upcs;
}
bool Inline_response_200::upcsIsSet() const
{
    return m_UpcsIsSet;
}
void Inline_response_200::unsetUpcs()
{
    m_UpcsIsSet = false;
}
std::vector<std::string>& Inline_response_200::getEans()
{
    return m_Eans;
}
bool Inline_response_200::eansIsSet() const
{
    return m_EansIsSet;
}
void Inline_response_200::unsetEans()
{
    m_EansIsSet = false;
}
std::vector<std::string>& Inline_response_200::getAsins()
{
    return m_Asins;
}
bool Inline_response_200::asinsIsSet() const
{
    return m_AsinsIsSet;
}
void Inline_response_200::unsetAsins()
{
    m_AsinsIsSet = false;
}
std::string Inline_response_200::getMessage() const
{
    return m_Message;
}
void Inline_response_200::setMessage(std::string const& value)
{
    m_Message = value;
    m_MessageIsSet = true;
}
bool Inline_response_200::messageIsSet() const
{
    return m_MessageIsSet;
}
void Inline_response_200::unsetMessage()
{
    m_MessageIsSet = false;
}

}
}
}
}
