import '../../../search_property/data/models/properties_model.dart';

abstract class AllPropertiesRepo {
  Future<Properties?> fetchallProperties();
}
