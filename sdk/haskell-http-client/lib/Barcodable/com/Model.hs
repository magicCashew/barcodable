{-
   Barcodable.com API

   Barcodable.com API

   OpenAPI Version: 3.0.0
   Barcodable.com API API version: 1.5.0
   Contact: support@barcodable.com
   Generated by OpenAPI Generator (https://openapi-generator.tech)
-}

{-|
Module : Barcodable.com.Model
-}

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-matches -fno-warn-unused-binds -fno-warn-unused-imports #-}

module Barcodable.com.Model where

import Barcodable.com.Core
import Barcodable.com.MimeTypes

import Data.Aeson ((.:),(.:!),(.:?),(.=))

import qualified Control.Arrow as P (left)
import qualified Data.Aeson as A
import qualified Data.ByteString as B
import qualified Data.ByteString.Base64 as B64
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as BL
import qualified Data.Data as P (Typeable, TypeRep, typeOf, typeRep)
import qualified Data.Foldable as P
import qualified Data.HashMap.Lazy as HM
import qualified Data.Map as Map
import qualified Data.Maybe as P
import qualified Data.Set as Set
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Time as TI
import qualified Lens.Micro as L
import qualified Web.FormUrlEncoded as WH
import qualified Web.HttpApiData as WH

import Control.Applicative ((<|>))
import Control.Applicative (Alternative)
import Data.Function ((&))
import Data.Monoid ((<>))
import Data.Text (Text)
import Prelude (($),(/=),(.),(<$>),(<*>),(>>=),(=<<),Maybe(..),Bool(..),Char,Double,FilePath,Float,Int,Integer,String,fmap,undefined,mempty,maybe,pure,Monad,Applicative,Functor)

import qualified Prelude as P



-- * Parameter newtypes


-- ** Asin
newtype Asin = Asin { unAsin :: Text } deriving (P.Eq, P.Show)

-- ** Ean
newtype Ean = Ean { unEan :: Text } deriving (P.Eq, P.Show)

-- ** Upc
newtype Upc = Upc { unUpc :: Text } deriving (P.Eq, P.Show)

-- ** UpcEanAsin
newtype UpcEanAsin = UpcEanAsin { unUpcEanAsin :: Text } deriving (P.Eq, P.Show)

-- * Models


-- ** InlineResponse200
-- | InlineResponse200
data InlineResponse200 = InlineResponse200
  { inlineResponse200Upcs :: !(Maybe [Text]) -- ^ "upcs" - A list of UPCs
  , inlineResponse200Eans :: !(Maybe [Text]) -- ^ "eans" - A list of EANs
  , inlineResponse200Asins :: !(Maybe [Text]) -- ^ "asins" - A list of ASINs
  , inlineResponse200Message :: !(Maybe Text) -- ^ "message"
  } deriving (P.Show, P.Eq, P.Typeable)

-- | FromJSON InlineResponse200
instance A.FromJSON InlineResponse200 where
  parseJSON = A.withObject "InlineResponse200" $ \o ->
    InlineResponse200
      <$> (o .:? "upcs")
      <*> (o .:? "eans")
      <*> (o .:? "asins")
      <*> (o .:? "message")

-- | ToJSON InlineResponse200
instance A.ToJSON InlineResponse200 where
  toJSON InlineResponse200 {..} =
   _omitNulls
      [ "upcs" .= inlineResponse200Upcs
      , "eans" .= inlineResponse200Eans
      , "asins" .= inlineResponse200Asins
      , "message" .= inlineResponse200Message
      ]


-- | Construct a value of type 'InlineResponse200' (by applying it's required fields, if any)
mkInlineResponse200
  :: InlineResponse200
mkInlineResponse200 =
  InlineResponse200
  { inlineResponse200Upcs = Nothing
  , inlineResponse200Eans = Nothing
  , inlineResponse200Asins = Nothing
  , inlineResponse200Message = Nothing
  }

-- ** InlineResponse400
-- | InlineResponse400
data InlineResponse400 = InlineResponse400
  { inlineResponse400Message :: !(Maybe Text) -- ^ "message"
  , inlineResponse400Status :: !(Maybe Int) -- ^ "status"
  } deriving (P.Show, P.Eq, P.Typeable)

-- | FromJSON InlineResponse400
instance A.FromJSON InlineResponse400 where
  parseJSON = A.withObject "InlineResponse400" $ \o ->
    InlineResponse400
      <$> (o .:? "message")
      <*> (o .:? "status")

-- | ToJSON InlineResponse400
instance A.ToJSON InlineResponse400 where
  toJSON InlineResponse400 {..} =
   _omitNulls
      [ "message" .= inlineResponse400Message
      , "status" .= inlineResponse400Status
      ]


-- | Construct a value of type 'InlineResponse400' (by applying it's required fields, if any)
mkInlineResponse400
  :: InlineResponse400
mkInlineResponse400 =
  InlineResponse400
  { inlineResponse400Message = Nothing
  , inlineResponse400Status = Nothing
  }

-- ** InvalidCode
-- | InvalidCode
data InvalidCode = InvalidCode
  { invalidCodeMessage :: !(Maybe Text) -- ^ "message"
  , invalidCodeStatus :: !(Maybe Int) -- ^ "status"
  } deriving (P.Show, P.Eq, P.Typeable)

-- | FromJSON InvalidCode
instance A.FromJSON InvalidCode where
  parseJSON = A.withObject "InvalidCode" $ \o ->
    InvalidCode
      <$> (o .:? "message")
      <*> (o .:? "status")

-- | ToJSON InvalidCode
instance A.ToJSON InvalidCode where
  toJSON InvalidCode {..} =
   _omitNulls
      [ "message" .= invalidCodeMessage
      , "status" .= invalidCodeStatus
      ]


-- | Construct a value of type 'InvalidCode' (by applying it's required fields, if any)
mkInvalidCode
  :: InvalidCode
mkInvalidCode =
  InvalidCode
  { invalidCodeMessage = Nothing
  , invalidCodeStatus = Nothing
  }

-- ** Item
-- | Item
data Item = Item
  { itemUpc :: !(Maybe Text) -- ^ "upc"
  , itemEan :: !(Maybe Text) -- ^ "ean"
  , itemIsbn :: !(Maybe Text) -- ^ "isbn"
  , itemAsin :: !(Maybe Text) -- ^ "asin"
  , itemTitle :: !(Maybe Text) -- ^ "title"
  , itemSku :: !(Maybe Text) -- ^ "sku"
  , itemMpn :: !(Maybe Text) -- ^ "mpn"
  , itemPartNumber :: !(Maybe Text) -- ^ "part_number"
  , itemUpcs :: !(Maybe [Text]) -- ^ "upcs" - A list of matching upc codes.
  , itemDescription :: !(Maybe Text) -- ^ "description"
  , itemBrand :: !(Maybe Text) -- ^ "brand"
  , itemManufacturer :: !(Maybe Text) -- ^ "manufacturer"
  , itemColor :: !(Maybe Text) -- ^ "color"
  , itemNewPrice :: !(Maybe Double) -- ^ "new_price"
  , itemUsedPrice :: !(Maybe Double) -- ^ "used_price"
  , itemCurrencyCode :: !(Maybe Text) -- ^ "currency_code"
  , itemUrl :: !(Maybe Text) -- ^ "url"
  , itemFeatures :: !(Maybe [Text]) -- ^ "features" - A list of product feature descriptions.
  , itemDimensions :: !(Maybe [A.Value]) -- ^ "dimensions" - Product dimensions and weight.  (&#39;meters&#39;, &#39;centimeters&#39;, &#39;millimeters&#39;, &#39;inches&#39;, &#39;feet&#39;, &#39;yards&#39;, &#39;ounces&#39;, &#39;pounds&#39;, &#39;grams&#39;, &#39;milligrams&#39;, &#39;kilograms&#39;)
  , itemImages :: !(Maybe [Text]) -- ^ "images" - A list product images.
  , itemMatchedItems :: !(Maybe [A.Value]) -- ^ "matched_items" - Matched items for this product.
  , itemIsoCountryCodes :: !(Maybe [Text]) -- ^ "iso_country_codes" - A list of country codes from which this item belongs.
  , itemCompanyName :: !(Maybe Text) -- ^ "company_name" - The company name registered to the product&#39;s UPC or EAN.
  , itemCompanyAddress :: !(Maybe Text) -- ^ "company_address" - The company address registered to the product&#39;s UPC or EAN.
  , itemCategories :: !(Maybe [Text]) -- ^ "categories" - A list of categories for this product.
  , itemCategoryHierarchies :: !(Maybe [Text]) -- ^ "category_hierarchies" - A list of category hierarchies for this product. Categories are listed in order of generic category to most specific category.
  } deriving (P.Show, P.Eq, P.Typeable)

-- | FromJSON Item
instance A.FromJSON Item where
  parseJSON = A.withObject "Item" $ \o ->
    Item
      <$> (o .:? "upc")
      <*> (o .:? "ean")
      <*> (o .:? "isbn")
      <*> (o .:? "asin")
      <*> (o .:? "title")
      <*> (o .:? "sku")
      <*> (o .:? "mpn")
      <*> (o .:? "part_number")
      <*> (o .:? "upcs")
      <*> (o .:? "description")
      <*> (o .:? "brand")
      <*> (o .:? "manufacturer")
      <*> (o .:? "color")
      <*> (o .:? "new_price")
      <*> (o .:? "used_price")
      <*> (o .:? "currency_code")
      <*> (o .:? "url")
      <*> (o .:? "features")
      <*> (o .:? "dimensions")
      <*> (o .:? "images")
      <*> (o .:? "matched_items")
      <*> (o .:? "iso_country_codes")
      <*> (o .:? "company_name")
      <*> (o .:? "company_address")
      <*> (o .:? "categories")
      <*> (o .:? "category_hierarchies")

-- | ToJSON Item
instance A.ToJSON Item where
  toJSON Item {..} =
   _omitNulls
      [ "upc" .= itemUpc
      , "ean" .= itemEan
      , "isbn" .= itemIsbn
      , "asin" .= itemAsin
      , "title" .= itemTitle
      , "sku" .= itemSku
      , "mpn" .= itemMpn
      , "part_number" .= itemPartNumber
      , "upcs" .= itemUpcs
      , "description" .= itemDescription
      , "brand" .= itemBrand
      , "manufacturer" .= itemManufacturer
      , "color" .= itemColor
      , "new_price" .= itemNewPrice
      , "used_price" .= itemUsedPrice
      , "currency_code" .= itemCurrencyCode
      , "url" .= itemUrl
      , "features" .= itemFeatures
      , "dimensions" .= itemDimensions
      , "images" .= itemImages
      , "matched_items" .= itemMatchedItems
      , "iso_country_codes" .= itemIsoCountryCodes
      , "company_name" .= itemCompanyName
      , "company_address" .= itemCompanyAddress
      , "categories" .= itemCategories
      , "category_hierarchies" .= itemCategoryHierarchies
      ]


-- | Construct a value of type 'Item' (by applying it's required fields, if any)
mkItem
  :: Item
mkItem =
  Item
  { itemUpc = Nothing
  , itemEan = Nothing
  , itemIsbn = Nothing
  , itemAsin = Nothing
  , itemTitle = Nothing
  , itemSku = Nothing
  , itemMpn = Nothing
  , itemPartNumber = Nothing
  , itemUpcs = Nothing
  , itemDescription = Nothing
  , itemBrand = Nothing
  , itemManufacturer = Nothing
  , itemColor = Nothing
  , itemNewPrice = Nothing
  , itemUsedPrice = Nothing
  , itemCurrencyCode = Nothing
  , itemUrl = Nothing
  , itemFeatures = Nothing
  , itemDimensions = Nothing
  , itemImages = Nothing
  , itemMatchedItems = Nothing
  , itemIsoCountryCodes = Nothing
  , itemCompanyName = Nothing
  , itemCompanyAddress = Nothing
  , itemCategories = Nothing
  , itemCategoryHierarchies = Nothing
  }

-- ** NotFound
-- | NotFound
data NotFound = NotFound
  { notFoundMessage :: !(Maybe Text) -- ^ "message"
  , notFoundStatus :: !(Maybe Int) -- ^ "status"
  } deriving (P.Show, P.Eq, P.Typeable)

-- | FromJSON NotFound
instance A.FromJSON NotFound where
  parseJSON = A.withObject "NotFound" $ \o ->
    NotFound
      <$> (o .:? "message")
      <*> (o .:? "status")

-- | ToJSON NotFound
instance A.ToJSON NotFound where
  toJSON NotFound {..} =
   _omitNulls
      [ "message" .= notFoundMessage
      , "status" .= notFoundStatus
      ]


-- | Construct a value of type 'NotFound' (by applying it's required fields, if any)
mkNotFound
  :: NotFound
mkNotFound =
  NotFound
  { notFoundMessage = Nothing
  , notFoundStatus = Nothing
  }




-- * Auth Methods

-- ** AuthApiKeyApiKeyAuth
data AuthApiKeyApiKeyAuth =
  AuthApiKeyApiKeyAuth Text -- ^ secret
  deriving (P.Eq, P.Show, P.Typeable)

instance AuthMethod AuthApiKeyApiKeyAuth where
  applyAuthMethod _ a@(AuthApiKeyApiKeyAuth secret) req =
    P.pure $
    if (P.typeOf a `P.elem` rAuthTypes req)
      then req `setHeader` toHeader ("Authorization", secret)
           & L.over rAuthTypesL (P.filter (/= P.typeOf a))
      else req

