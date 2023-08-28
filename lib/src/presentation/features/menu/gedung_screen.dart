import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hadin/core/constant/app_route.dart';
import 'package:test_hadin/src/presentation/states/gedung_bloc/gedung_bloc.dart';
import 'package:test_hadin/src/presentation/widgets/tile_gedung.dart';

void showGedung({required BuildContext context, required int id}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => GedungScreen(
          id: id,
        ),
        settings: const RouteSettings(
          name: AppRoute.gedung,
        ),
      ),
      (route) => false);
}

class GedungScreen extends StatefulWidget {
  final int id;
  const GedungScreen({
    super.key,
    required this.id,
  });

  @override
  State<GedungScreen> createState() => _GedungScreenState();
}

class _GedungScreenState extends State<GedungScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<GedungBloc>().add(FetchGedung(id: widget.id));
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
                BlocBuilder<GedungBloc, GedungState>(
                  builder: (context, state) {
                    if (state is GedungLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GedungError) {
                      return const Center(
                        child: Text('Ada Masalah'),
                      );
                    } else if (state is GedungHasData) {
                      final result = state.listGedung;
                      return ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(keepScrollOffset: false),
                        itemBuilder: (context, index) {
                          final data = result[index];
                          print(data);
                          return TileGedung(gedungEntity: data);
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
