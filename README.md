# WSUS Offline Update

Using [WSUS Offline Update](http://wsusoffline.net/), you can update any computer running Microsoft Windows and Office safely, quickly and without an Internet connection.

-----------
### Auto update
WSUS Offline Update will be updated on each start or just restart the container and the latest wsusoffline version will be downloaded.

### Usage
By default it runs every 2 days to download updates from Microsoft.   

```
docker create 
        --name=wsusoffline \
        -v <path to updates>:/client \
        -e SYSTEMS="w100-x64" \
        -e OFFICE="o2k16-x64" \
        -e LANGUAGE="enu" \
        -e PARAMS="-includesp -includecpp -includecpp -includewddefs8" \
        -e SLEEP=48h \     
        r0gger/docker-wsusoffline
```
### Volumes
`-v <path to updates>:/client` - Default update folder

### Environment Variables
**SLEEP:**   
`-e SLEEP=48h` - Example: It runs every 48 hours ("m" for minutes, "h" for hours, or "d" for days).

**SYSTEMS:**  
`-e SYSTEMS="w100-x64"`   
`w60` - Windows Server 2008, 32-bit  
`w60-x64` - Windows Server 2008, 64-bit  
`w61` - Windows 7, 32-bit  
`w61-x64` - Windows 7 / Server 2008 R2, 64-bit  
`w62-x64` - Windows Server 2012, 64-bit  
`w63` - Windows 8.1, 32-bit  
`w63-x64` - Windows 8.1 / Server 2012 R2, 64-bit  
`w100` - Windows 10, 32-bit  
`w100-x64` - Windows 10 / Server 2016, 64-bit


**OFFICE:**   
`-e OFFICE="o2k16-x64"`   
`o2k7` - Office 2007, 32-bit  
`o2k10` - Office 2010, 32-bit  
`o2k10-x64` - Office 2010, 32-bit and 64-bit  
`o2k13` - Office 2013, 32-bit  
`o2k13-x64` - Office 2013, 32-bit and 64-bit  
`o2k16` - Office 2016, 32-bit  
`o2k16-x64` - Office 2016, 32-bit and 64-bit 

**LANGUAGES:**  
`-e LANGUAGE="enu"` - Multiple languages can be joined to a comma-separated list like "nld,enu".   
`enu deu nld esn fra ptg ptb ita rus plk ell csy dan nor sve fin jpn kor chs cht hun trk ara heb`

**PARAMS:**  
`-includesp`   
Include Service Packs

`-includecpp`   
Include Visual C++ runtime libraries

`-includedotnet`   
Include .NET Frameworks: localized installation files and updates

`-includewddefs`   
Virus definition files for Windows Vista and 7. These virus definition files are only compatible with the original Windows Defender, which was included in Windows Vista and 7.

`-includemsse`   
Microsoft Security Essentials: localized installation files and virus definition updates. Microsoft Security Essentials is an optional installation for Windows Vista and 7.

`-includewddefs8`   
Virus definition files for Windows 8 and higher. These are the same virus definition updates as for Microsoft Security Essentials, but without the localized installers.


**Changelog:**  
Oct 7, 2017 - Multiple fixes   
Aug 4, 2016 - Multiple fixes and simplify things  
Apr 9, 2016 - Temp fix: hashdeep error wsusoffline 10.6.1   
Apr 7, 2016 - Fix: timezone   
Apr 6, 2016 - Fix: cron   
Apr 5, 2016 - Release   
    
**Credits:**   
WSUS Offline Update @ http://wsusoffline.net   
wsusoffline forum-user:  hbuhrmester, cpasqualini
