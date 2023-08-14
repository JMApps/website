import 'package:website/domain/model/tagline_model.dart';

class TagLineRepository {
  Future<List<TagLineModel>> fetchTagLines() async {
    return [
      TagLineModel(
        id: 1,
        title: '«JM-APPS» — серия бесплатных Android и iOS приложений',
        subTitle: 'Мы работаем — вы получаете пользу!',
        icon: '',
      ),
      TagLineModel(
        id: 2,
        title: 'Платный контент и нудная реклама — всё это вы никогда не встретите в наших приложениях',
        subTitle: 'Все наши продукты бесплатные и безрекламные на постоянной основе',
        icon: '',
      ),
      TagLineModel(
        id: 3,
        title: 'Ваши идеи для нас очень важны!',
        subTitle: 'Пишите нам, и, возможно, ваши предложения лягут в основу нашего софта',
        icon: '',
      ),
      TagLineModel(
        id: 4,
        title: 'Вставьте свой кирпичик!',
        subTitle: 'Делитесь ссылками на наши приложения, помогать и облегчать людям — в этом наша общая заинтересованность',
        icon: '',
      ),
      TagLineModel(
        id: 5,
        title: 'Проект «JM-APPS» не имеет спонсоров, как и не имеет иных источников дохода',
        subTitle: "Вы всегда можете поддержать проект, облегчая нам нашу работу и избавляя нас от нужд, по воле Аллаха!",
        icon: '',
      ),
    ];
  }
}
