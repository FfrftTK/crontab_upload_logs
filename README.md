# crontab_upload_logs
This is a shell script based file uploading system. Files in the `log/` are uploaded periodically by crontab task.

# setup
Set proper variables for your environment in `cron.conf` .
```
# Upload logs related
UPLOAD_LOGS_ZIP_FILE_NAME="zip file name"
UPLOAD_LOGS_WORKING_DIR="script existing directory"
UPLOAD_LOGS_UPLOAD_URI="uri of end point to update log files"
```
Start crontab task.
```
$ crontab cron.conf
```
