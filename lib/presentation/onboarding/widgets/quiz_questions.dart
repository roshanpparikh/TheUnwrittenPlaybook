import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';

/// Single source of truth for all personalization quiz questions.
/// Used by both [PersonalizationQuiz] (onboarding) and [ProfileScreen] (edit).
const kQuizQuestions = [
  {
    'id': 'name',
    'type': 'text',
    'label': 'NAME',
    'question': 'First, what should we call you?',
    'subtitle': 'This journey is yours. Let\'s make it personal.',
    'placeholder': 'Your first name',
  },
  {
    'id': 'gender',
    'type': 'single',
    'label': 'IDENTITY',
    'question': 'How do you identify?',
    'subtitle': 'We\'ll tailor cultural nuances accordingly.',
    'options': [
      {'value': 'male', 'icon': '♂', 'label': 'Male'},
      {'value': 'female', 'icon': '♀', 'label': 'Female'},
      {'value': 'nonbinary', 'icon': '⬡', 'label': 'Non-binary'},
    ],
  },
  {
    'id': 'life_stage',
    'type': 'single',
    'label': 'CAREER STAGE',
    'question': 'Where are you in your journey?',
    'subtitle': 'Your life stage shapes which playbooks matter most.',
    'options': [
      {'value': 'new_grad', 'icon': '🎓', 'label': 'Early career'},
      {'value': 'rising', 'icon': '📈', 'label': 'Rising professional'},
      {'value': 'established', 'icon': '⚡', 'label': 'Established / Partner-track'},
      {'value': 'executive', 'icon': '🏛', 'label': 'Executive / C-suite'},
    ],
  },
  {
    'id': 'field',
    'type': 'single',
    'label': 'FIELD',
    'question': 'What\'s your professional world?',
    'subtitle': 'Each field has its own version of \'the room.\'',
    'options': [
      {'value': 'medicine', 'icon': '🩺', 'label': 'Medicine'},
      {'value': 'law', 'icon': '⚖️', 'label': 'Law'},
      {'value': 'finance', 'icon': '📊', 'label': 'Finance / Consulting'},
      {'value': 'tech', 'icon': '💻', 'label': 'Tech / Engineering'},
      {'value': 'other', 'icon': '✦', 'label': 'Other'},
    ],
  },
  {
    'id': 'confidence',
    'type': 'single',
    'label': 'CONFIDENCE',
    'question': 'Walking into an upscale dinner or private club — how do you feel?',
    'subtitle': 'Be honest. That\'s why you\'re here.',
    'options': [
      {'value': 'fish', 'icon': '🌊', 'label': 'Fish out of water'},
      {'value': 'some', 'icon': '🌤', 'label': 'Gaps in some areas'},
      {'value': 'mostly', 'icon': '☀️', 'label': 'Mostly confident'},
    ],
  },
  {
    'id': 'interests',
    'type': 'multi',
    'label': 'INTERESTS',
    'question': 'What worlds do you want to unlock?',
    'subtitle': 'Pick your top 3–5. We\'ll build your playbook around these.',
    'options': [
      {'value': 'wine', 'icon': '🍷', 'label': 'Wine & Spirits'},
      {'value': 'dining', 'icon': '🍽', 'label': 'Fine Dining'},
      {'value': 'fashion', 'icon': '👔', 'label': 'Fashion'},
      {'value': 'watches', 'icon': '⌚', 'label': 'Watches'},
      {'value': 'cars', 'icon': '🏎', 'label': 'Cars'},
      {'value': 'art', 'icon': '🎨', 'label': 'Art'},
      {'value': 'travel', 'icon': '✈️', 'label': 'Travel'},
      {'value': 'golf', 'icon': '⛳', 'label': 'Golf & Clubs'},
      {'value': 'boats', 'icon': '⛵', 'label': 'Boating'},
      {'value': 'fitness', 'icon': '💪', 'label': 'Fitness'},
      {'value': 'money', 'icon': '💰', 'label': 'Investing'},
      {'value': 'philanthropy', 'icon': '🤝', 'label': 'Philanthropy'},
    ],
  },
  {
    'id': 'faith',
    'type': 'single',
    'label': 'FAITH',
    'question': 'Does faith or spirituality play a role?',
    'subtitle': 'Your answer unlocks or skips spiritual content.',
    'options': [
      {'value': 'central', 'icon': '🕊', 'label': 'Central to my life'},
      {'value': 'private', 'icon': '🌙', 'label': 'Private but important'},
      {'value': 'exploring', 'icon': '🌱', 'label': 'Exploring'},
      {'value': 'secular', 'icon': '🧠', 'label': 'Secular'},
    ],
  },
  {
    'id': 'urgency',
    'type': 'single',
    'label': 'TIMELINE',
    'question': 'How soon do you need this?',
    'subtitle': 'We\'ll sequence your chapters by timing.',
    'options': [
      {'value': 'now', 'icon': '🔥', 'label': 'Yesterday — something coming up'},
      {'value': 'building', 'icon': '🧱', 'label': 'Next few months'},
      {'value': 'long', 'icon': '🌳', 'label': 'Long game'},
    ],
  },
];

/// Returns the current answer value for [questionId] from [info].
String? quizGetAnswer(PersonalInfo info, String questionId) => switch (questionId) {
      'gender' => info.gender?.name,
      'life_stage' => info.lifeStage,
      'field' => info.field,
      'confidence' => info.confidence,
      'faith' => info.faith,
      'urgency' => info.urgency,
      _ => null,
    };

/// Returns a new [PersonalInfo] with [questionId] set to [value].
PersonalInfo quizSetAnswer(PersonalInfo info, String questionId, String value) =>
    switch (questionId) {
      'gender' => info.copyWith(gender: Gender.values.byName(value)),
      'life_stage' => info.copyWith(lifeStage: value),
      'field' => info.copyWith(field: value),
      'confidence' => info.copyWith(confidence: value),
      'faith' => info.copyWith(faith: value),
      'urgency' => info.copyWith(urgency: value),
      _ => info,
    };
