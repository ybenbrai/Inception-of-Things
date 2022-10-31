# Part 1

- test part 1
  `kubectl get nodes -o wide`

# Part 2

- view ingress by typing the following command
  `kubectl describe ingress`

- test part 2
  `kubectl get nodes -o wide`

- Display name of controller and the internal IP adress

`kubectl get all -n kube-system`

- Test with curl

`curl -H "Host:app2.com" 192.168.42.110`

- List one or more pods

`kubectl get pod`

- Check logs
  `sudo journalctl -u k3s | tail -n 20`
