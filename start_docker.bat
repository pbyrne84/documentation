docker build -t documentation_vm .
set "currentDir=%cd%"
echo %currentDir%
docker run -dp  127.0.0.1:1313:1313 --name documentation_image --mount src="%currentDir%",target=/root/documentation,type=bind -t  documentation_vm  || exit /b
docker exec -it documentation_image bash
