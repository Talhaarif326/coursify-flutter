class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject(this.title, this.subtitle, this.image);
}

class Customer {
  int id;
  String name;
  int numberOfNotification;

  Customer(this.id, this.name, this.numberOfNotification);
}

class Contacts {
  int phoneNo;
  String email;
  String link;

  Contacts(this.email, this.link, this.phoneNo);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.contacts, this.customer);
}
