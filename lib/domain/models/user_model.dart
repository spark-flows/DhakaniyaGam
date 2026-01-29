class UserModel {
  int? id;
  String? name;
  String? fullName;
  String? relation;
  String? businessName;
  String? dob;
  String? age;
  String? total_income;

  UserModel({
    this.id,
    this.name,
    this.fullName,
    this.relation,
    this.businessName,
    this.dob,
    this.age,
    this.total_income,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'fullName': fullName,
      'relation': relation,
      'businessName': businessName,
      'dob': dob,
      'age': age,
      'total_income': total_income,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      fullName: map['fullName'],
      relation: map['relation'],
      businessName: map['businessName'],
      dob: map['dob'],
      age: map['age'],
      total_income: map['total_income'],
    );
  }
}
