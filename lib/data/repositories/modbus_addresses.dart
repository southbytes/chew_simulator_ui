import 'dart:math';
import 'dart:typed_data';

/// Modbus holding register addresses for chewing simulator parameters.
class ModbusAddresses {
  // ==================== Read Registers (Input/Holding) ====================

  // Watchdog status (Boolean, occupying 1 register)
  static const int watchdogStatus = 16384; // 0x4000 (Decimal: 16384)

  // Chamber temperature registers (32-bit floats, occupying 2 registers each)
  static const int chamber1Temp = 16385; // 0x4001 (Decimal: 16385-16386)
  static const int chamber2Temp = 16387; // 0x4003 (Decimal: 16387-16388)
  static const int chamber3Temp = 16389; // 0x4005 (Decimal: 16389-16390)
  static const int chamber4Temp = 16391; // 0x4007 (Decimal: 16391-16392)

  // Level sensor (32-bit float, occupying 2 registers)
  static const int levelSensor = 16393; // 0x4009 (Decimal: 16393-16394)

  // Hit count (Unsigned 16-bit, occupying 1 register)
  static const int hitCount = 16395; // 0x400B (Decimal: 16395)

  // ==================== Write Registers (Holding) ====================

  // Pump pulse registers (Signed 16-bit, value range: 0-1000)
  static const int p1Pulse = 24576; // 0x6000 (Decimal: 24576)
  static const int p2Pulse = 24577; // 0x6001 (Decimal: 24577)

  // Valve control registers (Boolean)
  static const int hotFillValve  = 24578; // 0x6002 (Decimal: 24578)
  static const int hotDrainValve = 24579; // 0x6003 (Decimal: 24579)
  static const int coldFillValve = 24580; // 0x6004 (Decimal: 24580)
  static const int coldDrainValve = 24581; // 0x6005 (Decimal: 24581)

  // Reset hit count (Boolean)
  static const int resetCount = 24582; // 0x6006 (Decimal: 24582)
}

/// Helper service for reading parameter values from Modbus RTU or Mock sources.
class ModbusReader {
  final _random = Random();

  // ==================== Real Device Parsers ====================

  /// Parses a Boolean status from Modbus RTU response bytes (1 register, 2 bytes).
  /// 
  /// Returns true if the 16-bit register value is non-zero.
  bool readBooleanFromRealDevice(List<int> responseBytes) {
    if (responseBytes.length < 5) {
      throw ArgumentError('Invalid Modbus RTU response length. Expected at least 5 bytes for boolean.');
    }
    // High byte at index 3, low byte at index 4
    final value = (responseBytes[3] << 8) | responseBytes[4];
    return value != 0;
  }

  /// Parses a 32-bit float value from Modbus RTU response bytes (2 registers, 4 bytes).
  double readFloat32FromRealDevice(List<int> responseBytes) {
    if (responseBytes.length < 7) {
      throw ArgumentError('Invalid Modbus RTU response length. Expected at least 7 bytes for float32.');
    }
    
    final byteData = ByteData(4);
    byteData.setUint8(0, responseBytes[3]);
    byteData.setUint8(1, responseBytes[4]);
    byteData.setUint8(2, responseBytes[5]);
    byteData.setUint8(3, responseBytes[6]);
    
    return byteData.getFloat32(0, Endian.big);
  }

  /// Parses an unsigned 16-bit integer value from Modbus RTU response bytes (1 register, 2 bytes).
  int readUint16FromRealDevice(List<int> responseBytes) {
    if (responseBytes.length < 5) {
      throw ArgumentError('Invalid Modbus RTU response length. Expected at least 5 bytes for uint16.');
    }
    return (responseBytes[3] << 8) | responseBytes[4];
  }


  // ==================== Mock Device Generators ====================

  /// Generates a mock boolean value.
  bool readBooleanFromMockDevice(int address) {
    if (address == ModbusAddresses.watchdogStatus) {
      // Mock watchdog status (usually true/healthy, occasionally simulating glitch)
      return _random.nextDouble() > 0.01;
    }
    return false;
  }

  /// Generates simulated floats for chambers or level sensor.
  double readFloat32FromMockDevice(int address, {double baseValue = 37.0}) {
    final double offset;
    switch (address) {
      case ModbusAddresses.chamber1Temp:
        offset = 0.05;
        break;
      case ModbusAddresses.chamber2Temp:
        offset = -0.03;
        break;
      case ModbusAddresses.chamber3Temp:
        offset = 0.08;
        break;
      case ModbusAddresses.chamber4Temp:
        offset = -0.01;
        break;
      case ModbusAddresses.levelSensor:
        // Mock level sensor (e.g. water level percentage, centered around 85.0%)
        final noise = (_random.nextDouble() - 0.5) * 0.2;
        return (baseValue == 37.0 ? 85.0 : baseValue) + noise;
      default:
        offset = 0.0;
    }
    
    final noise = (_random.nextDouble() - 0.5) * 0.04;
    return baseValue + offset + noise;
  }

  /// Generates a mock 16-bit unsigned integer value.
  int readUint16FromMockDevice(int address, {int currentValue = 0}) {
    if (address == ModbusAddresses.hitCount) {
      // Increment hit count simulation
      return (currentValue + (_random.nextDouble() > 0.7 ? 1 : 0)) & 0xFFFF;
    }
    return currentValue;
  }
}

/// Helper service for writing parameter values to Modbus RTU registers.
class ModbusWriter {
  // ==================== Real Device Writers ====================

  /// Builds a Modbus RTU Write Single Register (Function Code 0x06) request frame.
  ///
  /// Format: [SlaveAddr] [0x06] [RegAddrHi] [RegAddrLo] [ValueHi] [ValueLo] [CRCLo] [CRCHi]
  /// Returns the raw request bytes (without CRC — caller should append CRC16).
  List<int> buildWriteSingleRegisterFrame(int slaveAddress, int registerAddress, int value) {
    return [
      slaveAddress & 0xFF,
      0x06, // Function Code: Write Single Register
      (registerAddress >> 8) & 0xFF,
      registerAddress & 0xFF,
      (value >> 8) & 0xFF,
      value & 0xFF,
    ];
  }

  /// Builds a write frame for a signed 16-bit pump pulse value.
  ///
  /// Clamps [pulseValue] to the valid range 0–1000.
  List<int> writePumpPulse(int slaveAddress, int registerAddress, int pulseValue) {
    final clamped = pulseValue.clamp(0, 1000);
    return buildWriteSingleRegisterFrame(slaveAddress, registerAddress, clamped);
  }

  /// Builds a write frame for a boolean valve/reset control.
  ///
  /// Writes 1 (0x0001) for true, 0 (0x0000) for false.
  List<int> writeBoolean(int slaveAddress, int registerAddress, bool value) {
    return buildWriteSingleRegisterFrame(slaveAddress, registerAddress, value ? 1 : 0);
  }
}
