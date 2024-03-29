output "master_nodes" {
  value = module.Master-Node.Master_Node_IP
}

output "worker_node" {
  value = module.Worker-Node.Worker-Node_prvt
}
output "Ansible_IP" {
  value = module.ansible.ansible_IP
}
output "bastion_IP" {
  value = module.bastion.bastion_public_ip
}
output "Jenkins_IP" {
  value = module.jenkins.jenkins_ip
}
output "continous-testing" {
  value = module.continous-testing.continous_ip
}
output "HAProxy_Prod_IP" {
  value = module.HAproxy-Prod.prod_HAProxy_IP
}
output "HAProxy_Prod_BackupIP" {
  value = module.HAProxy_backup.prod_HAProxy_backup_IP
}
output "HAproxy_Stage_IP" {
  value = module.HAproxy-stage.stage_HAproxy_IP
}
output "HAproxy_Stage_BackupIP" {
  value = module.stage-HAProxy_backup.stage_HAproxy_IP
}
output "Jenkins_ELB" {
  value = module.jenkin-elb.jenkins_lb_dns
}
output "Stage_dns" {
  value = module.stg-lb.lb-dns
}
output "Prometheus_ELB" {
  value = module.prometheus_elb.prometheus-lb
}
output "Grafana_ELB" {
  value = module.grafana_elb.grafana-lb
}
