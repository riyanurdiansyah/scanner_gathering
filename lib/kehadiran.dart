import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

List<Kehadiran?>? myCourseMFromJson(String str) =>
    List<Kehadiran>.from(json.decode(str)!.map((x) => Kehadiran.fromJson(x)));

class Kehadiran extends Equatable {
  final String time;
  final String name;
  final String brand;
  final String cabang;
  final String posisi;
  final String kamar;
  final String roomMate;

  const Kehadiran({
    required this.time,
    required this.name,
    required this.brand,
    required this.cabang,
    required this.posisi,
    required this.kamar,
    required this.roomMate,
  });

  factory Kehadiran.fromJson(dynamic json) {
    return Kehadiran(
      time: json['Timestamp'],
      name: json['Nama Lengkap'],
      brand: json['Brand'],
      cabang: json['Cabang'],
      posisi: json['Posisi'],
      kamar: json["Kamar"],
      roomMate: json["Room Mate"],
    );
  }

  Map<String, dynamic> toJson() => {
        'Timestamp': DateFormat.yMMMMd().add_Hms().format(DateTime.now()),
        'Nama Lengkap': name,
        'Brand': brand,
        'Cabang': cabang,
        'Posisi': posisi,
        'Kamar': kamar,
        'Room Mate': roomMate,
      };

  @override
  List<Object?> get props =>
      [name, brand, cabang, brand, posisi, kamar, roomMate];
}
