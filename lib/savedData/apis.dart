final bool deploy = false;

final productApi = deploy ? domainProducts : localproduct;
final peopleApi = deploy ? domainPeople : localPeople;

final localIP = '192.168.1.102';

final imageCdn =
    'https://skiteimages.ams3.digitaloceanspaces.com/productImages';
final imgUrl = 'https://spaces01.nepek.com';

final domainPeople = 'https://service01.nepek.com';
final domainProducts = 'https://service02.nepek.com';

final localproduct = 'http://$localIP:8000';
final localPeople = 'http://$localIP:5000';
