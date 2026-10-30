@echo off
setlocal
set GRADLE_VERSION=8.10.2
set GRADLE_DIR=%USERPROFILE%\.gradle\croisse-gradle\gradle-%GRADLE_VERSION%
set GRADLE_BIN=%GRADLE_DIR%\bin\gradle.bat
if not exist "%GRADLE_BIN%" (
  echo Gradle distribution is not installed. This project is configured for cloud build using android/gradlew on GitHub Actions.
  echo For local Windows builds, install Gradle %GRADLE_VERSION% and run gradle wrapper, or use GitHub Actions.
  exit /b 1
)
call "%GRADLE_BIN%" -p "%~dp0" %*
endlocal
