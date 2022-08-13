# Before Installation
Set number of clusters
```
$ export NUM_CLUSTERS=3
```

## Install KubeFed
ex) cluster1(host), cluster2(member), cluster3(member)

```
$ chmod +x kubefed_installation.sh
$ source kubefed_installation.sh
```

#### Example 1
Federated Bookinfo Service
##### ※ Namespace : default
```
kubectl apply -f federated-bookinfo.yaml
```

#### Example 2
Federated Voting-app Service
##### ※ Namespace : demo
```
kubectl apply -f federated-voting-app.yaml
```
