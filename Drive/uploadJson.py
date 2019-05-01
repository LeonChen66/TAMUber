import sys
from pydrive.drive import GoogleDrive
from pydrive.auth import GoogleAuth
import os
import time
# os.system('')

while True:
    gauth = GoogleAuth()
    # Creates local webserver and auto handles authentication.
    gauth.LocalWebserverAuth()
    drive = GoogleDrive(gauth)
    try:
        name = 'README.md'  # It's the file which you'll upload
        file = drive.CreateFile()  # Create GoogleDriveFile instance
        file.SetContentFile(name)
        file.Upload()
    except:
        print("Unexpected error:", sys.exc_info()[0])
    
    time.sleep(30)