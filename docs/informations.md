# The basic operation of K3s:

- k3s enables you to easily and quickly set up and run Kubernetes.
- K3s is a highly available, certified Kubernetes distribution designed for production workloads in unattended,
  resource-constrained, remote locations or inside IoT appliances.

# what is kubernetes

Kubernetes is an open-source container orchestration system for automating software deployment, scaling, and management.
Google originally designed Kubernetes, but the Cloud Native Computing Foundation now maintains the project.

# what is Rancher

Rancher is an open source software platform that enables organizations to run containers in production.
With Rancher, organizations no longer have to build a container services platform from scratch using a distinct set of open source technologies.

# The basic operation of Vagrant:

- Vagrant is an open-source tool that allows you to create, configure, and manage boxes of virtual machines through an easy to use command interface. Essentially,
  it is a layer of software installed between a virtualization tool (such as VirtualBox, Docker, Hyper-V) and a VM.

# The basic operation of K3d:

- k3d is a lightweight wrapper to run k3s (Rancher Lab's minimal Kubernetes distribution) in docker. k3d makes it very easy to create single- and multi-node k3s clusters in docker,
  e.g. for local development on Kubernetes.
  Note: k3d is a community-driven project but it's not an official Rancher (SUSE) product.

# kubernetes node

A Node is a worker machine in Kubernetes and may be either a virtual or a physical machine, depending on the cluster.
Each Node is managed by the control plane. A Node can have multiple pods, and the Kubernetes control plane automatically handles scheduling the pods across the Nodes in the cluster.

# kubernetes cluster

What is a Kubernetes cluster? A Kubernetes cluster is a set of nodes that run containerized applications.
Containerizing applications packages an app with its dependences and some necessary services. They are more lightweight and flexible than virtual machines.

# what is argoCD

- The CD in the name refers to continuous delivery, which is an extension of continuous integration (CI) since it automatically deploys all code changes
  to a testing and/or production environment after the build stage. Argo CD follows GitOps methodology

# difference between k3s and k3d

One of the key differences is that k3d deploys Docker-based k3s Kubernetes clusters while k3s deploys a virtual machine-based Kubernetes cluster.
K3d offers a more scalable version of k3s which might make it preferable to the standard k3s.

# what is ingress

- What is Ingress? Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.
  Traffic routing is controlled by rules defined on the Ingress resource

# pods

Pods are the smallest, most basic deployable objects in Kubernetes. A Pod represents a single instance of a running process in your cluster. Pods contain one or more containers,
such as Docker containers. When a Pod runs multiple containers, the containers are managed as a single entity and share the Pod's resources.
