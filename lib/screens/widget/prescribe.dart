import 'package:flutter/material.dart';


class MedicalDetailsPage extends StatelessWidget {
  const MedicalDetailsPage({super.key});

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
              "Prescribe Medication & Tests",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildGradientButton(),
            const SizedBox(height: 16),
            _buildMedicationCard(surfaceColor, "Previous Prescriptions", null),
          ],
        ),
      ),
    );
  }


  Widget _buildMedicationCard(Color bgColor, String title, IconData? icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.blueAccent, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildMedItem("Lisinopril", "10mg • 30 days", "2024-11-20"),
          const SizedBox(height: 12),
          _buildMedItem("Atorvastatin", "20mg • 30 days", "2024-11-20"),
        ],
      ),
    );
  }

  Widget _buildMedItem(String name, String details, String date) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2128),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(details, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          Text(date, style: const TextStyle(color: Color(0xFF484F58), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildAlertCard(Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.error_outline, color: Colors.orangeAccent, size: 20),
              SizedBox(width: 8),
              Text("Recent Alerts", style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2D1F21), // Dark red tint
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Critical BP Reading", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text("Blood pressure reached 165/95 mmHg", style: TextStyle(color: Colors.grey, fontSize: 14)),
                SizedBox(height: 8),
                Text("Today at 14:30", style: TextStyle(color: Color(0xFF484F58), fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGradientButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF9C27B0)], 
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: const Text(
          "+ New Prescription",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}