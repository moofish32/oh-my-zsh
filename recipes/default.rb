#
# Cookbook Name:: oh-my-zsh
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "git"
include_recipe "zsh"

if platform?('ubuntu')
  user_id = node['current_user']
  
  git "/home/#{user_id}/.oh-my-zsh" do
    repository "https://github.com/robbyrussell/oh-my-zsh.git"
    reference "master"
    user user_id
    group user_id
    action :checkout
    not_if "test -d /home/#{user_id}/.oh-my-zsh"
  end


  template "/home/#{user_id}/.zshrc" do
    source "zshrc.erb"
    owner user_id
    group user_id
    variables( :theme => ( theme || node[:ohmyzsh][:theme] ))
    action :create_if_missing
  end

  cookbook_file "#{node['etc']['passwd'][node['current_user']]['dir']}/.oh-my-zsh/themes/kono.zsh-theme" do
    source "kono.zsh-theme"
    owner node['current_user']
    backup false
    mode "0777"
  end
end
