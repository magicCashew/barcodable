# coding: utf-8

from datetime import date, datetime

from typing import List, Dict, Type

from openapi_server.models.base_model_ import Model
from openapi_server import util


class InlineResponse200(Model):
    """NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).

    Do not edit the class manually.
    """

    def __init__(self, upcs: List[str]=None, eans: List[str]=None, asins: List[str]=None, message: str=None):
        """InlineResponse200 - a model defined in OpenAPI

        :param upcs: The upcs of this InlineResponse200.
        :param eans: The eans of this InlineResponse200.
        :param asins: The asins of this InlineResponse200.
        :param message: The message of this InlineResponse200.
        """
        self.openapi_types = {
            'upcs': List[str],
            'eans': List[str],
            'asins': List[str],
            'message': str
        }

        self.attribute_map = {
            'upcs': 'upcs',
            'eans': 'eans',
            'asins': 'asins',
            'message': 'message'
        }

        self._upcs = upcs
        self._eans = eans
        self._asins = asins
        self._message = message

    @classmethod
    def from_dict(cls, dikt: dict) -> 'InlineResponse200':
        """Returns the dict as a model

        :param dikt: A dict.
        :return: The inline_response_200 of this InlineResponse200.
        """
        return util.deserialize_model(dikt, cls)

    @property
    def upcs(self):
        """Gets the upcs of this InlineResponse200.

        A list of UPCs

        :return: The upcs of this InlineResponse200.
        :rtype: List[str]
        """
        return self._upcs

    @upcs.setter
    def upcs(self, upcs):
        """Sets the upcs of this InlineResponse200.

        A list of UPCs

        :param upcs: The upcs of this InlineResponse200.
        :type upcs: List[str]
        """

        self._upcs = upcs

    @property
    def eans(self):
        """Gets the eans of this InlineResponse200.

        A list of EANs

        :return: The eans of this InlineResponse200.
        :rtype: List[str]
        """
        return self._eans

    @eans.setter
    def eans(self, eans):
        """Sets the eans of this InlineResponse200.

        A list of EANs

        :param eans: The eans of this InlineResponse200.
        :type eans: List[str]
        """

        self._eans = eans

    @property
    def asins(self):
        """Gets the asins of this InlineResponse200.

        A list of ASINs

        :return: The asins of this InlineResponse200.
        :rtype: List[str]
        """
        return self._asins

    @asins.setter
    def asins(self, asins):
        """Sets the asins of this InlineResponse200.

        A list of ASINs

        :param asins: The asins of this InlineResponse200.
        :type asins: List[str]
        """

        self._asins = asins

    @property
    def message(self):
        """Gets the message of this InlineResponse200.


        :return: The message of this InlineResponse200.
        :rtype: str
        """
        return self._message

    @message.setter
    def message(self, message):
        """Sets the message of this InlineResponse200.


        :param message: The message of this InlineResponse200.
        :type message: str
        """

        self._message = message