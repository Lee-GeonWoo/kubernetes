wget https://raw.githubusercontent.com/59nezytic/kubeFed_installation/master/kubefed_installation.sh
chmod +x kubefed_installation.sh 
./kubefed_installation.sh 

systemctl daemon-reload

for i in $(seq "${NUM_CLUSTERS}"); do
  kubefedctl join cluster${i} --cluster-context cluster${i} --host-cluster-context cluster1 --kubefed-namespace=kube-federation-system --v=2
  kubectl create namespace demo --context=cluster${i}
  kubectl label namespace demo istio-injection=enabled --context=cluster${i}
done
