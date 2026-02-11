import 'package:flutter/material.dart';

class MedicalDashboard extends StatelessWidget {
  const MedicalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFF0D1117);
    const surfaceColor = Color(0xFF161B22);

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Medical History",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            _buildSectionContainer(
              surfaceColor,
              icon: Icons.medication_outlined,
              title: "Current Medications",
              child: Column(
                children: [
                  _buildMedicationTile(
                    "Lisinopril",
                    "10mg • 30 days",
                    "2024-11-20",
                  ),
                  const SizedBox(height: 10),
                  _buildMedicationTile(
                    "Atorvastatin",
                    "20mg • 30 days",
                    "2024-11-20",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildSectionContainer(
              surfaceColor,
              icon: Icons.error_outline,
              iconColor: Colors.orange,
              title: "Recent Alerts",
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Critical BP Reading",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Blood pressure reached 165/95 mmHg",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Today at 14:30",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContainer(
    Color color, {
    required IconData icon,
    Color iconColor = Colors.blue,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildMedicationTile(String name, String dose, String date) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF21262D).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                dose,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
