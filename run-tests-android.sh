#!/bin/bash

# Set environment variable to let test scripts know that this is a testdroid run
export TESTDROID=1

TEST=${TEST:="your_test.js"} #Name of the test file

##### Cloud testrun dependencies start
echo "Extracting tests.zip..."
unzip tests.zip

echo "Starting Appium ..."
<<<<<<< HEAD
<<<<<<< HEAD
/opt/appium/appium/bin/appium.js --log-no-colors --log-timestamp >appium.log 2>&1 &
=======
appium-1.5 --log-no-colors --log-timestamp >appium.log 2>&1 &
>>>>>>> parent of cb3ae22... Merge pull request #24 from Applifier/feature/removed_appium_start
=======
appium-1.5 --log-no-colors --log-timestamp >appium.log 2>&1 &
>>>>>>> parent of 4a126b5... Removed autostart of appium for both Android and iOS. If your scripts require appium then please start it yourselfe. There's now several versions of appium and not all tests use appium at all. It does not make much sense to auto start it each time.

echo -n "Waiting for Appium server to be ready "
start_string="Appium REST http interface listener started"
retry=30
while [ $retry -gt 0 ]
do
  sleep 1
  echo -n "."
  if [ -n "$(grep -s "$start_string" appium.log)" ]; then
    retry=0
    echo " done"
    echo $(grep "$start_string" appium.log)
  else
    ((retry--))
    if [ $retry -eq 0 ]; then
      echo " waited 30 seconds but server was not ready"
    fi
  fi
done

##### Cloud testrun dependencies end.

export APPIUM_APPFILE=$PWD/application.apk #App file is at current working folder

## Run the test:
echo "Running test ${TEST}"
rm -rf screenshots
mkdir screenshots

source 'run-tests-android.sh'
