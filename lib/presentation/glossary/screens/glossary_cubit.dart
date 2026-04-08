import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/data/glossary_data.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';

// ── State ─────────────────────────────────────────────────────────────────────

sealed class GlossaryState {
  const GlossaryState();
}

class GlossaryLoading extends GlossaryState {
  const GlossaryLoading();
}

class GlossaryLoaded extends GlossaryState {
  final List<GlossaryTerm> allTerms;
  final List<GlossaryTerm> filteredTerms;
  final String query;

  const GlossaryLoaded({
    required this.allTerms,
    required this.filteredTerms,
    this.query = '',
  });
}

class GlossaryError extends GlossaryState {
  final String message;
  const GlossaryError(this.message);
}

// ── Cubit ─────────────────────────────────────────────────────────────────────

class GlossaryCubit extends Cubit<GlossaryState> {
  final BookRepository _repo;

  GlossaryCubit(this._repo) : super(const GlossaryLoading()) {
    load();
  }

  Future<void> load() async {
    emit(const GlossaryLoading());
    try {
      final terms = await _repo.getGlossaryTerms();
      emit(GlossaryLoaded(allTerms: terms, filteredTerms: terms));
    } catch (e) {
      emit(GlossaryError(e.toString()));
    }
  }

  void search(String query) {
    final current = state;
    if (current is! GlossaryLoaded) return;

    final trimmed = query.trim().toLowerCase();
    final filtered = trimmed.isEmpty
        ? current.allTerms
        : current.allTerms
            .where((t) =>
                t.title.toLowerCase().contains(trimmed) ||
                t.definition.toLowerCase().contains(trimmed))
            .toList();

    emit(GlossaryLoaded(
      allTerms: current.allTerms,
      filteredTerms: filtered,
      query: query,
    ));
  }
}
