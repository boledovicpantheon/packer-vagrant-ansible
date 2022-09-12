#! /bin/bash
while true 
do
  read -p "
  1. Run packer to build template with Ubuntu 22.04
  2. Run packer to build template with Ubuntu 20.04
  3. Run vagrant to install and configure templates with ansible
  4. Exit

  You can choose multiple options, just separate them with space!

  "
  stringarray=($REPLY) # this will split given string to substrings separated by space

  for i in "${stringarray[@]}"
  do

    case $i in
      1)
        cd packer && \
        packer build --var-file ubuntu2204.pkrvars.hcl ubuntu-base.pkr.hcl && \
        cd ..;;
      2)
        cd packer && \
        packer build --var-file ubuntu2004.pkrvars.hcl ubuntu-base.pkr.hcl && \
        cd ..;;
      3)
        vagrant up;;
      4)
        exit;;
      *)
        echo "Error: This option is not available, choose from given ones. ";;
    esac

  done
done