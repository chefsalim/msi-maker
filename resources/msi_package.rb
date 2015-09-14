# Cookbook Name:: msi-maker
# Resource:: msi_package
# Author:: Salim Alam
# License:: Apache 2.0
# Copyright (c) 2015 Salim Alam

actions :create
default_action :create

attribute :instance, kind_of: String, name_attribute: true
attribute :source_path, kind_of: String
attribute :output_path, kind_of: String
attribute :install_dir, kind_of: String