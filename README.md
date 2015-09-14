# msi-maker
The *msi-maker* cookbook is a simple Windows Installer Package (MSI) builder.

It addresses the scenario of bundling up a set of files into an MSI to be installed on a target machine into a target folder. Sometimes, this is all that is needed (e.g., for 'portable' apps), and this cookbook makes it simple to build the MSI with a single Chef command. It does not try to do much more than that, although it would be fairly straightforward to modify the cookbook to add more bells and whistles.

## Installation
Simply clone the repo locally to get started:

```powershell
git clone https://github.com/chefsalim/msi-maker.git
```

See instructions below for how to use the cookbook.

## Features and capabilities
The *msi-maker* cookbook provides:

* Capability to build a MSI using a single chef command
* Harvest a set of files (and any sub-folders, etc) from a folder automatically
* Provide a simple UI (can be by-passed) to select a destination folder
* Easy to modify for your own needs

## Who should use this cookbook?
Anyone who has a need to build MSI packages in an automated manner can potentially use and benefit from this cookbook.

## Requirements
This cookbook supports only the Windows operating system. It requires
Windows Server 2008 / Windows 7 or later (per the Chef supported platforms).

## Pre-requisites
You must have the following installed on your machine in order to install and use this cookbook:

1. Git tools. Download and install from https://git-scm.com/downloads or via Chocolatey (choco install git) if needed.

2. WiX Toolset (any recent version should be fine). Install from http://wixtoolset.org or via Chocolatey (choco install wixtoolset). Make sure the WIX toolset binaries are in your path.

3. Chef-client must be installed. Simply install ChefDK from https://downloads.chef.io/chef-dk to get Chef Client and other goodies.

## How to use
Using this cookbook is straightforward:

1. Clone the cookbook locally
2. Edit msi-maker/attributes/default.rb to customize your settings
3. Run Berkshelf to prepare the cookbook
4. Run chef-client to package up your files and create the MSI

```powershell
# Clone this repository and cd to it
git clone https://github.com/chefsalim/msi-maker.git
cd msi-maker

# Edit the attributes file (use whatever favorite editor you prefer)
notepad attributes/default.rb

# Use Berkshelf to prepare the cookbook and any dependencies
berks vendor cookbooks

# Run `chef-client` in local mode to create the MSI
chef-client -z -o 'msi-maker'
```

After a short while, the MSI should be created in your output folder (the one that you specified in step 2)

You can execute the MSI file normally which will present a UI for installation, or you can invoke it without a UI, e.g.:

```powershell
your-app.msi TARGETDIR=C:\ /quiet
```

## Troubleshooting
In case you run into errors, make sure to double check all your settings in the attributes/default.rb file, and try again.

Please also ensure the the WIX Toolset binaries are in your path.

If you get a Berkshelf error, try deleting the generated cookbooks folder and re-try.

Also, note that once the MSI is created in the designated output folder, a second run of chef-client will not try to re-create it (as the Chef recipes are idempotent). Either delete the MSI, or change your settings in the attributes/default.rb to point to a different output folder or different app name.

## License
Copyright:: Copyright (c) 2015 Salim Alam

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
