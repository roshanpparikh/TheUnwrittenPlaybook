class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

final List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: 'What is the "invisible resume"?',
    options: [
      'Your official resume document',
      'Social and cultural fluency—ease with wine, comfort at clubs, familiarity with elevated conversation',
      'A secret professional network',
      'Your digital footprint online',
    ],
    correctIndex: 1,
    explanation: 'The invisible resume is everything beyond professional credentials—social ease and cultural knowledge that determines whether people want to keep working with you.',
  ),
  QuizQuestion(
    question: 'According to the playbook, what is the most powerful phrase in affluent social settings?',
    options: [
      '"You don\'t know what you\'re talking about"',
      '"Tell me more about that"',
      '"I\'m the expert here"',
      '"Let me tell you what I think"',
    ],
    correctIndex: 1,
    explanation: 'The five key phrases include "Tell me more about that"—the most powerful four words. It shows interest, flatters the speaker, and buys you time to learn.',
  ),
  QuizQuestion(
    question: 'What is the wealth tier for someone with \$3M in net assets?',
    options: [
      'Affluent',
      'High-Net-Worth (HNW)',
      'Very High-Net-Worth (VHNW)',
      'Ultra-High-Net-Worth (UHNW)',
    ],
    correctIndex: 1,
    explanation: 'HNW is typically \$1M-\$10M. VHNW is \$10M-\$30M. The broader tier where most professionals land, with access to private banking and wealth advisors.',
  ),
  QuizQuestion(
    question: 'What is the primary principle for cultural fluency?',
    options: [
      'Pretending to be an expert in everything',
      'Memorizing all the facts beforehand',
      'Genuine curiosity and asking great questions',
      'Avoiding topics you don\'t understand',
    ],
    correctIndex: 2,
    explanation: 'Genuine curiosity beats expertise every time. The wealthiest people are comfortable saying "I don\'t know" and asking intelligent questions to learn.',
  ),
  QuizQuestion(
    question: 'Which of these is one of the "Holy Trinity" watchmakers?',
    options: ['Rolex', 'Omega', 'Patek Philippe', 'TAG Heuer'],
    correctIndex: 2,
    explanation: 'The Holy Trinity of prestigious watchmakers are Patek Philippe, Audemars Piguet, and Vacheron Constantin—the most coveted and exclusive watch brands.',
  ),
  QuizQuestion(
    question: 'What does "terroir" mean in wine?',
    options: [
      'The age of the wine',
      'The price of the bottle',
      'Wine\'s character from place—soil, climate, altitude, exposure',
      'The name of the vineyard',
    ],
    correctIndex: 2,
    explanation: 'Terroir is a French concept describing how the geographic and environmental factors of a place influence and define a wine\'s unique character.',
  ),
  QuizQuestion(
    question: 'According to the playbook, cultural knowledge operates like what?',
    options: ['Interest rates', 'Financial capital—it compounds over time', 'Inflation', 'Currency exchange'],
    correctIndex: 1,
    explanation: 'Cultural capital compounds just like financial capital. Learning wine regions now means you\'ll navigate 80% of wine conversations for the rest of your career.',
  ),
  QuizQuestion(
    question: 'What is "omakase" at a high-end sushi restaurant?',
    options: [
      'A discount menu option',
      '"I\'ll leave it to you"—the chef selects each piece for you',
      'A type of fish',
      'A reservation system',
    ],
    correctIndex: 1,
    explanation: '"Omakase" means "I\'ll leave it to you." At high-end sushi, the chef selects each piece and you eat immediately—a mark of trust in the chef.',
  ),
  QuizQuestion(
    question: 'What is the biggest social mistake first-generation professionals make?',
    options: [
      'Acting too poor',
      'Trying to match the spending of someone three tiers above them',
      'Not dressing well',
      'Talking too much',
    ],
    correctIndex: 1,
    explanation: 'Trying to imitate someone three wealth tiers above you is obvious and losing. Better to be the curious person than the one pretending to match their wealth.',
  ),
  QuizQuestion(
    question: 'What is "bespoke" in tailoring?',
    options: [
      'A mass-produced garment',
      'A slightly adjusted standard garment',
      'Custom-made from scratch with pattern cut to your body',
      'A catalog item',
    ],
    correctIndex: 2,
    explanation: 'Bespoke is the highest tier of custom tailoring—your garment is pattern-cut to your body with multiple fittings, created entirely from scratch.',
  ),
];
