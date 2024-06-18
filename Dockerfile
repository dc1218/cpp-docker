FROM alpine:3.19  
  
RUN apk add --no-cache \  
    build-base \  
    boost-dev \  
    cmake \  
    fmt-dev \  
    luajit-dev \  
    mariadb-connector-c-dev \  
    openssl-dev \  
    pugixml-dev  
  
COPY workspace /workspace/  
  
WORKDIR /workspace  
  
RUN cmake -B build && cmake --build build  

RUN cp build/echo .
  
RUN ls -al /workspace/echo || { echo " not find 'echo'"; exit 1; }  
  
RUN chmod +x /workspace/echo  
  
ENTRYPOINT ["sh", "runEchoServer.sh"]