--  Barcodable.com API
--  Barcodable.com API
--
--  OpenAPI spec version: 1.5.0
--  Contact: support@barcodable.com
--
--  NOTE: This package is auto generated by the swagger code generator 4.0.0-beta2.
--  https://openapi-generator.tech
--  Do not edit the class manually.
with Swagger.Streams;
package body .Clients is

   --  Convert between UPC, EAN, and ASIN product codes.
   --  Returns the converted UPC, EAN, and ASIN codes.
   procedure Convert_Code
      (Client : in out Client_Type;
       Upc _Pipe ean _Pipe asin : in Swagger.UString;
       Result : out .Models.InlineResponse200Type) is
      URI   : Swagger.Clients.URI_Type;
      Reply : Swagger.Value_Type;
   begin
      Client.Set_Accept ((1 => Swagger.Clients.APPLICATION_JSON));

      URI.Set_Path ("/api/v1/convert/{upc | ean | asin}");
      URI.Set_Path_Param ("upc | ean | asin", Upc _Pipe ean _Pipe asin);
      Client.Call (Swagger.Clients.GET, URI, Reply);
      .Models.Deserialize (Reply, "", Result);
   end Convert_Code;

   --  Find item by asin code
   --  Returns a single item
   procedure Get_Item_By_A_S_I_N
      (Client : in out Client_Type;
       Asin : in Swagger.UString;
       Result : out .Models.ItemType) is
      URI   : Swagger.Clients.URI_Type;
      Reply : Swagger.Value_Type;
   begin
      Client.Set_Accept ((1 => Swagger.Clients.APPLICATION_JSON));

      URI.Set_Path ("/api/v1/asin/{asin}");
      URI.Set_Path_Param ("asin", Asin);
      Client.Call (Swagger.Clients.GET, URI, Reply);
      .Models.Deserialize (Reply, "", Result);
   end Get_Item_By_A_S_I_N;

   --  Find item by UPC code
   --  Returns a single item
   procedure Get_Item_By_E_A_N
      (Client : in out Client_Type;
       Ean : in Swagger.UString;
       Result : out .Models.ItemType) is
      URI   : Swagger.Clients.URI_Type;
      Reply : Swagger.Value_Type;
   begin
      Client.Set_Accept ((1 => Swagger.Clients.APPLICATION_JSON));

      URI.Set_Path ("/api/v1/ean/{ean}");
      URI.Set_Path_Param ("ean", Ean);
      Client.Call (Swagger.Clients.GET, URI, Reply);
      .Models.Deserialize (Reply, "", Result);
   end Get_Item_By_E_A_N;

   --  Find item by UPC code
   --  Returns a single item
   procedure Get_Item_By_U_P_C
      (Client : in out Client_Type;
       Upc : in Swagger.UString;
       Result : out .Models.ItemType) is
      URI   : Swagger.Clients.URI_Type;
      Reply : Swagger.Value_Type;
   begin
      Client.Set_Accept ((1 => Swagger.Clients.APPLICATION_JSON));

      URI.Set_Path ("/api/v1/upc/{upc}");
      URI.Set_Path_Param ("upc", Upc);
      Client.Call (Swagger.Clients.GET, URI, Reply);
      .Models.Deserialize (Reply, "", Result);
   end Get_Item_By_U_P_C;
end .Clients;