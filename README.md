# USAGE
```bash
    # install vagrant
    # install virtualbox
    # install chef
    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-chef-zero
    # optional
    vagrant plugin install vagrant-vbox-snapshot
    cd chef-repo
    berks vendor cookbooks/
    
    # and then
    vagrant up
```

