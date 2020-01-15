@echo off

if "%~1"=="" (
    set repo="techpreacher"
) else (
    set repo=%1
)

if "%~2"=="" (
    set tag="1.0"
) else (
    set tag=%2
)

docker build -f src\IotTelemetrySimulator\Dockerfile -t techpreacher/azureiot-telemetrysimulator:latest  .
docker tag techpreacher/azureiot-telemetrysimulator:latest techpreacher/azureiot-telemetrysimulator:%tag%
docker push techpreacher/azureiot-telemetrysimulator:latest && docker push techpreacher/azureiot-telemetrysimulator:%tag%

docker build -f src\IotSimulatorDeviceProvisioning\Dockerfile -t techpreacher/azureiot-simulatordeviceprovisioning:latest  .
docker tag techpreacher/azureiot-simulatordeviceprovisioning:latest techpreacher/azureiot-simulatordeviceprovisioning:%tag%
docker push techpreacher/azureiot-simulatordeviceprovisioning:latest && docker push techpreacher/azureiot-simulatordeviceprovisioning:%tag%