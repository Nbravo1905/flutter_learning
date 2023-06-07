import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const LoadingFull();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(slivers: [

      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
          centerTitle: true,
        ),
      ),

      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: slideShowMovies),
            MovieHorizontal(
              movies: nowPlayingMovies,
              title: 'En Cine',
              subTitle: 'Lunes 20',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontal(
              movies: upcomingMovies,
              title: 'Proximamente',
              subTitle: 'Este mes?',
              loadNextPage: () {
                ref.read(upcomingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontal(
              movies: popularMovies,
              title: 'Populares',
              //subTitle: '',
              loadNextPage: () {
                ref.read(popularMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontal(
              movies: topRatedMovies,
              title: 'Mejors Calificadas',
              //subTitle: '',
              loadNextPage: () {
                ref.read(topRatedMoviesProvider.notifier).loadNextPage();
              },
            ),
            const SizedBox(height: 15)
          ],
        );
      }, childCount: 1))
    ]);
  }
}
