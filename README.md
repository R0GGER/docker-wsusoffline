# WSUS Offline Update

Using "WSUS Offline Update", you can update any computer running Microsoft Windows and Office safely, quickly and without an Internet connection.

-----------
## Auto update
Just restart the container and the latest wsusoffline version will be downloaded.

## Configuration
Update folder: /my-folder:/client    
Time: /etc/localtime:/etc/localtime:ro (read only)   
Runs every day @ 04:00 (morning)    

## ENV Default
SYSTEM=all-x64    
OFFICE=ofc   
LANGUAGE=nld   
PARAMS="/dotnet /msse /wddefs /wle"   
