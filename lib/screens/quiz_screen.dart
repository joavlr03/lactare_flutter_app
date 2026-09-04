import 'package:flutter/material.dart';
import 'package:lactare_flutter_app/data/mock_data.dart';
import 'package:lactare_flutter_app/widgets/widget_app.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  final Map<int, bool> _answers = {};

  void _answerQuestion(bool value) {
    setState(() {
      _answers[_currentIndex] = value;
      if (_currentIndex < MockData.eligibilityQuiz.length - 1) {
        _currentIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    bool eligible = _answers.values.every((answer) => answer == true);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: eligible ? const Color(0xFFDCFCE7) : const Color(0xFFFEF3C7),
                child: Icon(
                  eligible ? Icons.check_circle_rounded : Icons.warning_amber_rounded,
                  size: 40,
                  color: eligible ? const Color(0xFF16A34A) : const Color(0xFFD97706),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                eligible ? 'Apta para Doar!' : 'Análise Especializada',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 12),
              Text(
                eligible
                    ? 'Você atende aos pré-requisitos! Agora é só agendar a data conveniente para a coleta domiciliar.'
                    : 'Para sua segurança, precisamos de uma conversa rápida com nossa enfermeira antes do agendamento.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: eligible ? const Color(0xFFFF3B6B) : const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, eligible ? '/scheduling' : '/support');
                  },
                  child: Text(eligible ? 'Agendar Coleta' : 'Falar com Especialista', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = MockData.eligibilityQuiz[_currentIndex];
    final progress = (_currentIndex + 1) / MockData.eligibilityQuiz.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz de Elegibilidade')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF3B6B)),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Pergunta ${_currentIndex + 1} de ${MockData.eligibilityQuiz.length}',
                style: const TextStyle(color: Color(0xFFFF3B6B), fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const SizedBox(height: 12),
              ModernCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.question,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF0F172A), height: 1.3),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.info_outline, size: 18, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            question.hint,
                            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: () => _answerQuestion(false),
                        child: const Text('NÃO', style: TextStyle(color: Color(0xFFEF4444), fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF16A34A),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: () => _answerQuestion(true),
                        child: const Text('SIM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}