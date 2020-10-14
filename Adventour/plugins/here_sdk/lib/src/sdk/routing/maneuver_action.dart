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
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Maneuver action type.
enum ManeuverAction {
    /// Departure maneuver, such as "Start at".
    depart,
    /// Arrival maneuver, such as "Arrive at".
    arrive,
    /// Left-hand U-turn maneuver, such as "Make a U-turn at".
    leftUTurn,
    /// Sharp left turn maneuver, such as "Make a hard left turn onto".
    sharpLeftTurn,
    /// Left turn maneuver, such as "Turn left on".
    leftTurn,
    /// Slight left turn maneuver, such as "Bear left onto".
    slightLeftTurn,
    /// Continue maneuver, such as "Continue on".
    continueOn,
    /// Slight right turn maneuver, such as "Bear right onto".
    slightRightTurn,
    /// Right turn maneuver, such as "Turn right on".
    rightTurn,
    /// Sharp right turn maneuver, such as "Make a hard right turn onto".
    sharpRightTurn,
    /// Right u-turn maneuver, such as "Make a right U-turn at".
    rightUTurn,
    /// Left exit maneuver, such as "Take the left exit to".
    leftExit,
    /// Right exit maneuver, such as "Take the right exit to".
    rightExit,
    /// Left ramp maneuver, such as "Take the left ramp onto".
    leftRamp,
    /// Right ramp maneuver, such as "Take the right ramp onto".
    rightRamp,
    /// Left fork maneuver, such as "Take the left fork onto".
    leftFork,
    /// Middle fork maneuver, such as "Take the middle fork onto".
    middleFork,
    /// Right fork maneuver, such as "Take the right fork onto".
    rightFork,
    /// Ferry maneuver, such as "Take the ferry to".
    ferry,
    /// Roundabout maneuver (left-hand traffic), such as "Enter the roundabout".
    leftRoundaboutEnter,
    /// Roundabout maneuver, such as "Enter the roundabout".
    rightRoundaboutEnter,
    /// Roundabout maneuver (left-hand traffic), such as "Pass the roundabout".
    leftRoundaboutPass,
    /// Roundabout maneuver, such as "Pass the roundabout".
    rightRoundaboutPass,
    /// Roundabout maneuver (left-hand traffic), such as  "Take the first exit of the roundabout onto".
    leftRoundaboutExit1,
    /// Roundabout maneuver (left-hand traffic), such as "Take the second exit of the roundabout onto".
    leftRoundaboutExit2,
    /// Roundabout maneuver (left-hand traffic), such as "Take the third exit of the roundabout onto".
    leftRoundaboutExit3,
    /// Roundabout maneuver (left-hand traffic), such as "Take the fourth exit of the roundabout onto".
    leftRoundaboutExit4,
    /// Roundabout maneuver (left-hand traffic), such as "Take the fifth exit of the roundabout onto".
    leftRoundaboutExit5,
    /// Roundabout maneuver (left-hand traffic), such as "Take the sixth exit of the roundabout onto".
    leftRoundaboutExit6,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 7th exit of the roundabout onto".
    leftRoundaboutExit7,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 8th exit of the roundabout onto".
    leftRoundaboutExit8,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 9th exit of the roundabout onto".
    leftRoundaboutExit9,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 10th exit of the roundabout onto".
    leftRoundaboutExit10,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 11th exit of the roundabout onto".
    leftRoundaboutExit11,
    /// Roundabout maneuver (left-hand traffic), such as "Take the 12th exit of the roundabout onto".
    leftRoundaboutExit12,
    /// Roundabout maneuver (right-hand traffic), such as "Take the first exit of the roundabout onto".
    rightRoundaboutExit1,
    /// Roundabout maneuver (right-hand traffic), such as "Take the second exit of the roundabout onto".
    rightRoundaboutExit2,
    /// Roundabout maneuver (right-hand traffic), such as "Take the third exit of the roundabout onto".
    rightRoundaboutExit3,
    /// Roundabout maneuver (right-hand traffic), such as "Take the fourth exit of the roundabout onto".
    rightRoundaboutExit4,
    /// Roundabout maneuver (right-hand traffic), such as "Take the fifth exit of the roundabout onto".
    rightRoundaboutExit5,
    /// Roundabout maneuver (right-hand traffic), such as "Take the sixth exit of the roundabout onto".
    rightRoundaboutExit6,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 7th exit of the roundabout onto".
    rightRoundaboutExit7,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 8th exit of the roundabout onto".
    rightRoundaboutExit8,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 9th exit of the roundabout onto".
    rightRoundaboutExit9,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 10th exit of the roundabout onto".
    rightRoundaboutExit10,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 11th exit of the roundabout onto".
    rightRoundaboutExit11,
    /// Roundabout maneuver (right-hand traffic), such as "Take the 12th exit of the roundabout onto".
    rightRoundaboutExit12
}

