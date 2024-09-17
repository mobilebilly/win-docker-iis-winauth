FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8.1

WORKDIR /inetpub/wwwroot

ADD index.aspx ./
ADD web.config ./

SHELL [ "powershell" ]

# Add Windows authentication
RUN Install-WindowsFeature Web-Windows-Auth;

# Enable Windows authentication
RUN Set-WebConfigurationProperty -Filter '/system.webServer/security/authentication/windowsAuthentication' -Location 'Default Web Site' -Name Enabled -Value True;