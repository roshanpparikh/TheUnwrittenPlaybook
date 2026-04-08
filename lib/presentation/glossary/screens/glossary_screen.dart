import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/colors.dart';
import '../../../data/glossary_data.dart';
import '../../../di/dependency_provider.dart';
import '../../../domain/repositories/book_repository.dart';
import 'glossary_cubit.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GlossaryCubit(DependencyProvider.get<BookRepository>()),
      child: const _GlossaryView(),
    );
  }
}

class _GlossaryView extends StatefulWidget {
  const _GlossaryView();

  @override
  State<_GlossaryView> createState() => _GlossaryViewState();
}

class _GlossaryViewState extends State<_GlossaryView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(
      () => context.read<GlossaryCubit>().search(_searchController.text),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlossaryCubit, GlossaryState>(
      builder: (context, state) {
        if (state is GlossaryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GlossaryError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.message,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<GlossaryCubit>().load(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final loaded = state as GlossaryLoaded;
        final onSurface = Theme.of(context).colorScheme.onSurface;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Glossary',
                style: TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: onSurface,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 24),
              _buildSearchBar(onSurface, loaded.allTerms.length),
              const SizedBox(height: 16),
              Text(
                '${loaded.filteredTerms.length} terms',
                style: TextStyle(
                    fontSize: 12, color: onSurface.withValues(alpha: 0.4)),
              ),
              const SizedBox(height: 16),
              ...loaded.filteredTerms.map((term) => Column(
                    children: [
                      _buildGlossaryItem(term, onSurface),
                      const SizedBox(height: 8),
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchBar(Color onSurface, int total) {
    return TextField(
      controller: _searchController,
      style: TextStyle(color: onSurface),
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 16, right: 12),
          child: Text('🔍', style: TextStyle(fontSize: 16)),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        hintText: 'Search $total terms...',
        hintStyle: TextStyle(color: onSurface.withValues(alpha: 0.4)),
        filled: true,
        fillColor: onSurface.withValues(alpha: 0.04),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: onSurface.withValues(alpha: 0.08)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: onSurface.withValues(alpha: 0.08)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: blue),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }

  Widget _buildGlossaryItem(GlossaryTerm term, Color onSurface) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: onSurface.withValues(alpha: 0.06)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: onSurface.withValues(alpha: 0.04),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            term.title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: blue),
          ),
          const SizedBox(height: 4),
          Text(
            term.definition,
            style: TextStyle(
                fontSize: 13,
                color: onSurface.withValues(alpha: 0.7),
                height: 1.5),
          ),
          if (term.chapter.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(term.chapter,
                style: TextStyle(
                    fontSize: 11, color: onSurface.withValues(alpha: 0.4))),
          ],
        ],
      ),
    );
  }
}
