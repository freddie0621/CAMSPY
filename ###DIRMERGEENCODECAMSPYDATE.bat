del input.txt /Q
del mux*.avi /Q
::CONTOURNER LE PROBLEME DES HEURES à un CHIFFRE
if "%TIME:~0,1%"==" " (set ext=0%TIME:~1,1%) else (set ext=%TIME:~0,2%)
::set datetimef=%date:~-4%_%date:~3,2%_%date:~0,2%__%time:~0,2%_%time:~3,2%_%time:~6,2%
set datetimef=%date:~-4%_%date:~3,2%_%date:~0,2%__%ext%_%time:~3,2%_%time:~6,2%
echo %datetimef%

for %%1 in ("*.avi") do  echo file %%~n1.avi >>input.txt
::set chaine=YOUTUBE_
set chaine=%datetimef%
ffmpeg -f concat -i input.txt -vcodec copy -acodec copy Mux1.avi
::for %%1 in ("Mu*.avi") do ffmpeg -i %%1  -s 1280:720  -pix_fmt yuv420p -movflags +faststart "newfiles\%chaine%%%~n1B.mp4"
for %%1 in ("Mu*.avi") do ffmpeg -i %%1  -s 1280:720  -pix_fmt yuv420p -movflags +faststart "%chaine%%%~n1B.mp4"