FROM rivaaj/winjavabase
MAINTAINER Rivaaj Jumna

SHELL ["powershell", "-command"]

ARG NIFI_VERSION=1.1.1
ARG NIFI_URL=http://archive.apache.org/dist/nifi/

WORKDIR c:/

# http://archive.apache.org/dist/nifi/1.1.1/nifi-1.1.1-bin.zip

RUN $dloadurl = $env:NIFI_URL + $env:NIFI_VERSION + '/nifi-' + $env:NIFI_VERSION + '-bin.zip' ; \
    $dloadfile = 'nifi-' + $env:NIFI_VERSION + '-bin.zip' ; \
    Write-Output $dloadurl ; \
    Write-Output $dloadfile ; \
    Invoke-WebRequest -Uri $dloadurl -Outfile $dloadfile ; \
    $nifizip = 'nifi-' +  $env:NIFI_VERSION + '-bin.zip' ; \
    $nifidir = 'c:/nifi-' + $env:NIFI_VERSION ; \
    [System.IO.Compression.ZipFile]::ExtractToDirectory($nifizip, 'c:\') ; \
    Rename-Item $nifidir 'nifi' ; \
    del $nifizip

WORKDIR c:/nifi/bin

ENTRYPOINT ["cmd /c", "c:/nifi/bin/run-nifi.bat"]