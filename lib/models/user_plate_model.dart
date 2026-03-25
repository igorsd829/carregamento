class UserPlate {
  final String? id;
  final String name;
  final String? idTruck;

  String plate;
  final String colorTruck;
  final String brandTruck;
  final String weight;
  final String client;
  final String obs;
  final int? window;

  final String? datee;

  final DateTime date;
  final DateTime? enterTime;
  final DateTime? outTime;
  bool notFound;
  bool loaded;
  bool loading;
  bool autorized;
  bool problem;
  bool ready;

  UserPlate(
      {this.colorTruck = 'noColor',
      this.brandTruck = 'none',
      this.idTruck = '',
      this.weight = '0',
      this.obs = '',
      this.window = 0,
      this.id,
      this.client = '',
      this.name = '',
      required this.plate,
      required this.date,
      this.datee,

      this.enterTime,
      this.outTime,
      this.autorized = false,
      this.problem = false,
      this.loaded = false,
      this.ready = false,
      this.loading = false,
      this.notFound = false});
}
