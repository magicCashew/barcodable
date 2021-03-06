<?php

/**
 * SlimRouter
 *
 * PHP version 7.1
 *
 * @package OpenAPIServer
 * @author  OpenAPI Generator team
 * @link    https://github.com/openapitools/openapi-generator
 */

/**
 * Barcodable.com API
 *
 * Barcodable.com API
 * The version of the OpenAPI document: 1.5.0
 * Contact: support@barcodable.com
 * Generated by: https://github.com/openapitools/openapi-generator.git
 */

/**
 * NOTE: This class is auto generated by the openapi generator program.
 * https://github.com/openapitools/openapi-generator
 * Do not edit the class manually.
 */
namespace OpenAPIServer;

use Slim\Factory\AppFactory;
use Slim\Interfaces\RouteInterface;
use Psr\Container\ContainerInterface;
use InvalidArgumentException;
use Dyorg\TokenAuthentication;
use Dyorg\TokenAuthentication\TokenSearch;
use Psr\Http\Message\ServerRequestInterface;
use OpenAPIServer\Middleware\JsonBodyParserMiddleware;
use OpenAPIServer\Mock\OpenApiDataMocker;
use OpenAPIServer\Mock\OpenApiDataMockerMiddleware;
use Exception;

/**
 * SlimRouter Class Doc Comment
 *
 * @package OpenAPIServer
 * @author  OpenAPI Generator team
 * @link    https://github.com/openapitools/openapi-generator
 */
class SlimRouter
{

    /** @var App instance */
    private $slimApp;

