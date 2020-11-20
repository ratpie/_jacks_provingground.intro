ECHO OFF
SET missionName = %1
SET mapName = %2

SET missionFolder = C:%HOMEPATH%\Documents\Arma 3\missions\%missionName%.%mapName%\
md .\mission\standard\%missionName%.%mapName%
cd .\mission\standard\%mapName%
xcopy .\*.* %missionFolder% /E /F /H /Y
ECHO python hodorpaa.py paa png * C:\Users\justi\source\repos\hodorpaa\images\ C:\Users\justi\source\repos\hodorpaa\ > paa2png.bat
ECHO python hodorpaa.py png paa * C:\Users\justi\source\repos\hodorpaa\images\ C:\Users\justi\source\repos\hodorpaa\ > png2paa.bat
ECHO python hodorpaa.py jpg paa * C:\Users\justi\source\repos\hodorpaa\images\ C:\Users\justi\source\repos\hodorpaa\ > jpg2paa.bat


