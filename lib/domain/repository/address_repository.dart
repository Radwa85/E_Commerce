
import '../entity/address.dart';

abstract class AddressRepository {
  List<Address> fetchAddresses();
}