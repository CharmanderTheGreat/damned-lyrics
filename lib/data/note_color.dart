import 'package:flutter/material.dart';

enum NoteColor {
  daily('daily', Color(0xFF3FB950)),
  event('event', Color(0xFFDB61A2)),
  trip('trip', Color(0xFF39C5CF)),
  work('work', Color(0xFFE3B341)),
  urgent('urgent', Color(0xFFF85149));

  const NoteColor(this.label, this.color);
  final String label;
  final Color color;
}