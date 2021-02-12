import 'package:flutter/foundation.dart';

class Tutor with ChangeNotifier {
  final String id;
  final String subject;
  final String name;
  final String grade;
  final String description;
  final String imgUrl;
  final double price;

  Tutor({
  @required this.id, @required this.subject, 
  @required this.name, @required this.description, 
  @required this.imgUrl, @required this.price, @required this.grade});

}

class Tutors with ChangeNotifier{

  List<Tutor> items=[
    Tutor(id: '1', subject: 'Food', name: 'Cake', grade: 'Degree', description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/images/boy1.png', price: 500),
    Tutor(id: '2', subject: 'Electronics', name: 'Speaker', grade: 'Degree', description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/images/boy2.png', price: 500),
    Tutor(id: '3', subject: 'Book', name: 'Menu', grade: 'Degree',description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/images/boy1Big.png', price: 500),
    Tutor(id: '4', subject: 'Games', name: 'Fifa', grade: 'Degree',description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/images/girl.png', price: 500),
    Tutor(id: '5', subject: 'Furniture', name: 'Table',grade: 'Degree', description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/images/icon1.png', price: 500),
    Tutor(id: '6', subject: 'Computer', name: 'Laptop', grade: 'Degree',description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/images/icon2.png', price: 500),
    Tutor(id: '7', subject: 'Business', name: 'Card', grade: 'Degree', description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/images/kid.png', price: 500),
    // Tutor(id: '8', subject: 'Cycler', name: 'Motor', grade: 'Degree', description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/lap.png', price: 500),
    // Tutor(id: '9', subject: 'Wearing', name: 'Clothe', grade: 'Degree', description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/study.jpg', price: 500),
    // Tutor(id: '10', subject: 'Housing', name: 'Rental', grade: 'Degree', description: 'Django comes with a lot of built-in resources for the most common use cases of a Web application. The registration appis a very good example and a good thing...', imgUrl: 'assets/dres.jpg', price: 500),

  ];

  List<Tutor> get item{
    return [...items];
  }

  Tutor findById(String id){
    return items.firstWhere((pdt)=>pdt.id==id);
  }

}