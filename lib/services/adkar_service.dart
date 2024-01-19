import 'package:get_storage/get_storage.dart';

class AdkarServices {
  final GetStorage _storage = GetStorage();
  final String _totalAdkar = 'totalAdkar';

  saveAdkarNumberToStorage({
    required int totalAdkar,
  }) {
    _storage.write(_totalAdkar, totalAdkar);
  }

  int loadTotalAdkarFromStorage() {
    // print('\x1B[32m in loadUserFromStorage');
    final totalAdkarNumber = _storage.read<int>(_totalAdkar);
    return totalAdkarNumber ?? 0;
  }

  // removAdkar() {
  //   print('\x1B[32m in delete AdkarNumber');

  //   _storage.remove(_adkarNumber);
  // }
}
