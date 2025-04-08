class Consultation {
  final String id;
  final String date;
  final String time;
  final String description;
  final String topic;

  Consultation({
    required this.id,
    required this.date,
    required this.time,
    required this.description,
    required this.topic,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'description': description,
      'topic': topic,
    };
  }

  factory Consultation.fromMap(Map<String, dynamic> map) {
    return Consultation(
      id: map['id'],
      date: map['date'],
      time: map['time'],
      description: map['description'],
      topic: map['topic'],
    );
  }
}

