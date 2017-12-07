# KMP
# Members in Team
### Kyle Sheeley 
### Matendo Reguma
### Patrick McCardle
# Quick demo instructions
## 1) 
### Download and install all pre-reqs

### We recommend that all commands are run using sudo permissions.
#### First, clone this repo using the command, ```git clone https://github.com/CSCI-362-02-2017/KMP.git```
##### [Note: Github will require you to have access to this repo. Also Note: Some areas on certains machines have restricted permissions. We recommend that this repo is cloned in a location that doesn't have permission problems. If you are unsure, just clone the repo onto your desktop.]
#### Move into the install_scripts directory, using the command ```cd ./KMP/install_scripts```
#### Run all 3 scripts (download_and_install_docker, download_and_install_atom, nvm_install).
##### ```sudo ./download_and_install_docker``` -- ```sudo ./download_and_install_atom``` -- ```sudo ./nvm_install```

## 2)
#### Move into the /testAutomation/project/enketo, using the commands ```cd ..``` followed by ```cd ./testAutomation/project/enketo```
#### There is an enketo-express.zip file. Unzip that by first confirming you have unzip ```sudo apt-get install unzip```, then once you are certain you do, type ```unzip enketo-express.zip``` into the console. If it asks you to replace files, enter ```A```.

## 3)
#### Copy the Docker_run_script from the enketo directory into the newly created enketo-express-2 directory using the command ```cp Docker_run_script $(pwd)/enketo-express-2/```.
#### Move into the project root, using the command ```cd ./enketo-express-2``` and run the Docker_run_script that you just copied using the command ```sudo ./Docker_run_script```
#### When the script is done running you can open up another terminal and run ```sudo docker ps``` to confirm that the containers are up and running. From the same terminal you may type ```sudo docker logs -f enketo``` to confirm that there is an npm install happening inside the enketo container, give this time to finish as well as it may take some time depending on your system. Also note if you ever get stuck in a command during this process, use ```CTRL + C``` to exit any currently running commands. Beware as using this can cancel or terminate installing scripts.

## 4)
#### When the script is done running it will bash you into the project root from within the container, you may ```exit``` out of that container to be returned to your local machine, where you can perform the demo.
#### move to the testAutomation directory and copy/replace the Gruntfile.js located in the enketo-express-2 folder with the Gruntfile.js that is in the testAutomation directory using the command ```cp Gruntfile.js $(pwd)/project/enketo/enketo-express-2/Gruntfile.js```
#### From the project root download and apply the test reporter mochawesome using the following commands in THIS order.
#### ```sudo apt-get install npm```
#### ```sudo apt-get install nodejs-legacy```
#### ``` sudo npm install --global mocha```
#### ```sudo npm install --save-dev mochawesome```
#### ```sudo mocha Gruntfile.js --reporter mochawesome```

## 5) 
### {Important note: The testing summary will not display if your browser is open. It is therefore necessary that you close all of your browser windows before executing this last command.}
#### After you have run all the above commmands and waited for everything to install you can execute the tests folder from the testAutomation directory, using the command
#### ```sudo ./scripts/runAllTests.sh```

#### Testing report will be displayed across 5 tabs

### If full testing report does not display, cd into the project root, then into the mochawesome-report directory typing ```xdg-open filename.html``` will open the files.
