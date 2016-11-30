yum_package 'git'

execute 'Install Java' do
  command 'yum install java-1.8.0-openjdk* -y'
end

git '/tmp/petclinic' do
  repository 'https://github.com/spring-projects/spring-petclinic.git'
  revision 'master'
  action :sync
end

execute 'Run Application' do
  cwd '/tmp/petclinic'
  command './mvnw spring-boot:run &'
end
