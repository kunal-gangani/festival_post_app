import 'package:festival_post_maker_app/model/festival_post_model_class.dart';

List<Map<String, dynamic>> festivalData = [
  {
    'fName': 'Diwali',
    'fDay': 'Sunday',
    'fMonth': 'November',
    'fDate': '12',
    'fDesc':
        'Festival of Lights, celebrated by Hindus to mark the return of Lord Rama to Ayodhya.',
    'fReligion': 'Hinduism'
    ''
  },
  {
    'fName': 'Christmas',
    'fDay': 'Wednesday',
    'fMonth': 'December',
    'fDate': '25',
    'fDesc': 'Celebration of the birth of Jesus Christ.',
    'fReligion': 'Christianity'
  },
  {
    'fName': 'Eid al-Fitr',
    'fDay': 'Friday',
    'fMonth': 'April',
    'fDate': '21',
    'fDesc':
        'Marks the end of Ramadan, the Islamic holy month of fasting.',
    'fReligion': 'Islam'
  },
  {
    'fName': 'Holi',
    'fDay': 'Monday',
    'fMonth': 'March',
    'fDate': '18',
    'fDesc':
        'Festival of Colors, celebrates the arrival of spring and the victory of good over evil.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Guru Nanak Jayanti',
    'fDay': 'Friday',
    'fMonth': 'November',
    'fDate': '19',
    'fDesc':
        'Birth anniversary of Guru Nanak, the founder of Sikhism.',
    'fReligion': 'Sikhism'
  },
  {
    'fName': 'Vesak',
    'fDay': 'Saturday',
    'fMonth': 'May',
    'fDate': '15',
    'fDesc':
        'Celebrates the birth, enlightenment, and death of Gautama Buddha.',
    'fReligion': 'Buddhism'
  },
  {
    'fName': 'Passover',
    'fDay': 'Saturday',
    'fMonth': 'April',
    'fDate': '27',
    'fDesc':
        'Jewish holiday commemorating the liberation of the Israelites from Egyptian slavery.',
    'fReligion': 'Judaism'
  },
  {
    'fName': 'Easter',
    'fDay': 'Sunday',
    'fMonth': 'April',
    'fDate': '9',
    'fDesc':
        'Celebration of the resurrection of Jesus Christ from the dead.',
    'fReligion': 'Christianity'
  },
  {
    'fName': 'Raksha Bandhan',
    'fDay': 'Thursday',
    'fMonth': 'August',
    'fDate': '22',
    'fDesc':
        'A festival celebrating the bond between brothers and sisters.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Hanukkah',
    'fDay': 'Monday',
    'fMonth': 'December',
    'fDate': '18',
    'fDesc':
        'Jewish Festival of Lights, celebrating the rededication of the Second Temple in Jerusalem.',
    'fReligion': 'Judaism'
  },
  {
    'fName': 'Lunar New Year',
    'fDay': 'Saturday',
    'fMonth': 'February',
    'fDate': '1',
    'fDesc':
        'The beginning of a new year on the traditional Chinese calendar, celebrated in many Asian cultures.',
    'fReligion': 'Multiple (Buddhism, Taoism, etc.)'
  },
  {
    'fName': 'Makar Sankranti',
    'fDay': 'Wednesday',
    'fMonth': 'January',
    'fDate': '14',
    'fDesc':
        'Hindu festival dedicated to the Sun God and marks the beginning of the harvest season.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Pongal',
    'fDay': 'Thursday',
    'fMonth': 'January',
    'fDate': '15',
    'fDesc':
        'A harvest festival celebrated in South India, particularly Tamil Nadu.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Ram Navami',
    'fDay': 'Sunday',
    'fMonth': 'April',
    'fDate': '10',
    'fDesc':
        'Celebration of the birth of Lord Rama, an incarnation of Vishnu.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Ganesh Chaturthi',
    'fDay': 'Friday',
    'fMonth': 'September',
    'fDate': '22',
    'fDesc':
        'Festival celebrating the birth of Lord Ganesha, the remover of obstacles.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Kwanzaa',
    'fDay': 'Tuesday',
    'fMonth': 'December',
    'fDate': '26',
    'fDesc':
        'African-American cultural festival celebrating community, family, and culture.',
    'fReligion': 'Cultural (Secular)'
  },
  {
    'fName': 'Vishu',
    'fDay': 'Wednesday',
    'fMonth': 'April',
    'fDate': '14',
    'fDesc':
        'New Year festival celebrated in Kerala, marking the beginning of the harvest season.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Thaipusam',
    'fDay': 'Saturday',
    'fMonth': 'February',
    'fDate': '8',
    'fDesc':
        'Hindu festival celebrated in South India and among Tamil communities to honor Lord Murugan.',
    'fReligion': 'Hinduism'
  },
  {
    'fName': 'Rosh Hashanah',
    'fDay': 'Monday',
    'fMonth': 'September',
    'fDate': '30',
    'fDesc':
        'Jewish New Year, marking the beginning of the Jewish High Holy Days.',
    'fReligion': 'Judaism'
  },
  {
    'fName': 'Onam',
    'fDay': 'Wednesday',
    'fMonth': 'August',
    'fDate': '31',
    'fDesc':
        'Harvest festival celebrated in Kerala, commemorating the homecoming of King Mahabali.',
    'fReligion': 'Hinduism'
  }
];

List fest = festivalData
    .map(
      (e) => FestivalPostModelClass.fun(
        data: e,
      ),
    )
    .toList();

List allFest = fest
    .map(
      (e) => e['fReligion'],
    )
    .toList()
    .toSet()
    .toList();
