class FestivalPostModelClass {
  String fName;
  String fDesc;
  String fDay;
  String fDate; 
  String fMonth;
  String fReligion;

  FestivalPostModelClass({
    required this.fName,
    required this.fDesc,
    required this.fDay,
    required this.fMonth,
    required this.fDate, 
    required this.fReligion,
  });

  factory FestivalPostModelClass.fun({required Map<String, dynamic> data}) {
    return FestivalPostModelClass(
      fName: data['fName'],
      fDesc: data['fDesc'],
      fDay: data['fDay'],
      fMonth: data['fMonth'],
      fDate: data['fDate'], 
      fReligion: data['fReligion'],
    );
  }
}
