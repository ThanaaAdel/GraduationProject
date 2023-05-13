import 'package:cloud_firestore/cloud_firestore.dart';

class GroupData {
   String doctorName;
   String groupName;
   GroupData({required this.doctorName,required this.groupName});



// To convert the UserData(Data type) to   Map<String, Object>
  Map<String, dynamic> convert2Map() {
    return {
      "doctorName": doctorName,
      "groupName": groupName,

    };
  }

  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return GroupData(
      doctorName: snapshot["doctorName"],
       groupName:snapshot["groupName"],
    );
  }
}