// ManeuverAction "private" section, not exported.

int sdk_routing_ManeuverAction_toFfi(ManeuverAction value) {
  switch (value) {
  case ManeuverAction.depart:
    return 0;
  break;
  case ManeuverAction.arrive:
    return 1;
  break;
  case ManeuverAction.leftUTurn:
    return 2;
  break;
  case ManeuverAction.sharpLeftTurn:
    return 3;
  break;
  case ManeuverAction.leftTurn:
    return 4;
  break;
  case ManeuverAction.slightLeftTurn:
    return 5;
  break;
  case ManeuverAction.continueOn:
    return 6;
  break;
  case ManeuverAction.slightRightTurn:
    return 7;
  break;
  case ManeuverAction.rightTurn:
    return 8;
  break;
  case ManeuverAction.sharpRightTurn:
    return 9;
  break;
  case ManeuverAction.rightUTurn:
    return 10;
  break;
  case ManeuverAction.leftExit:
    return 11;
  break;
  case ManeuverAction.rightExit:
    return 12;
  break;
  case ManeuverAction.leftRamp:
    return 13;
  break;
  case ManeuverAction.rightRamp:
    return 14;
  break;
  case ManeuverAction.leftFork:
    return 15;
  break;
  case ManeuverAction.middleFork:
    return 16;
  break;
  case ManeuverAction.rightFork:
    return 17;
  break;
  case ManeuverAction.ferry:
    return 18;
  break;
  case ManeuverAction.leftRoundaboutEnter:
    return 19;
  break;
  case ManeuverAction.rightRoundaboutEnter:
    return 20;
  break;
  case ManeuverAction.leftRoundaboutPass:
    return 21;
  break;
  case ManeuverAction.rightRoundaboutPass:
    return 22;
  break;
  case ManeuverAction.leftRoundaboutExit1:
    return 23;
  break;
  case ManeuverAction.leftRoundaboutExit2:
    return 24;
  break;
  case ManeuverAction.leftRoundaboutExit3:
    return 25;
  break;
  case ManeuverAction.leftRoundaboutExit4:
    return 26;
  break;
  case ManeuverAction.leftRoundaboutExit5:
    return 27;
  break;
  case ManeuverAction.leftRoundaboutExit6:
    return 28;
  break;
  case ManeuverAction.leftRoundaboutExit7:
    return 29;
  break;
  case ManeuverAction.leftRoundaboutExit8:
    return 30;
  break;
  case ManeuverAction.leftRoundaboutExit9:
    return 31;
  break;
  case ManeuverAction.leftRoundaboutExit10:
    return 32;
  break;
  case ManeuverAction.leftRoundaboutExit11:
    return 33;
  break;
  case ManeuverAction.leftRoundaboutExit12:
    return 34;
  break;
  case ManeuverAction.rightRoundaboutExit1:
    return 35;
  break;
  case ManeuverAction.rightRoundaboutExit2:
    return 36;
  break;
  case ManeuverAction.rightRoundaboutExit3:
    return 37;
  break;
  case ManeuverAction.rightRoundaboutExit4:
    return 38;
  break;
  case ManeuverAction.rightRoundaboutExit5:
    return 39;
  break;
  case ManeuverAction.rightRoundaboutExit6:
    return 40;
  break;
  case ManeuverAction.rightRoundaboutExit7:
    return 41;
  break;
  case ManeuverAction.rightRoundaboutExit8:
    return 42;
  break;
  case ManeuverAction.rightRoundaboutExit9:
    return 43;
  break;
  case ManeuverAction.rightRoundaboutExit10:
    return 44;
  break;
  case ManeuverAction.rightRoundaboutExit11:
    return 45;
  break;
  case ManeuverAction.rightRoundaboutExit12:
    return 46;
  break;
  default:
    throw StateError("Invalid enum value $value for ManeuverAction enum.");
  }
}

