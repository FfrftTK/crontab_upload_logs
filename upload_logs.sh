#!/bin/bash
ZIP_FILE_NAME=$UPLOAD_LOGS_ZIP_FILE_NAME
WORKING_DIR=$UPLOAD_LOGS_WORKING_DIR
UPLOAD_URI=$UPLOAD_LOGS_UPLOAD_URI
LOG_FILE_DIR="${WORKING_DIR}/log/"

echo $(date "+%Y-%m-%d_%H:%M:%S") 
echo "\U1F5DC Task: Compressing log files."
zip -r $ZIP_FILE_NAME $LOG_FILE_DIR
echo $ZIP_FILE_NAME
echo "\u2705 Completed: Compressing log files.\n"
echo "\u23EB Task: Uploading compressed files."
curl -F "file=@${WORKING_DIR}/${ZIP_FILE_NAME}" $UPLOAD_URI \
&& echo "\n" \
&& echo "\u2705 Completed: Uploading compressed files." \
&& (echo "\U1F5D1 Removing log files..." \
  && (rm $LOG_FILE_DIR* || echo "\u26A0 Warning! Failed to remove logs.") \
  && echo "\u2728 $(date "+%Y-%m-%d_%H:%M:%S") Done!" ) \
|| echo "\u274C Error! Uploading process failed!"

