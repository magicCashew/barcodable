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



#include "Inline_response_200.h"

#include <string>
#include <sstream>
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

using boost::property_tree::ptree;
using boost::property_tree::read_json;
using boost::property_tree::write_json;

namespace org {
namespace openapitools {
namespace server {
namespace model {

Inline_response_200::Inline_response_200()
{
    m_Message = "";
    
}

Inline_response_200::~Inline_response_200()
{
}

std::string Inline_response_200::toJsonString()
{
	std::stringstream ss;
	ptree pt;
	pt.put("Message", m_Message);
	write_json(ss, pt, false);
	return ss.str();
}

void Inline_response_200::fromJsonString(std::string const& jsonString)
{
	std::stringstream ss(jsonString);
	ptree pt;
	read_json(ss,pt);
	m_Message = pt.get("Message", "");
}

std::vector<std::string> Inline_response_200::getUpcs() const
{
    return m_Upcs;
}
void Inline_response_200::setUpcs(std::vector<std::string> value)
{
    m_Upcs = value;
}
std::vector<std::string> Inline_response_200::getEans() const
{
    return m_Eans;
}
void Inline_response_200::setEans(std::vector<std::string> value)
{
    m_Eans = value;
}
std::vector<std::string> Inline_response_200::getAsins() const
{
    return m_Asins;
}
void Inline_response_200::setAsins(std::vector<std::string> value)
{
    m_Asins = value;
}
std::string Inline_response_200::getMessage() const
{
    return m_Message;
}
void Inline_response_200::setMessage(std::string value)
{
    m_Message = value;
}

}
}
}
}
