# Cookbook Name:: msi-maker
# Provider:: msi_package
# Author:: Salim Alam
# License:: Apache 2.0
# Copyright (c) 2015 Salim Alam

require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

def load_current_resource
  @instance = new_resource.instance
  @source_path = new_resource.source_path || 'undefined'
  @output_path = new_resource.output_path || 'undefined'
  @install_dir = new_resource.install_dir || 'undefined'
end

action :create do
  if ::File.file?(::File.join(@new_resource.output_path, @new_resource.instance+".msi"))
    Chef::Log.info "#{@new_resource.instance}.msi already exists - nothing to do."
  else
    converge_by("Create #{@new_resource}") do
      Chef::Log.info "Creating MSI from #{@source_path} to #{@output_path}"
      harvest_source_dir
      compile_wxs
      link_wixobj
    end
  end
end

def harvest_source_dir
  heat = Mixlib::ShellOut.new("heat.exe dir \"#{@source_path}\" -dr MyProgramDir -cg MyFilesGroup -gg -gl -sf -srd -var \"var.MyDir\" -out \"#{@output_path}\\msi-maker-files.wxs\"")
  heat.run_command
  heat.error!
end

def compile_wxs
  candle = Mixlib::ShellOut.new("candle.exe -dMyDir=\"#{@source_path}\" \"#{@output_path}\\msi-maker.wxs\" \"#{@output_path}\\msi-maker-files.wxs\" -o \"#{@output_path}\\\\\"")
  candle.run_command
  candle.error!
end

def link_wixobj
  light = Mixlib::ShellOut.new("light.exe -ext WixUIExtension \"#{@output_path}\\msi-maker.wixobj\" \"#{@output_path}\\msi-maker-files.wixobj\" -o \"#{@output_path}\\#{@instance}.msi\"")
  light.run_command
  light.error!
end
