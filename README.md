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

`vagrant up`//helm not found. Is /usr/local/bin on your $PATH?`
`ssh vagrant@127.0.0.1 -p 2222`
#### inside vagrant@localhost:~>:
`echo $PATH` //: /home/vagrant/bin:/usr/local/bin:/usr/bin:/bin
kubectl get po --all-namespaces // CrashLoopBackOff for vclb-traefik-xxxx
kubectl -n  kube-system logs svclb-traefik-969kh -p  --all-containers //use updated k3s version to fix above
`cd ../../vagrant/manifests`

`kubectl apply -f /vagrant/kubernetes-manifests/dev/adservice.yaml`
kubectl logs adservice-8546655886-25g7c //Jan 23, 2022 11:27:24 PM io.grpc.netty.shaded.io.grpc.netty.NettyServerTransport notifyTerminated
INFO: Transport failed
io.grpc.netty.shaded.io.netty.channel.unix.Errors$NativeIoException: readAddress(..) failed: Connection reset by peer