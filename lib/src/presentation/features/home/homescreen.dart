import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hadin/src/presentation/features/menu/gedung_screen.dart';
import 'package:test_hadin/src/presentation/states/bloc/faculty_bloc.dart';
import 'package:test_hadin/src/presentation/widgets/tile_faculty.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<FacultyBloc>().add(FetchFaculty());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BlocBuilder<FacultyBloc, FacultyState>(
                  builder: (context, state) {
                    if (state is FacultyLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FacultyError) {
                      return const Center(
                        child: Text('Ada Masalah'),
                      );
                    } else if (state is FacultyHasData) {
                      final result = state.listFaculty;
                      return ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(keepScrollOffset: false),
                        itemBuilder: (context, index) {
                          final data = result[index];
                          return InkWell(
                            onTap: () =>
                                showGedung(context: context, id: data.id),
                            child: TileFaculty(facultyEntity: data),
                          );
                        },
                        separatorBuilder: (context, index) => const Center(
                          child: SizedBox(height: 8),
                        ),
                        itemCount: result.length,
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
