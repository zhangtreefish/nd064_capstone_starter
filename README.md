<p align="center">
<img src="src/frontend/static/icons/Hipster_HeroLogoCyan.svg" width="300" alt="Online Boutique" />
</p>

This is an application forked from the [GCP Microservice demo](https://github.com/GoogleCloudPlatform/microservices-demo).

**Online Boutique** is a cloud-native microservices demo application.
Online Boutique consists of a 10-tier microservices application. The application is a
web-based e-commerce app where users can browse items,
add them to the cart, and purchase them.

Find **Protocol Buffers Descriptions** at the [`./pb` directory](./pb).

| Service                                              | Language      | Description                                                                                                                       |
| ---------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| [frontend](./src/frontend)                           | Go            | Exposes an HTTP server to serve the website. Does not require signup/login and generates session IDs for all users automatically. |                                                       |
| [productcatalogservice](./src/productcatalogservice) | Go            | Provides the list of products from a JSON file and ability to search products and get individual products.                        |
| [currencyservice](./src/currencyservice)             | Node.js       | Converts one money amount to another currency. Uses real values fetched from European Central Bank. It's the highest QPS service. |
| [adservice](./src/adservice)                         | Java          | Provides text ads based on given context words.                                                                                   |

## Deploy
To deploy this application to a Kubernetes cluster use the following command:
```bash
kubectl apply -f kubernetes-manifests/dev/
```
 **Note**: The manifests should be updated to reference existing Docker images for each microservice.

 ## References
 /etc/zypp/repos.d/ to SUSE as /etc/apt to ubunto: https://www.linuxquestions.org/questions/suse-opensuse-60/where-is-the-souces-list-file-in-opensuse-12-a-939509/
 less /etc/passwd
 `ssh vagrant@127.0.0.1 -p 2222`
 on root password: https://forums.opensuse.org/showthread.php/433574-What-is-Default-Password 
 ### firewalld
 sudo systemctl enable firewalld
 https://documentation.suse.com/sles/15-SP1/html/SLES-all/cha-security-firewall.html
 https://www.cyberciti.biz/faq/set-up-a-firewall-using-firewalld-on-opensuse-linux/
 https://www.blackdown.org/how-to-stop-and-disable-firewalld-on-centos-7/
 https://unix.stackexchange.com/questions/176717/what-is-dhcpv6-client-service-in-firewalld-and-can-i-safely-remove-it
 tf@localhost:~> :
 vi firewalld_install.sh
 chmod 744 firewalld_install.sh
 ./firewalld_install.sh
 sudo systemctl start firewalld
 sudo systemctl status firewalld
 sudo firewall-cmd --state
ls -l /usr/lib/firewalld/zones/
sudo firewall-cmd --get-zones //after entering root pwd; get `block dmz drop external home internal public trusted work`
sudo grep -i DefaultZone /etc/firewalld/firewalld.conf //DefaultZone=public
or `sudo firewall-cmd --get-default-zone`
sudo firewall-cmd --list-services

sudo firewall-cmd --get-services
//Add dns service (TCP/UDP port 53):
sudo firewall-cmd --zone=public --add-service=dns --permanent
sudo firewall-cmd --zone=public --list-ports
 ### onie
 https://opencomputeproject.github.io/onie/overview/index.html
 ### service mesh 
 https://buoyant.io/service-mesh-manifesto/
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
  `echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc`

For compilers to find openjdk you may need to set:
  `export CPPFLAGS="-I/usr/local/opt/openjdk/include"`

  `java -version`
//openjdk version "17.0.1" 2021-10-19

`vagrant up`//helm not found. Is /usr/local/bin on your $PATH?`
`ssh vagrant@127.0.0.1 -p 2222`
#### inside vagrant@localhost:~>:
`echo $PATH` //: /home/vagrant/bin:/usr/local/bin:/usr/bin:/bin
kubectl get po --all-namespaces // CrashLoopBackOff for vclb-traefik-xxxx
kubectl -n  kube-system logs svclb-traefik-969kh -p  --all-containers //use updated k3s version to fix above
`cd ../../vagrant/manifests`

https://github.com/redhat-developer/vscode-java#project-jdks
vi "$HOME/Library/Application Support/Code/User/settings.json"
https://java.tutorials24x7.com/blog/how-to-install-java-17-on-mac
`export JAVA_HOME=/usr/libexec/java_home ///usr/local/Cellar/openjdk/17.0.1_1/libexec/openjdk.jdk/Contents/Home` to .zshrc
"/usr/libexec/java_home -V
export JAVA_HOME=`/usr/libexec/java_home -v 17.0.1`"