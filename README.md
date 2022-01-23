## docker command
* 도커 실행 중 프로세스
> docker ps --format 'table{{.Names}}\table{{.Image}}'

* 도커 모든 프로세스
> docker ps

* 컨테이너 실행 (create and start)
> docker run ${imageName}

* 컨테이너 생성
> docker create ${imageName}

* 컨테이너 시작
> docker start -a ${imageName}

* 컨테이너 중지
> docker kill ${imageName}, docker stop ${imageName}

* 컨테이너 삭제
> docker rm ${imageName}

* 모든 컨테이너 삭제
> docker rm `docker ps -a -q`  => &apos; 백틱

* 도커 이미지, 컨테이너, 네트워크 삭제
> docker system prune

* 실행 중 컨테이너에 명령어 전달
> docker exec -it <컨테이너아이디> redis-cli

* 도커 참조 관련

1. 첫번쨰 참조 하지말 폴더 or 파일
2. 두번쨰 참조할 폴더 or 파일:도커안 디렉토리
> docker run -d -p 5000:8080 -v /usr/src/app/node_modules -v E:\workspace\docker\docker\nodejs-docker-app:/usr/src/app  tabliser/nodejs

1. it: interactive(상호적인) terminal(단말기)
   Error response from daemon: create $(pwd): "$(pwd)" includes invalid characters for a local volume name, only "[a-zA-Z0-9][a-zA-Z0-9_.-]" are allowed. If you intended to pass a host directory, use absolute path.
   See 'docker run --help'
# 도커 생성
* 베이스 이미지 명시
> FROM baseImage

* 추가적 필요한 파일 다운로드
* <이미지이름>:<태그> 형식으로 작성
* 태그를 안붙이면 자동적으로 최신 다운로드
* ex) ubuntu:14.04
> RUN command

* 컨테이너 시작 시 실행 될 명령어 명시
> cmd ["executable"]

* docker 빌드
> docker build ./

* docker 네이밍 빌드
> docker build -t tabliser/hello:latest ./

> docker run tabliser/hello

# docker compose

`docker compose 파일 위치로 이동`

* docker compose 실행
> docker compose up

* docker compose 빌드 후 재실행
> docker compose up --build

* docker compose 빌드 후 재실행
> docker compose up -d --build

* docker compose 중지
> docker compose down

# react-app 으로 도커 실행

* 임의의 도커파일로 빌드
> docker build -f Dockerfile.dev ./

* 임의의 도커파일 이미지이름으로 빌드
> docker build -f Dockerfile.dev -t tabliser/docker-react ./

* 포트포워딩 추가하며 도커파일 run
> docker run -p 3000:3000 tabliser/docker-react

* 포트포워딩 추가하며 도커파일 run (안될경우 -it 추가)
> docker run -it -p 3000:3000 tabliser/docker-react

* 실시간 docker 실행
> docker run -it -p 3000:3000 -v /usr/src/app/node_modules -v E:\workspace\docker\docker\docker-react-app:/usr/src/app tabliser/docker-react

- test