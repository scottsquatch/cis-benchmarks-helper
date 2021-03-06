# CIS Benchmarks Helper Scripts

Scripts which assist with setting up system in accordance with [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/).

The main branch will not have any scripts by default, to use you will need to switch branches. Each branch should roughly match the name of the 
corresponding [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/) file.

## Installing
To install, simply just clone the files to the directory of your choosing. Personally, I prefer to put in a subfolder of ```/usr/local``` or ```~/.local/bin```.

```bash
INSTALL_DIR=~/.local/bin/cis-benchmarks-helper
BRANCH=fedora-28
mkdir -p $INSTALL_DIR && pushd $INSTALL_DIR && git clone https://github.com/scottsquatch/cis-benchmarks-helper.git . && git branch $BRANCH && popd
# Set execution bit
find $INSTALL_DIR/ -maxdepth 1 -type f -name "*.sh" -not -name "common.sh" -print0 | xargs -0 chmod +x
unset INSTALL_DIR
unset BRANCH
```

## Uninstalling
Simply remove the files
```bash
rm -rf ~/.local/bin/cis-benchmarks-helper
```

## Using
Each section of the CIS Benchmarks should have two files:
X_Y_Z_audit.sh
X_Y_Z_fix.sh

To run you can either make sure that ```INSTALL_DIR``` from above is in path or just call the file directly:
```bash
~/.local/bin/cis-benchmarks-helper/1_1_1_1_audit.sh
# if you need to fix
~/.local/bin/cis-benchmarks-helper/1_1_1_1_fix.sh
```
Here X_Y_Z corresponds to the [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/) number.
It is recommended to go through the guide, run the audit file and then the fix file if necessary.
**Note: Not every rule can be automated, so pay attention to the output of the scripts!**

