final bool deploy = false;

final serviceTwo = deploy ? domainProducts : localproduct;
final serviceOne = deploy ? domainPeople : localPeople;

final localIP = '192.168.10.74';

final imgUrl = 'https://spaces01.nepek.com';

final domainPeople = 'https://service-01.nepek.com';
final domainProducts = 'https://service-02.nepek.com';

final localproduct = 'http://$localIP:8000';
final localPeople = 'http://$localIP:5000';
