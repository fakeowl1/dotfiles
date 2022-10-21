from geopy.geocoders import Nominatim
from config import address

from exceptions import ApiServiceError 

from typing import NamedTuple
class Location(NamedTuple):
    lat:float
    lon:float

def __get_location_response() -> dict:
    try:
        app = Nominatim(user_agent="UserAgent")
        return app.geocode(address).raw
    except:
        raise ApiServiceError

def _parse_location_reponse(loc_dict:dict) -> Location:
    return Location(
        lat=loc_dict["lat"],
        lon=loc_dict["lon"],
    )

def get_location() -> Location:
    response_json = __get_location_response()
    return _parse_location_reponse(response_json)
