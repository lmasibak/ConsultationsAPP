import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/consultation.dart';

class ConsultationProvider extends ChangeNotifier {
  final List<Consultation> _consultations = [];
  final _uuid = const Uuid();

  List<Consultation> get consultations => [..._consultations];

  void addConsultation({
    required String date,
    required String time,
    required String description,
    required String topic,
  }) {
    final newConsultation = Consultation(
      id: _uuid.v4(),
      date: date,
      time: time,
      description: description,
      topic: topic,
    );

    _consultations.add(newConsultation);
    notifyListeners();
  }

  void deleteConsultation(String id) {
    _consultations.removeWhere((consultation) => consultation.id == id);
    notifyListeners();
  }

  Consultation getConsultationById(String id) {
    return _consultations.firstWhere((consultation) => consultation.id == id);
  }
}

