build:
    docker run -it --rm --name my-maven-project -v "$PWD"/source:/usr/src/app -v "$HOME"/.m2:/root/.m2 -w /usr/src/app maven:3.6.3-jdk-11 mvn clean install

