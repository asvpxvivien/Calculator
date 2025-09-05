import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryEntry {
  final String expression;
  final String result;
  final DateTime timestamp;

  HistoryEntry({
    required this.expression,
    required this.result,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() => {
    'expression': expression,
    'result': result,
    'timestamp': timestamp.toIso8601String(),
  };

  static HistoryEntry fromMap(Map<String, dynamic> map) => HistoryEntry(
    expression: map['expression'] as String,
    result: map['result'] as String,
    timestamp: DateTime.parse(map['timestamp'] as String),
  );
}

class HistoryProvider extends ChangeNotifier {
  static const String _storageKey = 'calc_history_v1';
  final List<HistoryEntry> _entries = <HistoryEntry>[];

  List<HistoryEntry> get entries => List.unmodifiable(_entries.reversed);

  HistoryProvider() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null) return;
    try {
      final List<dynamic> list = jsonDecode(raw) as List<dynamic>;
      _entries
        ..clear()
        ..addAll(
          list.map(
            (e) => HistoryEntry.fromMap(Map<String, dynamic>.from(e as Map)),
          ),
        );
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final String raw = jsonEncode(_entries.map((e) => e.toMap()).toList());
    await prefs.setString(_storageKey, raw);
  }

  Future<void> add(String expression, String result) async {
    _entries.add(
      HistoryEntry(
        expression: expression,
        result: result,
        timestamp: DateTime.now(),
      ),
    );
    await _save();
    notifyListeners();
  }

  Future<void> clear() async {
    _entries.clear();
    await _save();
    notifyListeners();
  }
}
