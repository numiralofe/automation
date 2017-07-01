job "deploy-app" {

  datacenters = ["dc1"]

  type = "batch"

  constraint {
    attribute = "${attr.unique.hostname}"
    regexp = ".*deploy-app"
  }

  task "deploy-app" {
    driver = "raw_exec"

    config {
      # When running a binary that exists on the host, the path must be absolute
      command = "/opt/playbooks/deploy/deployapp.sh"
    }

    resources {
      # defaults
    }
  }
}
