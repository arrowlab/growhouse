import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growhouse_dashboard/custom_data.dart';

class Database {
  DocumentReference dataDocRef =
      FirebaseFirestore.instance.collection('data').doc('allData');

  Stream<CustomData> get data {
    return dataDocRef.snapshots().map(_fromDocSnapToCustomData);
  }

  CustomData _fromDocSnapToCustomData(DocumentSnapshot snapshot) {
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    return CustomData(
      pH: map['pH'],
      humidity: map['humidity'],
      temperature: map['temperature'],
      redValue: map['red'],
      greenValue: map['green'],
      blueValue: map['blue'],
      redIntensity: map['redIntensity'],
      greenIntensity: map['greenIntensity'],
      blueIntensity: map['blueIntensity'],
      redConcentration: map['redConcentration'],
      greenConcentration: map['greenConcentration'],
      blueConcentration: map['blueConcentration'],
    );
  } 

  Future<void> toFirestore(CustomData customData) async {
    await dataDocRef.update({
      'red': customData.redValue,
      'green': customData.greenValue,
      'blue': customData.blueValue,
      }
    );
  }
}