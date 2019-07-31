::@if not defined _echo @echo off
setlocal
echo in init-dotnet pj == %__ProjectDir%
echo Installing dotnet using Arcade...
set PS_DOTNET_INSTALL_SCRIPT=". eng\configure-toolset.ps1; . eng\common\tools.ps1; InitializeBuildTool"
echo running: powershell -NoProfile -ExecutionPolicy unrestricted -Command %PS_DOTNET_INSTALL_SCRIPT%

powershell -NoProfile -ExecutionPolicy unrestricted -Command %PS_DOTNET_INSTALL_SCRIPT%

if NOT [%ERRORLEVEL%] == [0] (
  echo Failed to install dotnet using Arcade.
  exit /b %ERRORLEVEL%
)
echo exiting init-dotnet
exit /b 0
