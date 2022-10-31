# Cluster Management

`kubectl get nodes -o wide`

- Display endpoint information about the master and services in the cluster
  `kubectl cluster-info`
  `kubectl cluster-info dump`

- Get the configuration of the cluster
  `kubectl config view`

- List the API resources that are available
  `kubectl api-resources`

- List the API versions that are available
  `kubectl api-versions`

- List everything
  `kubectl get all --all-namespaces`

- Display the detailed state of a pods
  `kubectl describe pod <pod_name>`

- Display Resource usage (CPU/Memory/Storage) for pods
  `kubectl top pod`

- Links

- Config repo: `https://gitlab.com/nanuchi/argocd-app-config`

- Docker repo: `https://hub.docker.com/repository/docker/nanajanashia/argocd-app`

- Install ArgoCD: `https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd`

- Login to ArgoCD: `https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli`

- ArgoCD Configuration: `https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/`
