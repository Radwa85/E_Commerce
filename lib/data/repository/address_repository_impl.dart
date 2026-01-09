
import 'package:e_commerce/domain/entity/address.dart';
import 'package:e_commerce/domain/repository/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository{
  @override
  List<Address> fetchAddresses() {
    return [
      Address(title: 'Home', description: '123 Main Street, Cityville', isDefault: true),
      Address(title: 'Office', description: '456 Business Avenue, Officeville', isDefault: false),
      Address(title: 'Work', description: '789 Work Lane, Worktown', isDefault: false),
      Address(title: 'Other', description: '101 Other Street, Otherville', isDefault: false),
    ];
  }

}