class CarouselPageable {
  final int id;
  final String? title;
  final String? block;
  final String? apartmentNumber;
  final dynamic area;
  final int? roomCount;
  final dynamic floorNumber;
  final String? createdDate;
  final String? sector;
  final String? field;
  final String? garageName;
  final String? carNumber;
  final String? type;
  final String? identificationNumber;
  final String? imageUrl;
  final String? company;
  final dynamic deposit;
  final String? apartmentName;
  final dynamic monthly;
  final double? dept;
  bool isSelected;

  CarouselPageable({
    required this.id,
    this.title,
    this.monthly,
    this.dept,
    this.block,
    this.apartmentNumber,
    this.area,
    this.roomCount,
    this.floorNumber,
    this.createdDate,
    this.sector,
    this.field,
    this.garageName,
    this.carNumber,
    this.type,
    this.identificationNumber,
    this.imageUrl,
    this.company,
    this.deposit,
    this.apartmentName,
    this.isSelected = false,
  });
}
