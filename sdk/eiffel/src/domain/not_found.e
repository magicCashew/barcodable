note
 description:"[
		Barcodable.com API
 		Barcodable.com API
  		OpenAPI spec version: 1.5.0
 	    Contact: support@barcodable.com

  	NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).

 		 Do not edit the class manually.
 	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS:"Eiffel openapi generator", "src=https://openapi-generator.tech", "protocol=uri"
class NOT_FOUND 

inherit

  ANY
      redefine
          out 
      end


feature --Access

    message: detachable STRING_32 
      
    status: INTEGER_32 
      

feature -- Change Element  
 
    set_message (a_name: like message)
        -- Set 'message' with 'a_name'.
      do
        message := a_name
      ensure
        message_set: message = a_name		
      end

    set_status (a_name: like status)
        -- Set 'status' with 'a_name'.
      do
        status := a_name
      ensure
        status_set: status = a_name		
      end


 feature -- Status Report

    out: STRING
          -- <Precursor>
      do
        create Result.make_empty
        Result.append("%Nclass NOT_FOUND%N")
        if attached message as l_message then
          Result.append ("%Nmessage:")
          Result.append (l_message.out)
          Result.append ("%N")    
        end  
        if attached status as l_status then
          Result.append ("%Nstatus:")
          Result.append (l_status.out)
          Result.append ("%N")    
        end  
      end
end


