@echo on
@title Obsidian Spider
chcp 65001
setlocal EnableDelayedExpansion
for /r %%i in (.) do (
  set "filename=%%~nxi.md"
  if exist "%%i\!filename!" (
    del "%%i\!filename!"
  )
  echo From [[%%~nxi]] > "%%i\!filename!"
  echo Have into >> "%%i\!filename!"
  pushd "%%i"
  for /f "delims=" %%j in ('dir /b') do (
    set "name=%%~nxj"
    set "name=[[!name!]]"
    echo !name! >> "!filename!"
  )
  popd
)
echo end.
