# bpweatherap

Basic weather app made with Flutter.

## To-dos

1. need to recover the "LOCATION_KEY" to make the request to accuweather
   1. Location key: http://dataservice.accuweather.com /locations/v1/cities/geoposition/search?apikey=ACCUWEATHER_API_KEY&q={lon,lat}
   2. Forecast Data: http://dataservice.accuweather.com/currentconditions/v1/{location key}?apikey={api key}
2. Deal with the API keys safely by using Firebase or package "flutter_config"