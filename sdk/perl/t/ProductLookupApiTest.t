=begin comment

Barcodable.com API

Barcodable.com API

The version of the OpenAPI document: 1.5.0
Contact: support@barcodable.com
Generated by: https://openapi-generator.tech

=end comment

=cut

#
# NOTE: This class is auto generated by OpenAPI Generator
# Please update the test cases below to test the API endpoints.
# Ref: https://openapi-generator.tech
#
use Test::More tests => 1; #TODO update number of test cases
use Test::Exception;

use lib 'lib';
use strict;
use warnings;

use_ok('WWW::OpenAPIClient::ProductLookupApi');

my $api = WWW::OpenAPIClient::ProductLookupApi->new();
isa_ok($api, 'WWW::OpenAPIClient::ProductLookupApi');

#
# get_item_by_asin test
#
{
    my $asin = undef; # replace NULL with a proper value
    my $result = $api->get_item_by_asin(asin => $asin);
}

#
# get_item_by_ean test
#
{
    my $ean = undef; # replace NULL with a proper value
    my $result = $api->get_item_by_ean(ean => $ean);
}

#
# get_item_by_upc test
#
{
    my $upc = undef; # replace NULL with a proper value
    my $result = $api->get_item_by_upc(upc => $upc);
}


1;
