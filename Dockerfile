# escape=`
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019
COPY ./WebApplication1/. ./WebApplication1/
RUN msbuild  C:\WebApplication1\WebApplication1.sln /p:DeployOnBuild=true  

RUN msbuild  C:\WebApplication1\WebApplication1.sln /p:DeployOnBuild=true  

