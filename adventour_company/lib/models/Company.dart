import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  String _id;
  String _companyName;
  String _email;
  int _timesSuggested;
  int _timesAdded;


  Company(companyName, email, timesSuggested, timesAdded) {
    _companyName = companyName;
    _email = email;
    _timesSuggested = timesSuggested;
    _timesAdded = timesAdded;
  }

  Company.fromFirestore(DocumentSnapshot snapshot) {
    _id = snapshot.id;
    Map data = snapshot.data();
    _companyName = data['companyName'];
    _email = data['email'];
    _timesSuggested = data['timesSuggested'];
    
  }

  Map<String, dynamic> toJson() => {
        'companyName': _companyName,
        'email': _email,
        'timesSugessted': _timesSuggested,
        'timesAdded': _timesAdded,
      };

  get id => _id;

  get companyName => _companyName;

  set companyName(String companyName) => _companyName = companyName;

  get email => _email;
  
  set email(String email)=>_email = email;

  get timesSuggested => _timesSuggested;

  set timesSuggested(int timesSuggested) => _timesSuggested = timesSuggested;

  get timesAdded => _timesAdded;

  set timesAdded(int timesAdded) => _timesAdded = timesAdded;

  int getAttribute(String affected) {
    switch (affected) {
      case "timesSuggested":
        return _timesSuggested;
      case "timesAdded":
        return _timesAdded;
      default:
        return null;
    }
  }
}