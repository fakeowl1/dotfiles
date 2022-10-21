from typing import NamedTuple
from enum import Enum

from environs import Env

env = Env()
env.read_env()

# app_id:
app_id = env.str("app_id")
address =  env.str("address")

class Color(NamedTuple):
    hcolor:str
    start_temp:int
    end_temp:int

class Colors(Enum):
    blue1   = Color("#7aa2f7",-20,10) 
    green1  = Color("#9ECE6A",10,21)  
    red1    = Color("#dc143c",22,50)

# Used nerd fonts icons
class WeatherIcons(Enum):
    Thunderstorm = ""
    Rain         = ""
    Snow         = ""
    Fog          = ""
    Clouds       = ""
    Clear        = ""
    Unknown      = "NOT FOUND ICON"
