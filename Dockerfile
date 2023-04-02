# Use the Windows Server Core 2019 base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install IIS
RUN powershell -Command Add-WindowsFeature Web-Server

WORKDIR /inetpub/wwwroot

# Copy the index.html file to the container
COPY index.html .

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start the IIS service
CMD ["powershell", "-Command", "Start-Service W3SVC; while($true) { Start-Sleep -Seconds 3600 }"]
