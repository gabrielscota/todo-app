import './translation.dart';

class PtBr implements Translation {
  String get msgInvalidField => 'Campo inválido';
  String get msgRequiredField => 'Campo obrigatório';
  String get msgUnexpectedError =>
      'Algo errado aconteceu. Tente novamente em breve.';

  String get emptyTasks =>
      'Parece que você ainda não tem nenhuma tarefa, que tal criarmos a primeira?';
}
