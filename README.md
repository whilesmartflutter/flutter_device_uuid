# Device Identifier

This Flutter library aims to simplify the process of obtaining a unique identifier for mobile devices. It specifically addresses the challenges associated with non-persistent UUIDs on both Android and iOS platforms.
## Usage

1. Import the package
```dart
import 'package:flutter_device_uuid/flutter_device_uuid.dart';
```

2. Call the method `uuid()` to get the device Id
```dart
String deviceId = await DeviceUuid.uuid();
```