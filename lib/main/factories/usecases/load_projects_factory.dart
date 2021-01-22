import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

LoadProjects makeLocalLoadProjects() =>
    LocalLoadProjects(cacheStorage: makeLocalStorageAdapter());
