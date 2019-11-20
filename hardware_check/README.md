## 本領域の説明
* サーバのハードディスクの状態チェックを行うツールを管理する領域。

## 前提条件
* 本ツールは`ESXi`に対応している。
* 本ツールは`sshpass`コマンドを利用する。
	* チェック対象のサーバへssh接続できる必要がある

## ツール説明
* HardWareCheck.sh
	* ハードディスクの状態チェックを行うツール。
* esx_hostlist.txt
	* ハードディスクの状態をチェックしたいESXiサーバのホスト名を定義する。

## 通知結果サンプル

```
=====
xxx:HW_check_start
-----
HW status check
(vim.host.Summary) {
host = 'vim.HostSystem:ha-host', 
hardware = (vim.host.Summary.HardwareSummary) {
vendor = "Dell Inc.", 
model = "PowerEdge R410", 
uuid = "4c4c4544-004e-5610-804c-b7c04f534258", 
otherIdentifyingInfo = (vim.host.SystemIdentificationInfo) [
(vim.host.SystemIdentificationInfo) {
identifierValue = " unknown", 
identifierType = (vim.ElementDescription) {
label = "Asset Tag", 
summary = "Asset tag of the system", 
key = "AssetTag"
}
}, 
(vim.host.SystemIdentificationInfo) {
identifierValue = "Dell System", 
identifierType = (vim.ElementDescription) {
label = "OEM specific string", 
summary = "OEM specific string", 
key = "OemSpecificString"
}
}, 
(vim.host.SystemIdentificationInfo) {
identifierValue = "5[0000]", 
identifierType = (vim.ElementDescription) {
label = "OEM specific string", 
summary = "OEM specific string", 
key = "OemSpecificString"
}
}, 
(vim.host.SystemIdentificationInfo) {
identifierValue = "7NVLSBX", 
identifierType = (vim.ElementDescription) {
label = "Service tag", 
summary = "Service tag of the system", 
key = "ServiceTag"
}
}
], 
memorySize = 68705865728, 
cpuModel = "Intel(R) Xeon(R) CPU L5640 @ 2.27GHz", 
cpuMhz = 2260, 
numCpuPkgs = 2, 
numCpuCores = 12, 
numCpuThreads = 24, 
numNics = 2, 
numHBAs = 5
}, 
runtime = (vim.host.RuntimeInfo) {
connectionState = "connected", 
powerState = "poweredOn", 
standbyMode = <unset>, 
inMaintenanceMode = false, 
bootTime = "2015-10-22T09:45:20.719666Z", 
healthSystemRuntime = (vim.host.HealthStatusSystem.Runtime) {
systemHealthInfo = (vim.host.SystemHealthInfo) {
numericSensorInfo = (vim.host.NumericSensorInfo) [
(vim.host.NumericSensorInfo) {
name = "System Board 1 FAN MOD 4B RPM --- Normal", 
healthState = (vim.ElementDescription) {
label = "Green", 
summary = "Sensor is operating under normal conditions", 
key = "green"
}, 
currentReading = 480000, 
unitModifier = -2, 
baseUnits = "RPM", 
rateUnits = <unset>, 
sensorType = "fan"
}, 
(vim.host.NumericSensorInfo) {
name = "System Board 1 FAN MOD 4A RPM --- Normal", 
healthState = (vim.ElementDescription) {
label = "Green", 
summary = "Sensor is operating under normal conditions", 
key = "green"
}, 
currentReading = 672000, 
unitModifier = -2, 
baseUnits = "RPM", 
rateUnits = <unset>, 
sensorType = "fan"
}, 
(vim.host.NumericSensorInfo) {
name = "System Board 1 FAN MOD 3B RPM --- Normal", 
healthState = (vim.ElementDescription) {
label = "Green", 
summary = "Sensor is operating under normal conditions", 
key = "green"
}, 
currentReading = 432000, 
unitModifier = -2, 
baseUnits = "RPM", 
rateUnits = <unset>, 
sensorType = "fan"
}, 
(vim.host.NumericSensorInfo) {
name = "System Board 1 FAN MOD 3A RPM --- Normal", 
healthState = (vim.ElementDescription) {
label = "Green", 
summary = "Sensor is operating under normal conditions", 
key = "green"
}, 
currentReading = 612000, 
unitModifier = -2, 
baseUnits = "RPM", 
rateUnits = <unset>, 
sensorType = "fan"
}, 
(vim.host.NumericSensorInfo) {
name = "System Board 1 FAN MOD 2B RPM --- Normal", 
healthState = (vim.ElementDescription) {
label = "Green", 
summary = "Sensor is operating under normal conditions", 
key = "green"
}, 

※一部抜粋
```
