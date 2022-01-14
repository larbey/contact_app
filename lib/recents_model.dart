//import 'dart:convert';

//Recent recentFromJson(String str) => Recent.fromJson(json.decode(str));

//String recentToJson(Recent data) => json.encode(data.toJson());

class Recent {
  String image = 'assets/images/ava.jpg';
  String name = 'Ava Grace';
  String city = 'Albuquerque';
  String country = 'U.S.A';
  String mobile = '+505-248-4134';
  String email = 'ava@gmail.com';
  String group = 'Friends';

  Recent();

  /*factory Recent.fromJson(Map<String, dynamic> json) => Recent(
      image: json['image'],
      name: json['name'],
      city: json['city'],
      country: json['country'],
      mobile: json['mobile'],
      email: json['email'],
      group: json['group']);

  Map<String, dynamic> toJson() => {
        'image': image,
        'name': name,
        'city': city,
        'country': country,
        'mobile': mobile,
        'email': email,
        'group': group
      };*/
}

  /*final List<Recent> recents = [
    Recent(
        image: 'image1',
        name: 'name1',
        city: 'city1',
        country: 'country1',
        mobile: 'mobile1',
        email: 'email1',
        group: 'group1'),
  ];*/

