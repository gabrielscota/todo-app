import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../../factories/factories.dart';

HomePresenter makeGetxHomePresenter() => GetxHomePresenter(
      loadTasks: makeLocalLoadTasks(),
      loadProjects: makeLocalLoadProjects(),
    );
