# escape=`
# 下載跑MSBuild工作的Image
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019 as sdk
# 複製要發行的MVC專案
COPY ./WebApplication1/. ./WebApplication1/
# 使用MSBuild建置和發行MVC專案
RUN msbuild  C:\WebApplication1\WebApplication1.sln /p:DeployOnBuild=true  /p:PublishProfile=FolderProfile.pubxml

# 下載dotnet framework 4.8 runtime Image
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019 as runtime
# 設定iis工作目錄
WORKDIR /inetpub/wwwroot
# 複製發行用的MVC專案的所有檔案
COPY --from=sdk C:\WebApplication1\WebApplication1\bin\Release\Publish\. .
# 開放容器對片的80 port
EXPOSE 80