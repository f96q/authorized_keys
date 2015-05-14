node[:deploy].each do |application, deploy|
  template "#{deploy[:home]}/.ssh/authorized_keys" do
    source 'authorized_keys.erb'
    owner deploy[:user]
    group deploy[:group]
    mode 0600
    variables(:authorized_keys => node[:authorized_keys])
  end
end
