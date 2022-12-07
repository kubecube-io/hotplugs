1. 下载chart包：https://g.hz.netease.com/private_cloud_supports/qingzhou-helm/-/tree/v1.20200628/ncs-logagent

2. 下载helm ctl工具，并解压
```
cd ~
wget https://qingzhou-gitops.nos-eastchina1.126.net/helm/helm-v3.2.1-linux-amd64.tar.gz
tar xf helm-v3.2.1-linux-amd64.tar.gz
```
3. 进入ncs-logagent目录，根据环境信息修改下values.yaml的值
```
cd qingzhou-helm/ncs-logagent
vim values.yaml
```
一般只需要修改 OnlyEnvoyGW、elasticsearch、clustername 配置，

- OnlyEnvoyGW：是否只部署了Envoy网关，只有Envoy网关时，不用daemoset的方式每个节点都部署，在标准的轻舟环境时，需要每个节点都部署上去
- elasticsearch： es 集群地址，多ip用 , 隔开
- clustername 计算集群名称，参加轻舟运维管理 - ncs 计算集群页面中的对应集群名称

4. 创建namespaces
```
~/kubectl --kubeconfig ~/{{ cluster_name }}/admin.conf create ns {{ item }}
```

5. 安装部署
```
~/helm install --kubeconfig ~/{{ cluster_name }}/admin.conf ncs-logagent ./ -n skiff-logagent"
```