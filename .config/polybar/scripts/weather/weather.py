import json
from json.decoder import JSONDecodeError

import urllib.request
from urllib.error import URLError

from exceptions import ApiServiceError

from config import app_id

from location import Location
from typing import NamedTuple

Celsius = int
class Weather(NamedTuple):
    temp:Celsius
    weatherType:str
    windSpeed:int

def get_weather(loc:Location) -> Weather:
    weather_response = _get_weather_response(loc)
    return _parse_weather_response(weather_response)

def _get_weather_response(loc:Location) -> str:
    url = (
        "https://api.openweathermap.org/data/2.5/weather?"
        "lat={latitude}&lon={longitude}"
        "&appid=" + app_id + "&units=metric"
    )

    url = url.format(latitude=loc.lat,longitude=loc.lon)
    try:
        return urllib.request.urlopen(url).read()
    except URLError:
        raise ApiServiceError

def _parse_weather_response(response:str) -> Weather:
    try:
        weather_dict = json.loads(response)
    except JSONDecodeError:
        raise ApiServiceError
    return Weather(
        temp = round(weather_dict["main"]["temp"]),
        weatherType = weather_dict["weather"][0]["main"],
        windSpeed =  weather_dict["wind"]["speed"],
    )
