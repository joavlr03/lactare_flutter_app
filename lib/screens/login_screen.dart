import 'package:flutter/material.dart';
import 'package:lactare_flutter_app/data/mock_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final donor = MockData.currentDonor;

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem-vinda! 👋',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF0F172A)),
              ),
              const SizedBox(height: 8),
              Text(
                'Cadastro rápido em menos de 2 minutos para começar a doar.',
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: TextEditingController(text: donor.name),
                decoration: const InputDecoration(labelText: 'Nome Completo', prefixIcon: Icon(Icons.person_outline)),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: donor.email),
                decoration: const InputDecoration(labelText: 'E-mail', prefixIcon: Icon(Icons.mail_outline)),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: donor.phone),
                decoration: const InputDecoration(labelText: 'WhatsApp', prefixIcon: Icon(Icons.phone_outlined)),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF3B6B),
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: const Color(0xFFFF3B6B).withOpacity(0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text('Criar Conta / Entrar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: const Icon(Icons.chat_bubble_outline, color: Color(0xFF16A34A)),
                  label: const Text('Continuar via WhatsApp', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.w600)),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}