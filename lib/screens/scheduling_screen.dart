import 'package:flutter/material.dart';
import 'package:lactare_flutter_app/data/mock_data.dart';
import 'package:lactare_flutter_app/widgets/widget_app.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({super.key});

  @override
  State<SchedulingScreen> createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  String selectedDate = '10/09/2026';
  String selectedTime = '14:00 - 16:00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agendar Coleta')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Data da Coleta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['10/09/2026', '12/09/2026', '15/09/2026'].map((date) {
                    final isSelected = selectedDate == date;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ChoiceChip(
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(date, style: TextStyle(color: isSelected ? Colors.white : const Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                        ),
                        selected: isSelected,
                        selectedColor: const Color(0xFFFF3B6B),
                        backgroundColor: Colors.white,
                        onSelected: (selected) => setState(() => selectedDate = date),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Horário Preferencial', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              Column(
                children: ['09:00 - 11:00', '14:00 - 16:00', '16:00 - 18:00'].map((time) {
                  final isSelected = selectedTime == time;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ModernCard(
                      padding: const EdgeInsets.all(16),
                      color: isSelected ? const Color(0xFFFFF1F2) : Colors.white,
                      onTap: () => setState(() => selectedTime = time),
                      child: Row(
                        children: [
                          Icon(Icons.access_time_rounded, color: isSelected ? const Color(0xFFFF3B6B) : Colors.grey),
                          const SizedBox(width: 12),
                          Text(time, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? const Color(0xFFFF3B6B) : const Color(0xFF0F172A))),
                          const Spacer(),
                          if (isSelected) const Icon(Icons.check_circle_rounded, color: Color(0xFFFF3B6B)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text('Endereço', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              ModernCard(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFFFEF2F2),
                      child: Icon(Icons.location_on, color: Color(0xFFFF3B6B)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(MockData.activeAppointment.address, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          const Text('Endereço principal cadastrado', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B6B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Coleta agendada para $selectedDate!')),
                    );
                    Navigator.pushReplacementNamed(context, '/tracking');
                  },
                  child: const Text('CONFIRMAR AGENDAMENTO', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
