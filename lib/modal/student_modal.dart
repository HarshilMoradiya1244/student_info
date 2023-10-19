class StudentModel {
  String? name,std;
  int? grid;

  StudentModel({this.grid, this.name,this.std});

  factory StudentModel.fromMap(Map m1){
    StudentModel s1 =StudentModel(
      grid: m1['grid'],
      name: m1['name'],
      std: m1['std'],
    );
    return s1;
  }
}