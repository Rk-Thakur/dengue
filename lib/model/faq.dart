class Faq {
  late int faqId;
  late String question;
  late String answer;

  Faq({required this.faqId, required this.question, required this.answer});

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
        faqId: json['faqId'],
        question: json['question'],
        answer: json['answer']);
  }

  Map<String, dynamic> toJson() {
    return {
      'faqId': faqId,
      'question': question,
      'answer': answer,
    };
  }
}
