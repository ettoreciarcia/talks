kubernetes-version?=v1.27.6
driver?=parallels
memory?=4096
cpu?=4
nodes?=2


.PHONY: init-cluster
init-cluster:
	minikube start \
        --kubernetes-version $(kubernetes-version) \
        --driver $(driver) \
        --memory $(memory) \
        --cpus $(cpu) \
        --nodes $(nodes) \

.PHONY: setup-cluster
setup-cluster: 
	kubectl apply -f manifests && helm install kubeinvaders --set-string config.target_namespace="ns-1" \
	-n kubeinvaders kubeinvaders/kubeinvaders --set ingress.enabled=true --set ingress.hostName=kubeinvaders.local --set deployment.image.tag=v1.9.6 && minikube addons enable ingress


.PHONY: setup
setup: init-cluster setup-cluster

.PHONY: delete-cluster
delete-cluster: 
	minikube delete





