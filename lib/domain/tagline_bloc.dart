import 'package:website/domain/tagline_repository.dart';
import 'package:website/domain/model/tagline_model.dart';

class TagLineBloc {
  final TagLineRepository _tagLineRepository;

  TagLineBloc(this._tagLineRepository);

  List<TagLineModel> _tagLines = [];

  List<TagLineModel> get getTagLines => _tagLines;

  Future<List<TagLineModel>> _loadTagLines() async {
    return _tagLines = await _tagLineRepository.fetchTagLines();
  }

  Future<List<TagLineModel>> get getLoadTagLines => _loadTagLines();
}
