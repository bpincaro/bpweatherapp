# OPENWEATHERMAP

## API CALL
https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}&units={standard|metric|imperial}

## Example of json response
~~~
{
  "coord": {
    "lon": -2.15,
    "lat": 57
  },
  "weather": [
    {
      "id": 804,
      "main": "Clouds",
      "description": "overcast clouds",
      "icon": "04d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 8.48,
    "feels_like": 4.9,
    "temp_min": 8.18,
    "temp_max": 9.26,
    "pressure": 1016,
    "humidity": 79,
    "sea_level": 1016,
    "grnd_level": 1016
  },
  "visibility": 10000,
  "wind": {
    "speed": 7.3,
    "deg": 189,
    "gust": 13.48
  },
  "clouds": {
    "all": 100
  },
  "dt": 1647347424,
  "sys": {
    "type": 2,
    "id": 2031790,
    "country": "GB",
    "sunrise": 1647325488,
    "sunset": 1647367827
  },
  "timezone": 0,
  "id": 2641549,
  "name": "Newtonhill",
  "cod": 200
}
~~~

# WUNDERGROUND
https://api.weather.com/v3/wx/forecast/daily/5day?geocode={long, lat}&format=json&units={e|m|h}&language=en-US&apiKey={API key}
Where "e" standas for english units, "m" for metric units and "h" for hybrid units (UK).

## Example of json response:
~~~
{
    "dayOfWeek": ["Saturday","Sunday"],
    "expirationTimeUtc": [1474132620,1474132620],
    "moonPhase": ["Waning Gibbous","Waning Gibbous"],
    "moonPhaseCode": ["WXG","WXG"],
    "moonPhaseDay": ["10","11"],
    "moonriseTimeLocal": ["2016-09-17T20:30:02-0400","2016-09-18T21:12:36-0400"],
    "moonriseTimeUtc": [1474158602,1474247556 ],
    "moonsetTimeLocal": ["2016-09-17T08:08:29-0400","2016-09-18T09:16:30-0400 ],
    "moonsetTimeUtc": [1474114109,1474204590 ],
    "narrative": ["Mix of sun and clouds. Highs in the upper 80s and lows in the low 70s.","Showers and thunderstorms late. Highs in the upper 80s."],
    "qpf": [0,0.2],
    "qpfSnow": [0,0 ],
    "sunriseTimeLocal": ["2016-09-17T07:21:26-0400","2016-09-18T07:22:05-0400"],
    "sunriseTimeUtc": [1474111286,1474197725 ],
    "sunsetTimeLocal": ["2016-09-17T19:39:03-0400","2016-09-18T19:37:41-0400" ],
    "sunsetTimeUtc": [1474155543,1474241861 ],
    "temperatureMax": [88,88 ],
    "temperatureMin": [70,71 ],
    "validTimeLocal": ["2016-09-17T07:00:00-0400","2016-09-18T07:00:00-0400" ],
    "validTimeUtc": [1474110000,1474196400],
    "daypart": [
        {
            "cloudCover": [44,63 ],
            "dayOrNight": ["D","N" ],
            "daypartName": [ "Today","Tonight" ],
            "iconCode": [30,29 ],
            "iconCodeExtend": [3000,2900 ],
            "narrative": ["A mix of clouds and sun. High 88F. Winds SE at 5 to 10 mph.","Partly cloudy this evening with more clouds for overnight." ],
            "precipChance": [0,20 ],
            "precipType": [rain,precip ],
            "qpf": [0,0 ],
            "qpfSnow": [0,0 ],
            "qualifierPhrase": [null,"Slight chance of a rain shower." ],
            "relativeHumidity": [48,79 ],
            "snowRange": ["","" ],
            "temperature": [88,70 ],
            "temperatureHeatIndex": [90,86 ],
            "temperatureWindChill": [84,71 ],
            "thunderCategory": ["No thunder","No thunder" ],
            "thunderIndex": [0,0 ],
            "uvDescription": ["Very High","Low" ],
            "uvIndex": [8,0 ],
            "windDirection": [136,159 ],
            "windDirectionCardinal": ["SE","SSE" ],
            "windPhrase": ["Winds SE at 5 to 10 mph.","Winds light and variable." ],
            "windSpeed": [7,3 ],
            "wxPhraseLong": ["Partly Cloudy","Partly Cloudy" ],
            "wxPhraseShort": ["P Cloudy","P Cloudy"]
        }
    ]
}
~~~

# ACCUWEATHER

## 1. Get location key
http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey={API key}&q={lat,lon}

**Example of json response:**
~~~
{
  "Version": 1,
  "Key": "212917",
  "Type": "City",
  "Rank": 85,
  "LocalizedName": "Zocca",
  "EnglishName": "Zocca",
  "PrimaryPostalCode": "",
  "Region": {
    "ID": "EUR",
    "LocalizedName": "Europe",
    "EnglishName": "Europe"
  },
  "Country": {
    "ID": "IT",
    "LocalizedName": "Italy",
    "EnglishName": "Italy"
  },
  "AdministrativeArea": {
    "ID": "45",
    "LocalizedName": "Emilia-Romagna",
    "EnglishName": "Emilia-Romagna",
    "Level": 1,
    "LocalizedType": "Region",
    "EnglishType": "Region",
    "CountryID": "IT"
  },
  "TimeZone": {
    "Code": "CET",
    "Name": "Europe/Rome",
    "GmtOffset": 1,
    "IsDaylightSaving": false,
    "NextOffsetChange": "2023-03-26T01:00:00Z"
  },
  "GeoPosition": {
    "Latitude": 44.343,
    "Longitude": 10.996,
    "Elevation": {
      "Metric": {
        "Value": 736,
        "Unit": "m",
        "UnitType": 5
      },
      "Imperial": {
        "Value": 2414,
        "Unit": "ft",
        "UnitType": 0
      }
    }
  },
  "IsAlias": false,
  "SupplementalAdminAreas": [
    {
      "Level": 2,
      "LocalizedName": "Modena",
      "EnglishName": "Modena"
    },
    {
      "Level": 3,
      "LocalizedName": "Zocca",
      "EnglishName": "Zocca"
    }
  ],
  "DataSets": [
    "AirQualityCurrentConditions",
    "AirQualityForecasts",
    "Alerts",
    "DailyPollenForecast",
    "ForecastConfidence",
    "FutureRadar",
    "MinuteCast",
    "Radar"
  ]
}
~~~

## Get the forecast data
http://dataservice.accuweather.com/currentconditions/v1/{locationKey}?apikey={API key}

**Example of json response:**
~~~
{
  "Version": 1,
  "Key": "212917",
  "Type": "City",
  "Rank": 85,
  "LocalizedName": "Zocca",
  "EnglishName": "Zocca",
  "PrimaryPostalCode": "",
  "Region": {
    "ID": "EUR",
    "LocalizedName": "Europe",
    "EnglishName": "Europe"
  },
  "Country": {
    "ID": "IT",
    "LocalizedName": "Italy",
    "EnglishName": "Italy"
  },
  "AdministrativeArea": {
    "ID": "45",
    "LocalizedName": "Emilia-Romagna",
    "EnglishName": "Emilia-Romagna",
    "Level": 1,
    "LocalizedType": "Region",
    "EnglishType": "Region",
    "CountryID": "IT"
  },
  "TimeZone": {
    "Code": "CET",
    "Name": "Europe/Rome",
    "GmtOffset": 1,
    "IsDaylightSaving": false,
    "NextOffsetChange": "2023-03-26T01:00:00Z"
  },
  "GeoPosition": {
    "Latitude": 44.343,
    "Longitude": 10.996,
    "Elevation": {
      "Metric": {
        "Value": 736,
        "Unit": "m",
        "UnitType": 5
      },
      "Imperial": {
        "Value": 2414,
        "Unit": "ft",
        "UnitType": 0
      }
    }
  },
  "IsAlias": false,
  "SupplementalAdminAreas": [
    {
      "Level": 2,
      "LocalizedName": "Modena",
      "EnglishName": "Modena"
    },
    {
      "Level": 3,
      "LocalizedName": "Zocca",
      "EnglishName": "Zocca"
    }
  ],
  "DataSets": [
    "AirQualityCurrentConditions",
    "AirQualityForecasts",
    "Alerts",
    "DailyPollenForecast",
    "ForecastConfidence",
    "FutureRadar",
    "MinuteCast",
    "Radar"
  ]
}
~~~
