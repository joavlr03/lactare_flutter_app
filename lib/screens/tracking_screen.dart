import 'package:flutter/material.dart';
import 'package:lactare_flutter_app/data/mock_data.dart';
import 'package:lactare_flutter_app/widgets/widget_app.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appt = MockData.activeAppointment;

    return Scaffold(
      appBar: AppBar(title: const Text('Status da Coleta')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Highilght Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), shape: BoxShape.circle),
                      child: const Icon(Icons.local_shipping_rounded, color: Colors.white, size: 40),
                    ),
                    const SizedBox(height: 16),
                    Text(appt.status, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Text('Chegada estimada em ${appt.eta}', style: const TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Responsável pela Coleta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              ModernCard(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color(0xFFF1F5F9),
                      child: Icon(Icons.person, color: Color(0xFF0F172A)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(appt.collectorName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const Text('Agente Autorizado Lactare', style: TextStyle(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const CircleAvatar(backgroundColor: Color(0xFFDCFCE7), child: Icon(Icons.phone, color: Color(0xFF16A34A), size: 20)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ModernCard(
                child: Column(
                  children: [
                    _buildTrackingRow(Icons.calendar_today, 'Data & Janela', '${appt.date} (${appt.timeWindow})'),
                    const Divider(height: 24),
                    _buildTrackingRow(Icons.place_outlined, 'Local de Coleta', appt.address),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/support'),
                  icon: const Icon(Icons.help_outline),
                  label: const Text('Preciso de Ajuda com a Coleta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackingRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}