class Colaborador {
  String idColaborador;
  String name;
  String email;
  int setor;
  bool isAdm;
  bool authorized;
  String setorUser;
  String unidade;

  Colaborador(
    this.idColaborador,
    this.name,
    this.email,
    this.unidade,
    this.setor,
    this.isAdm, {
    this.setorUser = '',
    this.authorized = false,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idUsuario": this.idColaborador,
      "nome": this.name,
      "unidade": this.unidade,
      "email": this.email,
      "setor": this.setor,
      "isAdm": this.isAdm,
      "setorUser": this.setorUser,
      "authorized": this.authorized,
    };

    return map;
  }
}