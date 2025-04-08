import 'package:flutter/material.dart';
import '../../models/consultation.dart';

// Consultation List Item Widget
class ConsultationListItem extends StatelessWidget {
  final Consultation consultation;
  final VoidCallback onTap;

  const ConsultationListItem({
    Key? key,
    required this.consultation,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          consultation.topic,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(consultation.date),
                const SizedBox(width: 12),
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(consultation.time),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              consultation.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

// Detail Card Widget
class DetailCard extends StatelessWidget {
  final String title;
  final List<DetailItem> details;

  const DetailCard({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ...details.map((detail) {
              if (detail.isMultiLine) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(detail.icon, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          '${detail.label}:',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: Text(detail.value),
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(detail.icon, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        '${detail.label}:',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Text(detail.value),
                    ],
                  ),
                );
              }
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class DetailItem {
  final IconData icon;
  final String label;
  final String value;
  final bool isMultiLine;

  DetailItem({
    required this.icon,
    required this.label,
    required this.value,
    this.isMultiLine = false,
  });
}

