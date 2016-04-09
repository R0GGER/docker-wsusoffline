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
        -e SYSTEMS="all-61 all-63 all-100" \
        -e OFFICE="o2k10 o2k13 o2k16" \
        -e LANGUAGE="enu" \
        -e PARAMS="/dotnet /msse /wddefs /wle" \
        -e CRON="* 12,0 * * *" \
        -e TIMEZONE="Europe/Amsterdam" \
        r0gger/docker-wsusoffline
```
### Volumes    
`-v <path to updates>:/client` - Default update folder   
`-v /etc/localtime` - Timesync   

**Optional:** If param `/makeiso` is set add `-v <path to iso's>:/iso`.

### Environment Variables
**CRON:**   
`* 12,0 * * *` - more info: http://crontab.guru

**TIMEZONE:**   
`Europe/Amsterdam` - more info: http://php.net/manual/en/timezones.europe.php

**SYSTEMS:**    
`w60 w60-x64 w61 w61-x64 w62-x64 w63 w63-x64 w100 w100-x64 all-x86 all-x64 all-61 all-62 all-63 all-100`   

`w60` / `w60-x64` - Windows Vista / Windows Server 2008   
`w61`/`w61_x64` - Windows 7 / Windows Server 2008 R2       
`w62_x64`	- Windows Server 2012   
`w63`/`w63_x64` - Windows 8.1 / Windows Server 2012 R2    
`w100`/`w100_x64` -	Windows 10 / Windows Server 2016     

**OFFICE:**   
`o2k7 o2k10 o2k13 o2k16 ofc`

`o2k7` - Office 2007   
`o2k10` - Office 2010   
`o2k13` - Office 2013   
`o2k16` - Office 2016

**LANGUAGES:**   
`enu deu nld esn fra ptg ptb ita rus plk ell csy dan nor sve fin jpn kor chs cht hun trk ara heb`

**PARAMS:**   
`/excludesp` - Do not download servicepacks   
`/dotnet` - Download .NET framework   
`/msse` - Download Microsoft Security Essentials files   
`/wddefs` - Download Windows Defender definition files   
`/nocleanup` - Do not cleanup client directory   
`/wle` - Download Essentials   
`/proxy` - Define proxy server (/proxy http://[username:password@]<server>:<port>)   
`/makeiso` - Create ISO image   

**Changelog:**   
Apr 9, 2016 - Temp fix: hashdeep error wsusoffline 10.6.1   
Apr 7, 2016 - Fix: timezone   
Apr 6, 2016 - Fix: cron   
Apr 5, 2016 - Release   
    
**Credits:**   
WSUS Offline Update @ http://wsusoffline.net   
wsusoffline forum-user:  hbuhrmester.
