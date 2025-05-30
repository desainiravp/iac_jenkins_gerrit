output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "gerrit_public_ip" {
  value = aws_instance.gerrit.public_ip
}
