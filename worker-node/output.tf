output "Worker-Node_prvt" {
  value       = aws_instance.PACUJPEU1_worker-node.*.private_ip
  description = "Worker-Node public IP"
}

output "Worker-Node_InstanceID" {
  value       = aws_instance.PACUJPEU1_worker-node.*.id
  description = "Worker-Node Instance ID"
}
