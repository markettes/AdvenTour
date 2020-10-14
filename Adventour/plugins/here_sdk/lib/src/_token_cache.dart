// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:ffi/ffi.dart';

const unknownError = -1;

int _instanceCounter = 1024;
final Map<int, Object> instanceCache = {};
final Map<Object, int> tokenCache = {};
final Map<Pointer<Void>, Object> reverseCache = {};

int cacheObject(Object obj) {
  int token = tokenCache[obj];
  if (token == null) {
    token = _instanceCounter++;
    instanceCache[token] = obj;
    tokenCache[obj] = token;
  }
  return token;
}

void uncacheObject(int token, Pointer<Void> rawPointer) {
  tokenCache.remove(instanceCache[token]);
  instanceCache.remove(token);
  reverseCache.remove(rawPointer);
}

final uncacheObjectFfi = Pointer.fromFunction<Void Function(Uint64, Pointer<Void>)>(uncacheObject);
