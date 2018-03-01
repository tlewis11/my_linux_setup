#
# Cookbook Name:: config
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

home_dir='/Users/timlewis'

cookbook_file "#{home_dir}/.vimrc" do
  source 'vimrc'
  owner 'timlewis'
  group 'staff'
  mode '0755'
  action :create
end

directory "#{home_dir}/.vim" do
  owner 'timlewis'
  group 'staff'
  mode '0755'
  action :create
end

directory "#{home_dir}/.vim/autoload" do
  owner 'timlewis'
  group 'staff'
  mode '0755'
  action :create
end

directory "#{home_dir}/.vim/bundle" do
  owner 'timlewis'
  group 'staff'
  mode '0755'
  action :create
end

bash 'install_pathogen' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  install_pathogen(){
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  }
  install_pathogen
  EOH
end

def install_pathogen_plugin(name:, git_repo:)
  home_dir='/Users/timlewis'
  git 'nerdtree' do
    repository git_repo 
    destination "#{home_dir}/.vim/bundle/#{name}"
    revision 'master'
    action :sync
  end
end

pathogen_plugins = [
  {name: 'nerdtree', repo:'https://github.com/scrooloose/nerdtree.git'},
  {name: 'vim-javacomplete2', repo:'https://github.com/artur-shaik/vim-javacomplete2.git'}
]

pathogen_plugins.each do |plugin|
  install_pathogen_plugin name: plugin[:name], git_repo: plugin[:repo] 
end
