openshift4-ansible
=========

An Ansible role to perform post-provisioning tasks

Requirements
------------
1. OC Kubeconfig file

Role Variables
--------------

```
var_ntp_ip: 192.168.21.2
var_kubeconfig_path: ~/.kube/config
var_set_labels_taints:
  - node_name: <ingress-node-name>
    label: node-role.kubernetes.io/ingress=
    taints: ingress=reserved:NoSchedule
  - node_name: <ingress-node-name>
    label: node-role.kubernetes.io/ingress=
    taints: ingress=reserved:NoSchedule
  - node_name: <monitoring-node-name>
    label: node-role.kubernetes.io/log=
    taints: monitoring=reserved:NoSchedule
  - node_name: <monitoring-node-name>
    label: node-role.kubernetes.io/log=
    taints: monitoring=reserved:NoSchedule
  - node_name: <monitoring-node-name>
    label: node-role.kubernetes.io/monitoring=
    taints: monitoring=reserved:NoSchedule
  - node_name: <log-node-names>
    label: node-role.kubernetes.io/log=
    taints: log=reserved:NoSchedule
  - node_name: <log-node-names>
    label: node-role.kubernetes.io/log=
    taints: log=reserved:NoSchedule
  - node_name: <log-node-names>
    label: node-role.kubernetes.io/log=
    taints: log=reserved:NoSchedule
config_dest: ${HOME}/oc4/
```

License
-------

BSD
