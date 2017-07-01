client {
    enabled = true
    servers = [ "172.17.5.129" ]
    # Enable raw_exec. We are not running nomad as root.
    options = {
        "driver.raw_exec.enable" = "1"
    }
}
