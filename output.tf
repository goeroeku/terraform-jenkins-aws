output "jenkins_public_ip" {
  description = "The public IP address of the Jenkins server"
  value       = module.vm.public_ip
}