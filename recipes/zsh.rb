app = AppHelpers.new node['app']

git "#{app.node['user']['home']}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  user app.user
  group app.user
  action :checkout
  not_if "test -d #{app.node['user']['home']}/.oh-my-zsh"
end

zsh_theme = "../../.morr"
remote_file "#{app.node['user']['home']}/.morr.zsh-theme" do
  source 'https://raw.githubusercontent.com/morr/dotfiles/master/.oh-my-zsh/themes/morr.zsh-theme'
  owner app.user
  group app.user
end

template "#{app.node['user']['home']}/.zshrc" do
  source 'zshrc.erb'
  owner app.user
  group app.user
  variables(
    theme: zsh_theme,
    app_env: app.env,
    app_name: app.name,
    locale: 'en_US.UTF-8'
  )
end
