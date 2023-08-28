import 'package:get_it/get_it.dart';
import 'package:test_hadin/src/data/datasources/faculty_datasource.dart';
import 'package:test_hadin/src/data/repositories/faculty_repository_impl.dart';
import 'package:test_hadin/src/domain/repositories/faculty_repositories.dart';
import 'package:test_hadin/src/domain/usecases/get_list_faculty.dart';
import 'package:test_hadin/src/domain/usecases/get_list_gedung.dart';
import 'package:test_hadin/src/presentation/states/bloc/faculty_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_hadin/src/presentation/states/gedung_bloc/gedung_bloc.dart';

final locator = GetIt.instance;

void init() {
  // Datasources
  locator.registerLazySingleton<FacultyDatasource>(
    () => ImplFacultyDatasource(
      client: locator(),
    ),
  );

  // Repository
  locator.registerLazySingleton<FacultyRepositories>(
    () => FacultyRepositoryImpl(facultyDatasource: locator()),
  );

  // Use cases
  locator.registerLazySingleton(() => GetListFaculty(repositories: locator()));
  locator.registerLazySingleton(() => GetListGedung(repositories: locator()));

  // BloC
  locator.registerFactory(() => FacultyBloc(getListFaculty: locator()));
  locator.registerFactory(() => GedungBloc(getListGedung: locator()));

  // External
  locator.registerLazySingleton(() => http.Client());
}
