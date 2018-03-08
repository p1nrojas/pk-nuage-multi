# example usage in a jinja2 template:
# {% set network = "172.16.0.1/24" | ipcalc %}
#
# {{ "192.168.0.1" | ipadd(3) }} == "192.168.0.4"
# {{ "fe80::" | ipadd("::3") }} == "fe80::3"
#
import sys
import boto
from boto.s3.key import Key
import requests
import re

class FilterModule (object):
    def filters(self):
        return {
            "signed_url_7d"   :   self.signed_url_7d,
            "aws_s3_list"   :   self.aws_s3_list,
        }

    def signed_url_7d(self, path , credentials ):
        s3_session   =   boto.connect_s3(credentials[0], credentials[1])
        s3_bucket    =   s3_session.get_bucket(credentials[2], validate=False)
        s3_key       =   Key(s3_bucket)
        s3_key.key   =   path
        result = {
            'url'    : s3_key.generate_url( expires_in=604800 )
        }
        return result

    def aws_s3_list(self, reg_value, credentials ):
        s3_session   =   boto.connect_s3(credentials[0], credentials[1])
        s3_bucket    =   s3_session.get_bucket(credentials[2], validate=False)
        regexp       =   re.compile(reg_value)
#        return reg_value
        for key in s3_bucket.list():
             if regexp.search(key.name.encode('utf-8')):
                   return key.name.encode('utf-8')
        return 'ERROR: regex not found'

