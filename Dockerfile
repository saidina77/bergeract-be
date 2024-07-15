# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/dotnet/sdk:8.0 as build-env
WORKDIR /app
COPY *.csproj .
RUN dotnet clean
COPY . .
RUN dotnet publish -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 as runtime
WORKDIR /publish
COPY --from=build-env /publish .

# EXPOSE 8081

ENTRYPOINT ["dotnet", "bergeract-be.dll"]