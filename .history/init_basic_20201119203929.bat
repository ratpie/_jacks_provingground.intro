SET missionName = %1
SET mapName = %2

SET missionFolder = C:%HOMEPATH%\Documents\Arma 3\missions\%missionName%.%mapName%\
ECHO Mission folder
cd .\mission\standard\%mapName%
xcopy .\*.* %missionFolder% /E /F /H /Y
ECHO python hodorpaa.py paa png * %missionFolder%\images\ %missionFolder%\images\ > paa2png.bat
ECHO python hodorpaa.py png paa * %missionFolder%\images\ %missionFolder%\images\ > png2paa.bat
ECHO python hodorpaa.py jpg paa * %missionFolder%\images\ %missionFolder%\images\ > jpg2paa.bat
COPY E:\arma-stuff\templates\hodorpaa.py %missionFolder%
code %missionFolder%


