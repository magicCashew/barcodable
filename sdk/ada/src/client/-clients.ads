--  Barcodable.com API
--  Barcodable.com API
--
--  OpenAPI spec version: 1.5.0
--  Contact: support@barcodable.com
--
--  NOTE: This package is auto generated by the swagger code generator 4.0.0-beta2.
--  https://openapi-generator.tech
--  Do not edit the class manually.
with .Models;
with Swagger.Clients;
package .Clients is

   type Client_Type is new Swagger.Clients.Client_Type with null record;

   --  Convert between UPC, EAN, and ASIN product codes.
   --  Returns the converted UPC, EAN, and ASIN codes.
   procedure Convert_Code
      (Client : in out Client_Type;
       Upc _Pipe ean _Pipe asin : in Swagger.UString;
       Result : out .Models.InlineResponse200Type);

   --  Find item by asin code
   --  Returns a single item
   procedure Get_Item_By_A_S_I_N
      (Client : in out Client_Type;
       Asin : in Swagger.UString;
       Result : out .Models.ItemType);

   --  Find item by UPC code
   --  Returns a single item
   procedure Get_Item_By_E_A_N
      (Client : in out Client_Type;
       Ean : in Swagger.UString;
       Result : out .Models.ItemType);

   --  Find item by UPC code
   --  Returns a single item
   procedure Get_Item_By_U_P_C
      (Client : in out Client_Type;
       Upc : in Swagger.UString;
       Result : out .Models.ItemType);

end .Clients;
