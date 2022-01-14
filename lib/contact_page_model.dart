import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
   String image;
   String name;
   String city;
   String country;
   String mobile;
   String email;
   String group;

  Contact({
      required this.image,
      required this.name,
      required this.city,
      required this.country,
      required this.mobile,
      required this.email,
      required this.group});

      factory Contact.fromJson(Map<String, dynamic>json) => 
      Contact(
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
      };
}
