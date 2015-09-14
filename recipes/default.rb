# Cookbook Name:: msi-maker
# Recipe:: default
# Author:: Salim Alam
# License:: Apache 2.0
# Copyright 2015, Salim Alam

template 'msi-maker.wxs' do
  source 'msi-maker.wxs.erb'
  path "#{node.default['msi-maker']['output_path']}\\msi-maker.wxs"
end

msi_maker_msi_package "#{node.default['msi-maker']['msi_name']}" do
  source_path "#{node.default['msi-maker']['source_path']}"
  output_path "#{node.default['msi-maker']['output_path']}"
  install_dir "#{node.default['msi-maker']['target_dir']}"
end
