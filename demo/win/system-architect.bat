REM Runs a demo of the provider-author experience

@echo off

REM Setup root directories
call %~dp0\utils\setup.bat

set aws_provider=%provider_dir%\aws
rem check to ensure that aws_provider is available. Deploy will fail without.
if not exist %aws_provider% (
  echo ERROR: Missing aws provider in %aws_provider%
  echo please run %~dp0\provider-author and try again
  exit /b -1
)

if exist %composition_dir% (
  echo ::: resetting %composition_dir%
  rd /s /q %composition_dir%
)
md %composition_dir%
cd %composition_dir%

echo.
echo.
echo ###############################
echo #    System Architect Demo    #
echo ###############################

echo.
cmd /c tufan registry ping --port %PORT% > nul 2>&1
if %errorlevel% neq 0 (
  echo ::: restarting demo registry
  cmd /c tufan registry start --port %PORT% --force > null 2>&1
)

echo.
echo tufan init --registry http://localhost:%PORT%
cmd /c tufan init --registry http://localhost:%PORT%

echo.
echo use provider aws
cmd /c tufan use-provider

echo.
echo tufan add s3
cmd /c tufan add s3

echo.
echo tufan add lambda
cmd /c tufan add lambda

echo.
echo tufan link s3_1 lambda_1
cmd /c tufan link s3_1 lambda_1

echo.
echo tufan add az
cmd /c tufan add az

echo.
echo tufan add ec2
cmd /c tufan add ec2

echo.
echo tufan attach az_1 ec2_1
cmd /c tufan attach az_1 ec2_1

echo.
echo tufan deploy --visual-trace --for-real

cmd /c tufan deploy --visual-trace --for-real

echo.
echo.
echo.
echo ############################################
echo #   Composition deployed successfully!!!   #
echo ############################################
echo.
echo.

cd %BASE_DIR%
