import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

// FlutterSecureStorage는 로그인을 앱을 껐다 킬 때마다 해야하는 것을 방지하기 위해
// 토큰을 저장해둘 보안 스토리지 이다.
const storage = FlutterSecureStorage();

//local host
const emulatorIp = '10.0.2.2:3000';
const simulatorIp = '127.0.0.1:3000';

final ip = Platform.isIOS ? simulatorIp : emulatorIp;
