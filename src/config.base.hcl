data_dir = "/var/nomad.d"
enable_syslog = true
region = "us"

tls {
  http = true
  rpc  = true
  ca_file = "/opt/derpsoft/certs/ca-bundle.cert.pem"
  verify_https_client = true
  verify_server_hostname = false
}

consul {
  ssl = true
  auto_advertise = true
  server_auto_join = true
  ca_file = "/opt/derpsoft/certs/ca-bundle.cert.pem"
}

vault {
  enabled = true
  address = "https://vault.aws.derp.software:8200"
  ca_file = "/opt/derpsoft/certs/ca-bundle.cert.pem"
}
