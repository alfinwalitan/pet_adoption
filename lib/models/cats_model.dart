import 'package:flutter/material.dart';
import 'package:pet_adoption_app_project/const.dart';
import 'package:pet_adoption_app_project/models/owner_model.dart';

class Cat {
  final Color color;
  final String name, location, sex, image, description;
  final double age, weight;
  final int distance;
  final bool fav;
  final Owner owner;

  Cat({
    required this.fav,
    required this.image,
    required this.color,
    required this.description,
    required this.name,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.distance,
    required this.owner,
  });
}

List<Cat> cats = [
  Cat(
      fav: true,
      color: orange,
      name: 'Leo',
      description: desc,
      location: 'Dumai, Riau',
      sex: 'Male',
      age: 2.1,
      weight: 4.5,
      image: 'assets/cats/cat1.png',
      distance: 7,
      owner: owners[0]),
  Cat(
      fav: true,
      color: orange,
      name: 'Leo',
      description: desc,
      location: 'Dumai, Riau',
      sex: 'Male',
      age: 2.1,
      weight: 4.5,
      image: 'assets/cats/cat1.png',
      distance: 7,
      owner: owners[1]),
  Cat(
      fav: true,
      color: orange,
      name: 'Leo',
      description: desc,
      location: 'Dumai, Riau',
      sex: 'Male',
      age: 2.1,
      weight: 4.5,
      image: 'assets/cats/cat1.png',
      distance: 7,
      owner: owners[2]),
  Cat(
      fav: true,
      color: orange,
      name: 'Leo',
      description: desc,
      location: 'Dumai, Riau',
      sex: 'Male',
      age: 2.1,
      weight: 4.5,
      image: 'assets/cats/cat1.png',
      distance: 7,
      owner: owners[0]),
];

String desc =
    'This cat is a domestic species of small carnivorous mamal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic cat to distinguish is from the wild members of the family. A cat can either be a house cat, a farm cat or feral cat.';
