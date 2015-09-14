#
# CHANGE THE SETTINGS BELOW TO CONFIGURE MSI-MAKER CORRECTLY FOR YOUR USAGE
#

# This is the friendly name for your app, shown in the UI
default['msi-maker']['program_name'] = 'MSI-Maker Program Name'

# This is your 'manufacturer' name (required by WIX)
default['msi-maker']['manufacturer'] = 'MSI-Maker Inc.'

# This is your app's version
default['msi-maker']['version'] = '1.0.0'

# Set this to your own unique GUID
default['msi-maker']['upgrade_code'] = '6b848ff0-f25e-45b3-b674-7cac5e19eb3c'

# This is the path to the folder where your files to be packaged are located
default['msi-maker']['source_path'] = 'd:/inputdir'

# This is the path to your output folder - MUST NOT be the same as the source path
default['msi-maker']['output_path'] = 'd:/outputdir'

# This is the directory name that you want your app installed to
default['msi-maker']['install_dir'] = 'MSIMakerApp'

# This is the name of the MSI that will be generated
default['msi-maker']['msi_name'] = 'msimakerapp'
