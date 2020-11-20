ECHO OFF
SET missionName = %1
SET mapName = %2

SET missionFolder = C:%HOMEPATH%\Documents\Arma 3\missions\%missionName%.%mapName%\
cd .\mission\standard\%mapName%
xcopy .\*.* %missionFolder% /E /F /H /Y

