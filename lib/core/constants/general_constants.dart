enum ListSpacingValue {
  spacingV100(100),
  spacingV80(80),
  spacingV54(54),
  spacingV48(48),
  spacingV32(32),
  spacingV24(24),
  spacingV16(16),
  spacingV8(8);

  const ListSpacingValue(this.value);
  final double value;
}


enum RequestStatus { initial, loading, success, error }
