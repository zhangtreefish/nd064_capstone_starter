# Ad Service

The Ad service provides advertisement based on context keys. If no context keys are provided then it returns random ads.

## Building locally

The Ad service uses gradlew to compile/install/distribute. Gradle wrapper is already part of the source code. To build Ad Service, run:

```
./gradlew installDist
```
It will create executable script src/adservice/build/install/hipstershop/bin/AdService

### Upgrading gradle version
If you need to upgrade the version of gradle then run

```
./gradlew wrapper --gradle-version <new-version>
```

## Building docker image

From `src/adservice/`, run:

```
docker build ./
```

### java 17
 `/usr/libexec/java_home -V` //to see all java
 java -version
 https://note.hommalab.io/posts/java/install-java17-and-maven/
 https://stackoverflow.com/questions/69875335/mac-how-to-install-java-17
`brew install java`
 For the system Java wrappers to find this JDK, symlink it with
  `sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk`

openjdk is keg-only, which means it was not symlinked into /usr/local,
because macOS provides similar software and installing this software in
parallel can cause all kinds of trouble.

If you need to have openjdk first in your PATH, run:
  `echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc` //after this java -version : 17

For compilers to find openjdk you may need to set:
  `export CPPFLAGS="-I/usr/local/opt/openjdk/include"`

  `java -version`
//openjdk version "17.0.1" 2021-10-19
https://stackoverflow.com/questions/24342886/how-to-install-java-8-on-mac
https://github.com/redhat-developer/vscode-java#project-jdks
vi "$HOME/Library/Application Support/Code/User/settings.json"
https://java.tutorials24x7.com/blog/how-to-install-java-17-on-mac
`export JAVA_HOME=/usr/libexec/java_home ///usr/local/Cellar/openjdk/17.0.1_1/libexec/openjdk.jdk/Contents/Home` to .zshrc
"/usr/libexec/java_home -V
export JAVA_HOME=`/usr/libexec/java_home -v 17.0.1`"

/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
`brew install openjdk@11` :
For the system Java wrappers to find this JDK, symlink it with
  sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

openjdk@11 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have openjdk@11 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc

For compilers to find openjdk@11 you may need to set:
  export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"

  export JAVA_HOME=`/usr/libexec/java_home -v 11.0.12`
  java -version //17? 11 after new terminal: java -version
openjdk version "11.0.12" 2021-07-20
OpenJDK Runtime Environment Homebrew (build 11.0.12+0)
OpenJDK 64-Bit Server VM Homebrew (build 11.0.12+0, mixed mode)

https://gist.github.com/gwpantazes/50810d5635fc2e053ad117b39b597a14

invalid runtime for JavaSE-17: Runtime at '/usr/local/Cellar/openjdk/17.0.1_1/libexec/openjdk.jdk/Contents/Home' is not compatible with the 'JavaSE-17' environment.

https://stackoverflow.com/questions/63294340/what-is-the-difference-between-installdist-in-distribution-plugin-and-build-in-j

--from in COPY for Dockerfile: https://docs.docker.com/engine/reference/builder/#copy

"use -source 16 or higher to enable pattern matching in instanceof"

https://logging.apache.org/log4j/2.x/security.html