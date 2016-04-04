# WSUS Offline Update

Using "WSUS Offline Update", you can update any computer running Microsoft Windows and Office safely, quickly and without an Internet connection. It runs every morning at 04:00 hour.

-----------
## Auto update
Just restart the container and the latest wsusoffline version will be downloaded.

## Configuration
Update folder: `/my-folder:/client`    
Time: `/etc/localtime:/etc/localtime:ro` (read only)   

## ENV Default
```SYSTEM=all-x64    
OFFICE=ofc   
LANGUAGE=nld   
PARAMS="/dotnet /msse /wddefs /wle"`