    /** @var array[] list of all api operations */
    private $operations = [
        [
            'httpMethod' => 'GET',
            'basePathWithoutHost' => '/magicCashew/barcodable/1.0.0',
            'path' => '/api/v1/convert/{upc%20%7C%20ean%20%7C%20asin}',
            'apiPackage' => 'OpenAPIServer\Api',
            'classname' => 'AbstractProductConversionApi',
            'userClassname' => 'ProductConversionApi',
            'operationId' => 'convertCode',
            'responses' => [
                'default' => [
                    'code' => 200,
                    'message' => 'successful operation',
                    'jsonSchema' => '{
  "description" : "successful operation",
  "headers" : {
    "X-ValidAuthorization" : {
      "description" : "A boolean indicating whether the API key in use is valid. Requests with an invalid subscription, incorrect key, or no key will return 'false'.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "boolean"
      }
    },
    "X-RateLimit-Limit" : {
      "description" : "An integer specifying the number of requests available per day. This number is definied by your subscription plan.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Remaining" : {
      "description" : "An integer specifying the number of remaining requests per day.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Reset" : {
      "description" : "A timestamp specifying the time in which the daily rate limit is reset.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "string",
        "format" : "date-time"
      }
    }
  },
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/inline_response_200"
      }
    }
  }
}',
                ],
                '400' => [
                    'code' => 400,
                    'message' => 'search results matching criteria',
                    'jsonSchema' => '{
  "description" : "search results matching criteria",
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/inline_response_400"
      }
    }
  }
}',
                ],
            ],
            'authMethods' => [
            ],
        ],
        [
            'httpMethod' => 'GET',
            'basePathWithoutHost' => '/magicCashew/barcodable/1.0.0',
            'path' => '/api/v1/asin/{asin}',
            'apiPackage' => 'OpenAPIServer\Api',
            'classname' => 'AbstractProductLookupApi',
            'userClassname' => 'ProductLookupApi',
            'operationId' => 'getItemByASIN',
            'responses' => [
                'default' => [
                    'code' => 200,
                    'message' => 'successful operation',
                    'jsonSchema' => '{
  "description" : "successful operation",
  "headers" : {
    "X-ValidAuthorization" : {
      "description" : "A boolean indicating whether the API key in use is valid. Requests with an invalid subscription, incorrect key, or no key will return 'false'.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "boolean"
      }
    },
    "X-RateLimit-Limit" : {
      "description" : "An integer specifying the number of requests available per day. This number is definied by your subscription plan.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Remaining" : {
      "description" : "An integer specifying the number of remaining requests per day.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Reset" : {
      "description" : "A timestamp specifying the time in which the daily rate limit is reset.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "string",
        "format" : "date-time"
      }
    }
  },
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/item"
      }
    }
  }
}',
                ],
                '400' => [
                    'code' => 400,
                    'message' => 'search results matching criteria',
                    'jsonSchema' => '{
  "description" : "search results matching criteria",
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/invalid_code"
      }
    }
  }
}',
                ],
                '404' => [
                    'code' => 404,
                    'message' => 'search results matching criteria',
                    'jsonSchema' => '{
  "description" : "search results matching criteria",
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/not_found"
      }
    }
  }
}',
                ],
            ],
            'authMethods' => [
            ],
        ],
        [
            'httpMethod' => 'GET',
            'basePathWithoutHost' => '/magicCashew/barcodable/1.0.0',
            'path' => '/api/v1/ean/{ean}',
            'apiPackage' => 'OpenAPIServer\Api',
            'classname' => 'AbstractProductLookupApi',
            'userClassname' => 'ProductLookupApi',
            'operationId' => 'getItemByEAN',
            'responses' => [
                'default' => [
                    'code' => 200,
                    'message' => 'successful operation',
                    'jsonSchema' => '{
  "description" : "successful operation",
  "headers" : {
    "X-ValidAuthorization" : {
      "description" : "A boolean indicating whether the API key in use is valid. Requests with an invalid subscription, incorrect key, or no key will return 'false'.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "boolean"
      }
    },
    "X-RateLimit-Limit" : {
      "description" : "An integer specifying the number of requests available per day. This number is definied by your subscription plan.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Remaining" : {
      "description" : "An integer specifying the number of remaining requests per day.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Reset" : {
      "description" : "A timestamp specifying the time in which the daily rate limit is reset.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "string",
        "format" : "date-time"
      }
    }
  },
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/item"
      }
    }
  }
}',
                ],
                '400' => [
                    'code' => 400,
                    'message' => 'search results matching criteria',
                    'jsonSchema' => '{
  "description" : "search results matching criteria",
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/invalid_code"
      }
    }
  }
}',
                ],
                '404' => [
                    'code' => 404,
                    'message' => 'search results matching criteria',
                    'jsonSchema' => '{
  "description" : "search results matching criteria",
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/not_found"
      }
    }
  }
}',
                ],
            ],
            'authMethods' => [
            ],
        ],
        [
            'httpMethod' => 'GET',
            'basePathWithoutHost' => '/magicCashew/barcodable/1.0.0',
            'path' => '/api/v1/upc/{upc}',
            'apiPackage' => 'OpenAPIServer\Api',
            'classname' => 'AbstractProductLookupApi',
            'userClassname' => 'ProductLookupApi',
            'operationId' => 'getItemByUPC',
            'responses' => [
                'default' => [
                    'code' => 200,
                    'message' => 'successful operation',
                    'jsonSchema' => '{
  "description" : "successful operation",
  "headers" : {
    "X-ValidAuthorization" : {
      "description" : "A boolean indicating whether the API key in use is valid. Requests with an invalid subscription, incorrect key, or no key will return 'false'.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "boolean"
      }
    },
    "X-RateLimit-Limit" : {
      "description" : "An integer specifying the number of requests available per day. This number is definied by your subscription plan.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Remaining" : {
      "description" : "An integer specifying the number of remaining requests per day.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "integer"
      }
    },
    "X-RateLimit-Reset" : {
      "description" : "A timestamp specifying the time in which the daily rate limit is reset.",
      "style" : "simple",
      "explode" : false,
      "schema" : {
        "type" : "string",
        "format" : "date-time"
      }
    }
  },
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/item"
      }
    }
  }
}',
                ],
                '400' => [
                    'code' => 400,
                    'message' => 'search results matching criteria',
                    'jsonSchema' => '{
  "description" : "search results matching criteria",
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/invalid_code"
      }
    }
  }
}',
                ],
                '404' => [
                    'code' => 404,
                    'message' => 'search results matching criteria',
                    'jsonSchema' => '{
  "description" : "search results matching criteria",
  "content" : {
    "application/json" : {
      "schema" : {
        "$ref" : "#/components/schemas/not_found"
      }
    }
  }
}',
                ],
            ],
            'authMethods' => [
            ],
        ],
    ];

    /**
     * Class constructor
     *
     * @param ContainerInterface|array $settings Either a ContainerInterface or an associative array of app settings
     *
     * @throws Exception When implementation class doesn't exists
     */
    public function __construct($settings = [])
    {
        if ($settings instanceof ContainerInterface) {
            // Set container to create App with on AppFactory
            AppFactory::setContainer($settings);
        }
        $this->slimApp = AppFactory::create();

        // middlewares requires Psr\Container\ContainerInterface
        $container = $this->slimApp->getContainer();

        $authPackage = 'OpenAPIServer\Auth';
        $basicAuthenticator = function (ServerRequestInterface &$request, TokenSearch $tokenSearch) use ($authPackage) {
            $message = "How about extending AbstractAuthenticator class by {$authPackage}\BasicAuthenticator?";
            throw new Exception($message);
        };
        $apiKeyAuthenticator = function (ServerRequestInterface &$request, TokenSearch $tokenSearch) use ($authPackage) {
            $message = "How about extending AbstractAuthenticator class by {$authPackage}\ApiKeyAuthenticator?";
            throw new Exception($message);
        };
        $oAuthAuthenticator = function (ServerRequestInterface &$request, TokenSearch $tokenSearch) use ($authPackage) {
            $message = "How about extending AbstractAuthenticator class by {$authPackage}\OAuthAuthenticator?";
            throw new Exception($message);
        };

        $userOptions = $this->getSetting($settings, 'tokenAuthenticationOptions', null);

        // mocker options
        $mockerOptions = $this->getSetting($settings, 'mockerOptions', null);
        $dataMocker = $mockerOptions['dataMocker'] ?? new OpenApiDataMocker();
        $getMockResponseCallback = $mockerOptions['getMockResponseCallback'] ?? null;
        $mockAfterCallback = $mockerOptions['afterCallback'] ?? null;

        foreach ($this->operations as $operation) {
            $callback = function ($request, $response, $arguments) use ($operation) {
                $message = "How about extending {$operation['classname']} by {$operation['apiPackage']}\\{$operation['userClassname']} class implementing {$operation['operationId']} as a {$operation['httpMethod']} method?";
                throw new Exception($message);
                $response->getBody()->write($message);
                return $response->withStatus(501);
            };
            $middlewares = [new JsonBodyParserMiddleware()];

            if (class_exists("\\{$operation['apiPackage']}\\{$operation['userClassname']}")) {
                $callback = "\\{$operation['apiPackage']}\\{$operation['userClassname']}:{$operation['operationId']}";
            }

            foreach ($operation['authMethods'] as $authMethod) {
                switch ($authMethod['type']) {
                    case 'http':
                        $authenticatorClassname = "\\{$authPackage}\\BasicAuthenticator";
                        if (class_exists($authenticatorClassname)) {
                            $basicAuthenticator = new $authenticatorClassname($container);
                        }

                        $middlewares[] = new TokenAuthentication($this->getTokenAuthenticationOptions([
                            'authenticator' => $basicAuthenticator,
                            'regex' => $authMethod['isBearer'] ? '/Bearer\s+(.*)$/i' : '/Basic\s+(.*)$/i',
                            'header' => 'Authorization',
                            'parameter' => null,
                            'cookie' => null,
                            'argument' => null,
                        ], $userOptions));
                        break;
                    case 'apiKey':
                        $authenticatorClassname = "\\{$authPackage}\\ApiKeyAuthenticator";
                        if (class_exists($authenticatorClassname)) {
                            $apiKeyAuthenticator = new $authenticatorClassname($container);
                        }

                        $middlewares[] = new TokenAuthentication($this->getTokenAuthenticationOptions([
                            'authenticator' => $apiKeyAuthenticator,
                            'regex' => '/^(.*)$/i',
                            'header' => $authMethod['isKeyInHeader'] ? $authMethod['keyParamName'] : null,
                            'parameter' => $authMethod['isKeyInQuery'] ? $authMethod['keyParamName'] : null,
                            'cookie' => $authMethod['isKeyInCookie'] ? $authMethod['keyParamName'] : null,
                            'argument' => null,
                        ], $userOptions));
                        break;
                    case 'oauth2':
                        $authenticatorClassname = "\\{$authPackage}\\OAuthAuthenticator";
                        if (class_exists($authenticatorClassname)) {
                            $oAuthAuthenticator = new $authenticatorClassname($container, $authMethod['scopes']);
                        }

                        $middlewares[] = new TokenAuthentication($this->getTokenAuthenticationOptions([
                            'authenticator' => $oAuthAuthenticator,
                            'regex' => '/Bearer\s+(.*)$/i',
                            'header' => 'Authorization',
                            'parameter' => null,
                            'cookie' => null,
                            'argument' => null,
                        ], $userOptions));
                        break;
                    default:
                        throw new Exception('Unknown authorization schema type');
                }
            }

            if (is_callable($getMockResponseCallback)) {
                $middlewares[] = new OpenApiDataMockerMiddleware($dataMocker, $operation['responses'], $getMockResponseCallback, $mockAfterCallback);
            }

            $this->addRoute(
                [$operation['httpMethod']],
                "{$operation['basePathWithoutHost']}{$operation['path']}",
                $callback,
                $middlewares
            )->setName($operation['operationId']);
        }
    }

    /**
     * Merges user defined options with dynamic params
     *
     * @param array $staticOptions Required static options
     * @param array $userOptions   User options
     *
     * @return array Merged array
     */
    private function getTokenAuthenticationOptions(array $staticOptions, array $userOptions = null)
    {
        if (is_array($userOptions) === false) {
            return $staticOptions;
        }

        return array_merge($userOptions, $staticOptions);
    }

    /**
     * Returns app setting by name.
     *
     * @param ContainerInterface|array $settings    Either a ContainerInterface or an associative array of app settings
     * @param string                   $settingName Setting name
     * @param mixed                    $default     Default setting value.
     *
     * @return mixed
     */
    private function getSetting($settings, $settingName, $default = null)
    {
        if ($settings instanceof ContainerInterface && $settings->has($settingName)) {
            return $settings->get($settingName);
        } elseif (is_array($settings) && array_key_exists($settingName, $settings)) {
            return $settings[$settingName];
        }

        return $default;
    }

    /**
     * Add route with multiple methods
     *
     * @param string[]        $methods     Numeric array of HTTP method names
     * @param string          $pattern     The route URI pattern
     * @param callable|string $callable    The route callback routine
     * @param array|null      $middlewares List of middlewares
     *
     * @return RouteInterface
     *
     * @throws InvalidArgumentException If the route pattern isn't a string
     */
    public function addRoute(array $methods, string $pattern, $callable, $middlewares = [])
    {
        $route = $this->slimApp->map($methods, $pattern, $callable);
        foreach ($middlewares as $middleware) {
            $route->add($middleware);
        }
        return $route;
    }

    /**
     * Returns Slim Framework instance
     *
     * @return App
     */
    public function getSlimApp()
    {
        return $this->slimApp;
    }
}
