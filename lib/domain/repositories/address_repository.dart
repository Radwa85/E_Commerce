
import '../entities/address.dart';

abstract class AddressRepository {
  List<Address> fetchAddresses();
}