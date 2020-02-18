# escape=`
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019 as sdk
COPY ./WebApplication1/. ./WebApplication1/
RUN msbuild  C:\WebApplication1\WebApplication1.sln /p:DeployOnBuild=true  /p:PublishProfile=FolderProfile.pubxml

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019 as runtime
WORKDIR /inetpub/wwwroot
COPY --from=sdk C:\WebApplication1\WebApplication1\bin\Release\Publish\. .
EXPOSE 80