ManeuverAction sdk_routing_ManeuverAction_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ManeuverAction.depart;
  break;
  case 1:
    return ManeuverAction.arrive;
  break;
  case 2:
    return ManeuverAction.leftUTurn;
  break;
  case 3:
    return ManeuverAction.sharpLeftTurn;
  break;
  case 4:
    return ManeuverAction.leftTurn;
  break;
  case 5:
    return ManeuverAction.slightLeftTurn;
  break;
  case 6:
    return ManeuverAction.continueOn;
  break;
  case 7:
    return ManeuverAction.slightRightTurn;
  break;
  case 8:
    return ManeuverAction.rightTurn;
  break;
  case 9:
    return ManeuverAction.sharpRightTurn;
  break;
  case 10:
    return ManeuverAction.rightUTurn;
  break;
  case 11:
    return ManeuverAction.leftExit;
  break;
  case 12:
    return ManeuverAction.rightExit;
  break;
  case 13:
    return ManeuverAction.leftRamp;
  break;
  case 14:
    return ManeuverAction.rightRamp;
  break;
  case 15:
    return ManeuverAction.leftFork;
  break;
  case 16:
    return ManeuverAction.middleFork;
  break;
  case 17:
    return ManeuverAction.rightFork;
  break;
  case 18:
    return ManeuverAction.ferry;
  break;
  case 19:
    return ManeuverAction.leftRoundaboutEnter;
  break;
  case 20:
    return ManeuverAction.rightRoundaboutEnter;
  break;
  case 21:
    return ManeuverAction.leftRoundaboutPass;
  break;
  case 22:
    return ManeuverAction.rightRoundaboutPass;
  break;
  case 23:
    return ManeuverAction.leftRoundaboutExit1;
  break;
  case 24:
    return ManeuverAction.leftRoundaboutExit2;
  break;
  case 25:
    return ManeuverAction.leftRoundaboutExit3;
  break;
  case 26:
    return ManeuverAction.leftRoundaboutExit4;
  break;
  case 27:
    return ManeuverAction.leftRoundaboutExit5;
  break;
  case 28:
    return ManeuverAction.leftRoundaboutExit6;
  break;
  case 29:
    return ManeuverAction.leftRoundaboutExit7;
  break;
  case 30:
    return ManeuverAction.leftRoundaboutExit8;
  break;
  case 31:
    return ManeuverAction.leftRoundaboutExit9;
  break;
  case 32:
    return ManeuverAction.leftRoundaboutExit10;
  break;
  case 33:
    return ManeuverAction.leftRoundaboutExit11;
  break;
  case 34:
    return ManeuverAction.leftRoundaboutExit12;
  break;
  case 35:
    return ManeuverAction.rightRoundaboutExit1;
  break;
  case 36:
    return ManeuverAction.rightRoundaboutExit2;
  break;
  case 37:
    return ManeuverAction.rightRoundaboutExit3;
  break;
  case 38:
    return ManeuverAction.rightRoundaboutExit4;
  break;
  case 39:
    return ManeuverAction.rightRoundaboutExit5;
  break;
  case 40:
    return ManeuverAction.rightRoundaboutExit6;
  break;
  case 41:
    return ManeuverAction.rightRoundaboutExit7;
  break;
  case 42:
    return ManeuverAction.rightRoundaboutExit8;
  break;
  case 43:
    return ManeuverAction.rightRoundaboutExit9;
  break;
  case 44:
    return ManeuverAction.rightRoundaboutExit10;
  break;
  case 45:
    return ManeuverAction.rightRoundaboutExit11;
  break;
  case 46:
    return ManeuverAction.rightRoundaboutExit12;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ManeuverAction enum.");
  }
}

void sdk_routing_ManeuverAction_releaseFfiHandle(int handle) {}

final _sdk_routing_ManeuverAction_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_ManeuverAction_create_handle_nullable'));
final _sdk_routing_ManeuverAction_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ManeuverAction_release_handle_nullable'));
final _sdk_routing_ManeuverAction_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ManeuverAction_get_value_nullable'));

Pointer<Void> sdk_routing_ManeuverAction_toFfi_nullable(ManeuverAction value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_ManeuverAction_toFfi(value);
  final result = _sdk_routing_ManeuverAction_create_handle_nullable(_handle);
  sdk_routing_ManeuverAction_releaseFfiHandle(_handle);
  return result;
}

ManeuverAction sdk_routing_ManeuverAction_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_ManeuverAction_get_value_nullable(handle);
  final result = sdk_routing_ManeuverAction_fromFfi(_handle);
  sdk_routing_ManeuverAction_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_ManeuverAction_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_ManeuverAction_release_handle_nullable(handle);

// End of ManeuverAction "private" section.

