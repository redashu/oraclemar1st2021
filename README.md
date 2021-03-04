# Remote cluster connecting 

```
❯ kubectl  get  nodes --kubeconfig  admin.conf
NAME          STATUS   ROLES                  AGE   VERSION
master-node   Ready    control-plane,master   17h   v1.20.4
minion-1      Ready    <none>                 17h   v1.20.4
minion-2      Ready    <none>                 17h   v1.20.4
minion-3      Ready    <none>                 17h   v1.20.4
❯ 
❯ 
❯ kubectl  get  pods  --kubeconfig  admin.conf
No resources found in default namespace.
❯ export KUBECONFIG=/Users/fire/Desktop/oracle1stmarch2021/admin.conf
❯ echo $KUBECONFIG
/Users/fire/Desktop/oracle1stmarch2021/admin.conf
❯ kubectl get  nodes
NAME          STATUS   ROLES                  AGE   VERSION
master-node   Ready    control-plane,master   17h   v1.20.4
minion-1      Ready    <none>                 17h   v1.20.4
minion-2      Ready    <none>                 17h   v1.20.4
minion-3      Ready    <none>                 17h   v1.20.4
❯ kubectl get  po
No resources found in default namespace.



```

