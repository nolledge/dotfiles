#!/usr/bin/env python

import json
import urllib
import urllib.parse
import urllib.request
import os


def main():
    city = "Hamburg,DE"
    api_key = "da1f3c25743ea88ae4cfa4b006e3eee0"

    try:
        data = urllib.parse.urlencode({'q': city, 'appid': api_key, 'units': 'metric'})
        weather = json.loads(urllib.request.urlopen(
            'http://api.openweathermap.org/data/2.5/weather?' + data)
            .read())
        desc = weather['weather'][0]['description'].lower()
        icons = {"thunderstorm":"", "drizzle":"", "rain":"", "snow":"", "mist":"", "smoke":"", "haze":"", "dust":"", "fog":"", "sand":"", "dust":"", "ash":"", "squall":"", "tornado":"", "clear":"", "clouds":""}
        matches = {k: v for k, v in icons.items() if k in desc}
        #print(next(x for x in matches if ...))
        icon = next(iter(matches.values()))
        
        #icon = icons.get (key, 'none')
        temp = int(float(weather['main']['temp']))
        #return icon + ' ' + desc + ' ' + temp + ''
        return ' {}  {}, {}°C '.format(icon, desc, temp)
        #return '{}°C'.format(temp)
    except:
        return ''


if __name__ == "__main__":
	print(main())
