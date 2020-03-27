/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * The version of the OpenAPI document: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI-Generator 4.3.0.
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

/*
 * Invalid_code.h
 *
 * 
 */

#ifndef Invalid_code_H_
#define Invalid_code_H_



#include <string>
#include <memory>
#include <boost/property_tree/ptree.hpp>

namespace org {
namespace openapitools {
namespace server {
namespace model {

/// <summary>
/// 
/// </summary>
class  Invalid_code 
{
public:
    Invalid_code();
    virtual ~Invalid_code();
    
    std::string toJsonString(bool prettyJson = false);
    void fromJsonString(std::string const& jsonString);
    boost::property_tree::ptree toPropertyTree();
    void fromPropertyTree(boost::property_tree::ptree const& pt);

    /////////////////////////////////////////////
    /// Invalid_code members

    /// <summary>
    /// 
    /// </summary>
    std::string getMessage() const;
    void setMessage(std::string value);

    /// <summary>
    /// 
    /// </summary>
    int32_t getStatus() const;
    void setStatus(int32_t value);
protected:
    std::string m_Message;
    int32_t m_Status;
};

}
}
}
}

#endif /* Invalid_code_H_ */