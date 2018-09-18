# PivotalVersionsReport

./currentProductsInstalled.sh (PivnetAPIToken) https://(opsmanaddress) (opsmanuser) (opsmanpassword)
<p>
Report gets written to updatesAvailable.txt in the current directory.

Thing you need to tweak:
<p>
-The scripts are using ./om and ./pivnet - so you either need to have those executables in the same directory, or change the path that they are being called from in currentProducts.sh and updates.sh
<p>
-The scripts are using the opsman username and password parameters, so you will need to change that to use the client secret (or however you normally call OM). This is on the second line of currentProducts.sh
<p>
  
-By default it will show all versions of the product that are newer. This includes major versions.
<p>
    So for example if you have p-rabbitmq 1.12.8 installed you would see in the file:
<p>
p-rabbitmq  installed: 1.12.8  - Updates Available: 1.13.7  1.12.9
<p>
If you want to only return patch versions (so output like: p-rabbitmq  installed: 1.12.8  - Updates Available:   1.12.9)  uncomment lines 30-33 in the file compareVersions.sh.
