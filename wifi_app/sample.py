from __future__ import print_function

import argparse
import json
import pprint
import requests
import sys
import urllib
import math

from flask import Flask
from flask import jsonify

app = Flask(__name__)


# This client code can run on Python 2.x or 3.x.  Your imports can be
# simpler if you only need one of those.
try:
    # For Python 3.0 and later
    from urllib.error import HTTPError
    from urllib.parse import quote
    from urllib.parse import urlencode
except ImportError:
    # Fall back to Python 2's urllib2 and urllib
    from urllib2 import HTTPError
    from urllib import quote
    from urllib import urlencode


# Yelp Fusion no longer uses OAuth as of December 7, 2017.
# You no longer need to provide Client ID to fetch Data
# It now uses private keys to authenticate requests (API Key)
# You can find it on
# https://www.yelp.com/developers/v3/manage_app
API_KEY= '7qu_D2n6pYE-Tut1VT48OkdXdPw25dBetovl_j8-8tQ0-J0eHqB4zqQ3b-LRP_JH2XOppQIUUY-gpC_4XxDeVjdA3iKFIMGmOz_oz4dhs-EluhFrJSrI4niZml4xYHYx'

# API constants, you shouldn't have to change these.
API_HOST = 'https://api.yelp.com'
SEARCH_PATH = '/v3/businesses/search'
BUSINESS_PATH = '/v3/businesses/'  # Business ID will come after slash.
Info = []

# Defaults for our simple example.
DEFAULT_LOCATION = '1700 W McKinney Butte Rd, Sisters, OR 97759'
SEARCH_LIMIT = 3
latit = 44.2964
longit = -121.5761


def request(host, path, api_key, url_params=None):
    """Given your API_KEY, send a GET request to the API.
    Args:
        host (str): The domain host of the API.
        path (str): The path of the API after the domain.
        API_KEY (str): Your API Key.
        url_params (dict): An optional set of query parameters in the request.
    Returns:
        dict: The JSON response from the request.
    Raises:
        HTTPError: An error occurs from the HTTP request.
    """
    url_params = url_params or {}
    url = '{0}{1}'.format(host, quote(path.encode('utf8')))
    headers = {
        'Authorization': 'Bearer %s' % api_key,
    }

    print(u'Querying {0} ...'.format(url))

    response = requests.request('GET', url, headers=headers, params=url_params)

    return response.json()

def search(api_key, term, location):
    """Query the Search API by a search term and location.
    Args:
        term (str): The search term passed to the API.
        location (str): The search location passed to the API.
    Returns:
        dict: The JSON response from the request.
    """

    url_params = {
        'term': term.replace(' ', '+'),
        'location': location.replace(' ', '+'),
        'limit': SEARCH_LIMIT
    }
    return request(API_HOST, SEARCH_PATH, api_key, url_params=url_params)


def get_business(api_key, business_id):
    """Query the Business API by a business ID.
    Args:
        business_id (str): The ID of the business to query.
    Returns:
        dict: The JSON response from the request.
    """
    business_path = BUSINESS_PATH + business_id

    return request(API_HOST, business_path, api_key)

def query_api(term, location):
    """Queries the API by the input values from the user.
    Args:
        term (str): The search term to query.
        location (str): The location of the business to query.
    """
    response = search(API_KEY, term, location)

    businesses = response.get('businesses')

    if not businesses:
        print(u'No businesses for {0} in {1} found.'.format(term, location))
        return
    x = 0
    while x < len(businesses):

        ##print(u'Result for business "{0}" found:'.format(business_id))
        if (businesses[x]['name'] == 'US Post Office'):
            x+=1
            continue
        Temp = []
        Temp.append(businesses[x]['name'])
        Temp.append(businesses[x]['location']['display_address'])
        """Temp.append(not(businesses[x]['is_closed']))
        Temp.append(businesses[x]['display_phone'])
        Temp.append(distance(businesses[x]['coordinates']['longitude'], businesses[x]['coordinates']['latitude']))
        """
        Temp.append(businesses[x]['distance'])
        Info.append(Temp)

        ##pprint.pprint(response, indent=2)

        x+=1

def distance(lo, la):
    Xlong = (lo - longit) * 54.6
    Xlat = (la - latit) * 69
    dist = math.sqrt((Xlong)**2 + (Xlat)**2)
    return dist


def sort():
    i = 0
    for i in range(len(Info)):
        min = i
        for j in range(i+1, len(Info)):
            if Info[min][2] > Info[j][2]:
                min = j
        Info[i], Info[min] = Info[min], Info[i]

@app.route("/")
def main():
    """
    parser = argparse.ArgumentParser()

    parser.add_argument('-l', '--location', dest='location',
                        default=DEFAULT_LOCATION, type=str,
                        help='Search location (default: %(default)s)')

    input_values = parser.parse_args()
    """
    location = DEFAULT_LOCATION

    try:
        query_api('Internet Cafe', location)
        query_api('library', location)
    except HTTPError as error:
        sys.exit(
            'Encountered HTTP error {0} on {1}:\n {2}\nAbort program.'.format(
                error.code,
                error.url,
                error.read(),
            )
        )
    """
    print(Info)
    print(Info[0][0])
    print(Info[0][1])
    print(Info[0][2])
    print(Info[0][3])
    """

    sort()
    print(Info)
  
    ##InfoFinal = tuple(map(tuple,Info))
    return jsonify(Info)


if __name__ == '__main__':
    main()

