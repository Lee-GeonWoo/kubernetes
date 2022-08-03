## Every Node
``` 
$ chmod +x kubeadm_installation.sh
$ source kubeadm_installation.sh
```

### Only Master Node
```
$ sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address={__REPLACE_WITH_PRIVATE_IP__MASTER}
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
$ kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
$ kubectl get nodes
```

Check TOKEN_NUM
<br/>
<br/>
```
$ kubeadm token list
```

Check HASH_NUM
<br/>
<br/>
```
$ openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
```

