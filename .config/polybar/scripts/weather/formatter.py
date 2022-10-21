from config import  WeatherIcons,Colors
from weather import Weather
from config  import Color

def _select_icon(weather_status:str) -> str:
    for icon in WeatherIcons:
        if icon.name == weather_status:
            return icon.value
    return WeatherIcons.Other.value

def _select_color(temp:int) -> Color:
    for color in Colors:
        if (color.value.end_temp >= temp >= color.value.start_temp):
            return color.value
    return Color("#00000",-1,-1)

def format_weather(weather:Weather) -> str:
    color = _select_color(weather.temp)
    icon = _select_icon(weather.weatherType)
    return "%{{F{0}}} {1} {2}°C %{{F-}}".format(
        color.hcolor,icon,round(weather.temp)
    )
