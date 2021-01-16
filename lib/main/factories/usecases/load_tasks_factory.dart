import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

LoadTasks makeLocalLoadTasks() =>
    LocalLoadTasks(cacheStorage: makeLocalStorageAdapter());
