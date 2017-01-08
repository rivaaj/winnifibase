FROM rivaaj/winjavabase
MAINTAINER Rivaaj Jumna

SHELL ["powershell", "-command"]

ARG NIFI_VERSION=1.1.1
ARG NIFI_URL=http://archive.apache.org/dist/nifi/



RUN mkdir nifi

WORKDIR nifi

# http://archive.apache.org/dist/nifi/1.1.1/nifi-1.1.1-bin.zip

RUN $dloadurl = $env:NIFI_URL + $env:NIFI_VERSION + '/nifi-' + $env:NIFI_VERSION + '-bin.zip' ; \
    $dloadfile = 'nifi-' + $env:NIFI_VERSION + '-bin.zip' ; \
    Write-Output $dloadurl ; \
    Write-Output $dloadfile ; \
    Invoke-WebRequest -Uri $dloadurl -Outfile $dloadfile 