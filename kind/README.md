# KinD (Kubernetes in Docker)

kind is a tool for running local Kubernetes clusters using Docker container “nodes”. kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI. **(DOCS)**

kind는 로컬 쿠버네티스 클러스터를 실행시키기 위해 도커를 사용하기 때문에 도커 데몬만 있으면 쿠버네티스 클러스터를 생성할 수 있다.

## Prerequisite
> Docker
```
$ apt update && apt install docker.io -y
```
> kubectl
```
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
$ chmod +x kubectl
$ mv ./kubectl /usr/local/bin/kubectl
```

### Install Kind
```
$ curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
$ chmod +x ./kind
$ mv ./kind /usr/local/bin
```

### Create Kind cluster
* Before you start, set NUM_CLUSTERS
```
$ export NUM_CLUSTERS=3
$ echo $NUM_CLUSTER
3
```
```
$ chmod +x util.sh
$ source util.sh
```

#### or  
<br/>
One master node and two worker nodes  

```
$ cat<<EOF > kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF
```

* Make one cluster
```
$ kind create cluster --config kind-config.yaml
```

* More than two clusters
```
$ for i in {1..N}
$ do
$ kind create cluster --name cluster${i} --config kind-config.yaml
$ done
````

### Checking
* Cluster(s)
```
$ kind get clusters
cluster1
cluster2
cluster3
```

* Node(s)
```
$ kubectl get nodes -o wide
NAME                     STATUS   ROLES                  AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE       KERNEL-VERSION       CONTAINER-RUNTIME
cluster1-control-plane   Ready    control-plane,master   2m51s   v1.20.2   172.18.0.8    <none>        Ubuntu 20.10   4.15.0-124-generic   containerd://1.4.0-106-gce4439a8
cluster1-worker          Ready    <none>                 2m13s   v1.20.2   172.18.0.9    <none>        Ubuntu 20.10   4.15.0-124-generic   containerd://1.4.0-106-gce4439a8
cluster1-worker2         Ready    <none>                 2m14s   v1.20.2   172.18.0.10   <none>        Ubuntu 20.10   4.15.0-124-generic   containerd://1.4.0-106-gce4439a8
```
