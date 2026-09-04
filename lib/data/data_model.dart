class Donation {
  final String id;
  final String date;
  final double volumeMl;
  final String status;

  Donation({
    required this.id,
    required this.date,
    required this.volumeMl,
    required this.status,
  });
}

class CollectionAppointment {
  final String id;
  final String date;
  final String timeWindow;
  final String address;
  final String status;
  final String collectorName;
  final String eta;

  CollectionAppointment({
    required this.id,
    required this.date,
    required this.timeWindow,
    required this.address,
    required this.status,
    required this.collectorName,
    required this.eta,
  });
}

class QuizQuestion {
  final int id;
  final String question;
  final String hint;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.hint,
  });
}

class Donor {
  final String name;
  final String email;
  final String phone;
  final int babiesImpacted;
  final double totalLiters;
  final int totalCollections;

  Donor({
    required this.name,
    required this.email,
    required this.phone,
    required this.babiesImpacted,
    required this.totalLiters,
    required this.totalCollections,
  });
}