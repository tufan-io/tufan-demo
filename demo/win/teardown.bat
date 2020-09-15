REM tears down a composition created by system-architect.bat

@echo off

REM when not set, skips the parts that test for errors
set WITH_ERRORS=%1

REM Setup root directories
call %~dp0\utils\setup.bat

if not exist %composition_dir% (
    echo non-existant composition dir. Cannot continue
    exit /b -1
)

set cfile=%composition_dir%\composition.tufan

if not exist %cfile%  (
    echo missing '%cfile%'. Cannot continue
    exit /b -2
)

cd %composition_dir%

echo.
echo.
echo ###############################
echo #    Composition teardown     #
echo ###############################

cmd /c tufan ls

echo.
echo tufan rm s3_1
cmd /c tufan rm s3_1

if defined WITH_ERRORS (
    echo.
    echo (EXPECTED ERROR)
    echo tufan rm az_1
    cmd /c tufan rm az_1 || echo.
)

echo.
echo tufan detach
cmd /c tufan detach 

echo.
echo tufan unlink
cmd /c tufan unlink

echo.
echo tufan rm s3_1
cmd /c tufan rm s3_1

echo.
echo tufan rm lambda_1
cmd /c tufan rm lambda_1

echo.
echo tufan rm az_1
cmd /c tufan rm az_1

echo.
echo tufan rm ec2_1
cmd /c tufan rm ec2_1

echo.
echo tufan deploy --visual-trace --for-real
cmd /c tufan deploy --visual-trace --for-real

cd %BASE_DIR%

echo.
echo tufan registry stop --port %PORT%
cmd /c tufan registry stop --port %PORT%

echo.
echo tufan registry delete --port %PORT%
cmd /c tufan registry delete --port %PORT%

cd %BASE_DOR%