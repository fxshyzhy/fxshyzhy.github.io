@echo off

if "%1"=="new" goto NEW
if "%1"=="push" goto PUSH
if "%1"=="run" goto RUN
if "%1"=="help" goto HELP
if "%1"=="save" goto SAVE

goto HELP

:NEW
set dd=%date:~8,2%


set mm=%date:~5,2%

set yy=%date:~0,4%

set name=%2

set name=%name:.md=%

echo %name%

copy .\template.md .\_posts\%yy%-%mm%-%dd%-%name%.md  > nul

goto END 
:SAVE 

echo ----- git add * -----

git add *

echo ----- git commit  -----
if "%2"=="" (git commit -m "default submit message.") else (git commit -m "%2")

goto END


:PUSH 

echo ----- git add * -----

git add *

echo ----- git commit  -----
if "%2"=="" (git commit -m "default submit message.") else (git commit -m "%2")

echo ----- push origin master -----
git push origin master 

goto END

:RUN
jekyll s

goto END

:HELP
if "%2"=="" (
  echo new      创建md 文件到 _posts 文件夹下
  echo save     将所有修改内容提交到本地
  echo run      启动本地服务器
  echo push     将修改推送到远程服务器
  echo help     查看帮助
) 
if "%2"=="new" (
  echo [文件名] 用于指定文件名. eg: gen new Test
)
if "%2"=="push" (
  echo [提交信息] 如果不指定使用默认信息. eg: gen push SubmitInfo
)
if "%2"=="save" (
  echo [提交信息] 如果不指定使用默认信息. eg: gen push SubmitInfo
)
:END

