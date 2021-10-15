REM docker build -t visitacao_server .
cp -r ..\visitacao_core\ .\visitacao_core
docker build -t visitacao_server -f Dockerfile_aot .
rm -r .\visitacao_core
docker stop visitacao_server
docker rm visitacao_server
REM docker build -t visitacao_server -f ./visitacao_server/Dockerfile .
docker run -e "dbhost=192.168.66.123" -d --name visitacao_server -p 4002:4002 visitacao_server  
