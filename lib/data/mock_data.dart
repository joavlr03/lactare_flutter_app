import 'package:lactare_flutter_app/data/data_model.dart';

class MockData {
  static final Donor currentDonor = Donor(
    name: 'Ana Paula',
    email: 'ana.paula@email.com',
    phone: '(11) 98765-4321',
    babiesImpacted: 12,
    totalLiters: 2.4,
    totalCollections: 3,
  );

  static final List<Donation> historyList = [
    Donation(id: 'DON-101', date: '10/09/2026', volumeMl: 500, status: 'Concluída'),
    Donation(id: 'DON-102', date: '24/09/2026', volumeMl: 400, status: 'Concluída'),
    Donation(id: 'DON-103', date: '08/10/2026', volumeMl: 600, status: 'Concluída'),
  ];

  static final CollectionAppointment activeAppointment = CollectionAppointment(
    id: 'COL-8821',
    date: '10/09/2026',
    timeWindow: '14:00 - 16:00',
    address: 'Rua Augusta, 1500 - Ap 42, São Paulo - SP',
    status: 'Coletor a caminho',
    collectorName: 'Carlos Eduardo',
    eta: '18 min',
  );

  static final List<QuizQuestion> eligibilityQuiz = [
    QuizQuestion(
      id: 1,
      question: 'Você possui leite excedente além das necessidades do seu bebê?',
      hint: 'A prioridade é sempre a amamentação do seu próprio filho.',
    ),
    QuizQuestion(
      id: 2,
      question: 'Está saudável e sem uso de medicamentos contraindicados?',
      hint: 'Alguns medicamentos passam para o leite e requerem pausa temporária.',
    ),
    QuizQuestion(
      id: 3,
      question: 'Possui exames pré-natais ou de sangue recentes atualizados?',
      hint: 'Validação de rotina exigida pelos bancos de leite parceiros.',
    ),
  ];
}