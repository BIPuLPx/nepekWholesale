final bool deploy = true;

final productApi = deploy ? domainProducts : localproduct;
final peopleApi = deploy ? domainPeople : localPeople;

final imageCdn =
    'https://skiteimages.ams3.digitaloceanspaces.com/productImages';
final imgUrl = 'https://cdn.images.nepek.com';

final domainPeople = 'https://service1.nepek.com/';
final domainProducts = 'https://service2.nepek.com/';

final localproduct = 'http://192.168.1.131:8000';
final localPeople = 'http://192.168.1.131:5000';
