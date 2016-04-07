# WSUS Offline Update

Using [WSUS Offline Update](http://wsusoffline.net/), you can update any computer running Microsoft Windows and Office safely, quickly and without an Internet connection.

-----------
### Auto update
Just restart the container and the latest wsusoffline version will be downloaded.

### Usage
By default it runs twice a day to download updates from Microsoft @ 12:00 and 00.00 o'clock, but if you prefer your own timetable change the CRON environment variable.   

```
docker create 
        --name=wsusoffline \
        -v /etc/localtime:/etc/localtime:ro \
        -v <path to updates>:/client \
        -e SYSTEMS="all-62 all-63 all-100" \
        -e OFFICE="o2k10 o2k13 o2k16" \
        -e LANGUAGE="enu" \
        -e PARAMS="/dotnet /msse /wddefs /wle" \
        -e CRON="* 12,0 * * *" \
        -e  TIMEZONE="Europe/Amsterdam" \
        r0gger/docker-wsusoffline
```
    
- `-v <path to updates>:/client` - Default update folder   
- `-v /etc/localtime` - Timesync   
- `-e SYSTEMS="all-62 all-63 all-100"` - MS Windows versions   
- `-e OFFICE="o2k10 o2k13 o2k16` - MS Office versions   
- `-e PARAMS="/dotnet /msse /wddefs /wle"` - Extra packages such as dotNet etc   
- `-e CRON="* 12,0 * * *` - Time/days when WSUS Offline Update when should download updates   
- `-e  TIMEZONE="Europe/Amsterdam"` - Timezone   

**Optional:** If param `/makeiso` is set add `-v <path to iso's>:/iso`.

### Environment Variables
**CRON:**   
`* 12,0 * * *` - more info: http://crontab.guru

**TIMEZONE:**   
`Europe/Amsterdam` - more info: http://php.net/manual/en/timezones.europe.php

**SYSTEMS:**    
`w60 w60-x64 w61 w61-x64 w62-x64 w63 w63-x64 w100 w100-x64 all-x86 all-x64 all-61 all-62 all-63 all-100`

**OFFICE:**   
`o2k7 o2k10 o2k13 o2k16 ofc`

**LANGUAGES:**   
`enu deu nld esn fra ptg ptb ita rus plk ell csy dan nor sve fin jpn kor chs cht hun trk ara heb`

**PARAMS:**   
`/excludesp` - do not download servicepacks   
`/dotnet`    - download .NET framework   
`/msse`      - download Microsoft Security Essentials files   
`/wddefs`    - download Windows Defender definition files   
`/nocleanup` - do not cleanup client directory    
`/wle`       - download Essentials   
`/proxy`     - define proxy server (/proxy http://[username:password@]<server>:<port>)   
`/makeiso`   - create ISO image   
    
    
**Credits:**   
WSUS Offline Update @ http://wsusoffline.net   
wsusoffline forum-user:  hbuhrmester.
