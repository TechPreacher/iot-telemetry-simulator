FROM mcr.microsoft.com/dotnet/core/runtime:3.0-buster-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["src/IotSimulatorDeviceProvisioning/IotSimulatorDeviceProvisioning.csproj", "src/IotSimulatorDeviceProvisioning/"]
RUN dotnet restore "src/IotSimulatorDeviceProvisioning/IotSimulatorDeviceProvisioning.csproj"
COPY . .
WORKDIR "/src/src/IotSimulatorDeviceProvisioning"
RUN dotnet build "IotSimulatorDeviceProvisioning.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "IotSimulatorDeviceProvisioning.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "IotSimulatorDeviceProvisioning.dll"]