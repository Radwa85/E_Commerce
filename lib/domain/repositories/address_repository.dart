
import '../entities/address.dart';

abstract class AddressRepository {
  Future<List<Address>> fetchAddresses();
}