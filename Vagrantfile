require_relative 'vagrant.rb'
include AWS_CONFIG_VAR

Vagrant.configure("2") do |config|
  config.vm.define "aws-box" do |box|
    box.vm.box = "dummy"
    box.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    box.aws_extras.record_zone="altidev.net."
    box.aws_extras.record_name="#{HOSTNAME}"
    box.aws_extras.record_type="A"
    box.aws_extras.record_ttl="300"
  end

  config.vm.provider :aws do |aws, override|
    aws.ami = AWS_DEF_AMI
    aws.region = AWS_DEF_REG
    aws.security_groups = AWS_DEF_SG
    aws.subnet_id = AWS_DEF_SUBNET
    aws.instance_type = "t2.small"
    aws.keypair_name = AWS_DEF_KEYPAIR
    aws.access_key_id = AWS_ACCESS_KEY_ID
    aws.secret_access_key = AWS_SECRET_ACCESS_KEY
    override.ssh.username = "root"
    override.ssh.private_key_path = AWS_ROOT_KEY
	aws.tags = {
        "Name" => "#{HOSTNAME}",       
        "Creator" => "soumitra.kar"
    }

  end
  
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "springboot_petclinic"
  end
    
end
