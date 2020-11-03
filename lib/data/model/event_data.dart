final int urlXmlSuffixLength = 53;

class EventData{
  String name;
  String date;
  String type;
  String organization;
  String link;
  String description;
  Venue venue;
  var canceled;
  var public;

  EventData.fromJson(json){
    name = json['name'];
    date = json['start'];
    type = json['type'];
    organization = json['organization']['name'];
    link = _parseURL(json['detailuri']);
    description = json['description'];
    venue = Venue.fromJson(json['venue']);
    canceled = json['canceled'];
    public = json['public'];
  }

  @override
  String toString() {
    String x =
        '\n' + '-----------------'+ '\n'+
        date.toString() + '\n' + type.toString() + '\n' + name.toString() +
        '\n' + organization.toString() + '\n' + venue.toString() + '\n'
        + '-----------------';
    return x;
  }

  _parseURL(String url){
    int urlLength = url.length;
    return url.substring(0, urlLength - urlXmlSuffixLength);
  }

  printDescription(){
    print(description);
  }
}

class Venue{
  String name;
  String city;
  String zipCode;

  Venue.fromJson(json){
    name = json['name'];
    city = json['city'];
    zipCode = json['postalCode'];
  }

  @override
  String toString() {
    return name.toString() + ', ' + city.toString()+ ', '+ zipCode.toString();
  }
}
