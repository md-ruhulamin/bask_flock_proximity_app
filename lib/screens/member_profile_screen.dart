import 'package:bask_flock_proximity_app/screens/widget/medical_history.dart';
import 'package:bask_flock_proximity_app/screens/widget/prescribe.dart';
import 'package:bask_flock_proximity_app/theme/medical_theme.dart';
import 'package:flutter/material.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0F1A),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.blueAccent),
          title: const Text("Back", style: TextStyle(color: Colors.blueAccent)),
        ),
        body: Column(
          children: [
            _profileCard(),
            const SizedBox(height: 16),
            Divider(color: Colors.grey.withOpacity(0.2)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PatientActionTabs(controller: _tabController),
            ),
      
            const SizedBox(height: 16),
            Divider(color: Colors.grey.withOpacity(0.2)),
      
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  VitalsTab(),
                  MedicalDashboard(),
                  MedicalDetailsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2233), Color(0xFF0F1724)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Expanded(
                child: Text(
                  "Mohammed Chowdhury",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headlineMedium?.color ?? Colors.white  ,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _criticalTag(),
            ],
          ),
          const SizedBox(height: 8),
          const Text("P001 • 45Y • Male", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Blood Group: A+", style: TextStyle(color:  Theme.of(context).textTheme.headlineMedium?.color ?? Colors.white  )),
              Text(
                "Condition: Hypertension",
                style: TextStyle(color: Theme.of(context).textTheme.headlineMedium?.color ?? Colors.white  ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _criticalTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color:MedicalTheme.accentRed.withOpacity(0.1) ,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text("CRITICAL", style: TextStyle(color: Colors.red)),
    );
  }
}

class PatientActionTabs extends StatelessWidget {
  final TabController controller;

  const PatientActionTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTab(0, Icons.plus_one, "Vitals"),
        const SizedBox(width: 12),
        _buildTab(1, Icons.description_outlined, "History"),
        const SizedBox(width: 12),
        _buildTab(2, Icons.medication_outlined, "Prescribe"),
      ],
    );
  }

  Widget _buildTab(int index, IconData icon, String label) {
    final bool isActive = controller.index == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.animateTo(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF1A6DFF) : const Color(0xFF2A3442),

            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive ? Colors.white : Colors.grey,
                size: 20,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VitalsTab extends StatelessWidget {
  const VitalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Vital Signs History",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.history, color: Colors.grey.withOpacity(0.5)),
          ],
        ),

        const SizedBox(height: 16),

        HealthDashboard(),
        const SizedBox(height: 16),

        HealthDashboard(),
        const SizedBox(height: 16),

        HealthDashboard(),
      ],
    );
  }
}

class VitalItem extends StatelessWidget {
  final String label;
  final String value;

  const VitalItem(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF111827),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthDashboard extends StatelessWidget {
  const HealthDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22), // Card background
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "2024-12-12 16:30",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "WARNING",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    "Blood\nPressure",
                    "152/88",
                    "",
                    isFilled: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard(
                    "Heart\nRate",
                    "70 \nbpm",
                    "",
                    isFilled: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard(
                    "Temperature",
                    "98.5°F",
                    "",
                    isFilled: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard("O2 Sat", "98%", "", isFilled: true),
                ),
              ],
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard("SpO2", "90%", "", isFilled: false),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard("Pulse", "88", "bpm", isFilled: false),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard("SBP", "130", "mmHg", isFilled: false),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatCard("DBP", "80", "mmHg", isFilled: false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String unit, {
    required bool isFilled,
  }) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isFilled
            ? const Color(0xFF21262D)
            : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: isFilled
            ? null
            : Border.all(color: Colors.blue.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (unit.isNotEmpty)
            Text(
              unit,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 14),
            ),
        ],
      ),
    );
  }
}
