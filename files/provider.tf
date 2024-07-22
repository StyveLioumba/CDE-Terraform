resource "local_file" "test" {
    filename = ("./resolv.conf")

    content = templatefile("./resolv.conf.tfpl",{
        ip_addrs = [
            "172.16.1.100",
            "9.9.9.9",
            "1.1.1.1"
        ]
    })

}
