repo="techpreacher"
if [ "$1" != "" ]; then
    repo="$1"
fi

tag="1.0"
if [ "$2" != "" ]; then
    tag="$2"
fi

docker build -f src/IotTelemetrySimulator/Dockerfile -t techpreacher/azureiot-telemetrysimulator:latest .
docker tag techpreacher/azureiot-telemetrysimulator:latest techpreacher/azureiot-telemetrysimulator:$tag
docker push techpreacher/azureiot-telemetrysimulator:latest && docker push techpreacher/azureiot-telemetrysimulator:$tag

docker build -f src/IotSimulatorDeviceProvisioning/Dockerfile -t techpreacher/azureiot-simulatordeviceprovisioning:latest .
docker tag techpreacher/azureiot-simulatordeviceprovisioning:latest techpreacher/azureiot-simulatordeviceprovisioning:$tag
docker push techpreacher/azureiot-simulatordeviceprovisioning:latest && docker push techpreacher/azureiot-simulatordeviceprovisioning:$tag
