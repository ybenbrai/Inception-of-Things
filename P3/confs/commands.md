# checking cluster

`sudo k3d cluster list`

# cluster infos

`sudo kubectl cluster-info`

# checking nodes

`sudo k3d node list`

# checking pods

`sudo kubectl get pods -A`

# checking services

`sudo kubectl get services -A`

# checking nodes

`sudo kubectl get nodes`

# checking deployments

`sudo kubectl get deployments -A`

`sudo kubectl get pods -n dev`
`sudo kubectl get pods -n argocd`

# get the password

`sudo kubectl get secret argocd-initial-admin-secret -n argocd -o yaml`

# decode the password

`echo pwd | base64 --decode`
