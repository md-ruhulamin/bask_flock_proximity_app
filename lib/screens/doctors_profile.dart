import 'package:bask_flock_proximity_app/theme/medical_theme.dart';
import 'package:flutter/material.dart';

class ProviderNoteScreen extends StatelessWidget {
  const ProviderNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(color: Colors.blueAccent),
          title: const Text("Back", style: TextStyle(color: Colors.blueAccent)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // John Doe Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1A2233), Color(0xFF0F1724)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),SizedBox(width: 10,),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                 color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow('Email:', 'john.doe@email.com'),
                        _buildInfoRow('Age:', '45'),
                        _buildInfoRow('Address:', 'ctg'),
                        _buildInfoRow('Blood:', 'A-'),
                        _buildInfoRow('DOB:', '1995-11-'),
                        _buildInfoRow('Gender:', 'Male'),
                        _buildInfoRow('Phone:', '01444444'),
                        _buildInfoRow('Marital Status:', 'Single'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

               
                Row(
                  spacing: 10,
                  children: [
                    _buildTab('CC', isSelected: true),
                    _buildTab('HPI'),
                    _buildTab('ROS'),
                    _buildTab('Social'),
                    _buildTab('Family'),
                  ],
                ),

                const SizedBox(height: 20),
                Divider(
                  color: const Color(0xFF334155),
                  thickness: 1,
                ),
                SizedBox(height: 20),

                Text(
                  'Chief Complaint (CC)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Duration',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF334155),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color:   MedicalTheme.surface,   
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'e.g., 3 days, 2 weeks',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: TextStyle(fontSize: 15, color: Color(0xFF0F172A)),
                  ),
                ),

                const SizedBox(height: 20),

           
                const Text(
                  'Severity',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF334155),
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    _buildTab('Mild'),
                    const SizedBox(width: 24),
                    _buildTab('Moderate',isSelected: true),
                    const SizedBox(width: 24),
                    _buildTab('Severe'),
                  ],
                ),

                const SizedBox(height: 24),

                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF334155),
                  ),
                ),
                const SizedBox(height: 8),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 34, 36, 39),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter chief complaint details...',
                      hintStyle: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    style: TextStyle(fontSize: 15, color: Color(0xFF0F172A)),
                  ),
                ),

                const SizedBox(height: 32),

              
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.blueAccent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text('Save Provider Note'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: 
              BorderRadius.circular(16),
          color: isSelected?  Colors.blue: const Color.fromARGB(255, 34, 36, 39),
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF0F172A) : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected
                ?  Colors.white
                : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }

}
