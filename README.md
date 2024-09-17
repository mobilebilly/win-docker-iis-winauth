# win-docker-iis-winauth
This project provides a sample Docker setup for a Windows-based container running IIS with Windows Authentication enabled. It demonstrates how to configure and manage IIS in a containerized environment using Docker on Windows, serving as a foundation for deploying web apps that require integrated Windows Authentication.

The command below is used to run a Windows Docker container with IIS and Windows Authentication. The --security-opt "credentialspec" option specifies the use of a Credential Specification (credentialspec) for the container to support Windows Authentication.

```
docker run --security-opt "credentialspec=file://domain_user.json" -p 80:80 -d mobilebilly/win-docker-iis-winauth:latest
```

## What is a credentialspec?

A credentialspec file defines the Windows identity under which the container will run. This allows the container to authenticate to a domain, typically using Group Managed Service Accounts (gMSA), which are special service accounts managed by Active Directory.

To create a credentialspec:

Create a gMSA in Active Directory: gMSA accounts are designed for secure domain authentication. For more details, see the [gMSA overview](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/group-managed-service-accounts/group-managed-service-accounts/group-managed-service-accounts-overview).

Generate the credentialspec file: Use PowerShell’s New-CredentialSpec cmdlet to generate the required JSON file. Follow the steps outlined in [Create gMSA for Windows containers](https://learn.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/manage-serviceaccounts).

Once generated, use the credentialspec in your Docker run command to link the container to the gMSA identity. For a full guide, check the [Microsoft docs on using gMSA with containers](https://learn.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/gmsa-run-container).
