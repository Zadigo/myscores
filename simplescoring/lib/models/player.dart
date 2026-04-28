abstract class BaseModel {
  Map<String, Object> toJson();
}

class Player extends BaseModel {
  String name;
  int score;

  Player({required this.name, this.score = 0});

  @override
  Map<String, Object> toJson() {
    return {
      "name": name,
      "score": score,
    };
  }
}
