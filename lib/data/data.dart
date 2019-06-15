class Data {
  static const numPages = 8;

  static const List<String> titleText = [
    'How Much Should You Charge?',
    'Who Are You?',
    'What\'s the project?',
    'Who\'s the client?',
    'How Much Should You Charge?',
    'Can you put the project into a portfolio?',
    'How much do like the project?',
    'Your price should be'
  ];

  static const Map<int, List<String>> choiceTitles = {
    1: ['Graphic Designer', 'Web Designer', 'UX Designer', 'UI Designer'],
    2: ['Organization', 'Website', 'Application', 'E-commerce'],
    3: ['Private client', 'Small/Medium Business', 'Large Corp'],
    4: ['What is your hourly rate?', 'How many hours do you estimate working?'],
    5: ['Yes', 'No'],
  };
}
