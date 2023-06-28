import 'dart:math';

import 'package:faker/faker.dart';
import '../models/bachelor.dart';

List<Bachelor> generateBachelors() {
  final List<String> maleFirstNames = [
    'John',
    'Michael',
    'William',
    'David',
    'James',
    'Thomas',
    'Paul',
    'Louis',
    'nicolas',
    'Jeremy',
    'Manuel',
    'Eric',
    'Patric',
    'Maxence',
    'Loris',
    'Noé',
    // Ajoutez d'autres prénoms masculins ici
  ];

  final List<String> femaleFirstNames = [
    'Emily',
    'Emma',
    'Olivia',
    'Sophia',
    'Ava',
    'Léa',
    'Garence',
    'Justine',
    'Sarah',
    'Théa',
    'Lola',
    'Agathe',
    'Laura',
    'Lou',
    'Eleanore',
    'Marie',
    // Ajoutez d'autres prénoms féminins ici
  ];

  final List<String> lastNames = [
    'Smith',
    'Johnson',
    'Brown',
    'Taylor',
    'Miller',
    'Martinez',
    'Dupont',
    'Jones',
    'Lewis',
    'Green',
    'Scott',
    'Allen',
    'Lee',
    'Garcia',
    'Clark',
    // Ajoutez d'autres noms de famille ici
  ];

  final List<Gender> genders = [Gender.Male, Gender.Female];

  final List<String> maleAvatars = [
    'images/maleAvatars/man-1.png',
    'images/maleAvatars/man-2.png',
    'images/maleAvatars/man-3.png',
    'images/maleAvatars/man-4.png',
    'images/maleAvatars/man-5.png',
    'images/maleAvatars/man-6.png',
    'images/maleAvatars/man-7.png',
    'images/maleAvatars/man-8.png',
    'images/maleAvatars/man-9.png',
    'images/maleAvatars/man-10.png',
    'images/maleAvatars/man-11.png',
    'images/maleAvatars/man-12.png',
    'images/maleAvatars/man-13.png',
    'images/maleAvatars/man-14.png',
    'images/maleAvatars/man-15.png',
  ];

  final List<String> femaleAvatars = [
    'images/femaleAvatars/woman-1.png',
    'images/femaleAvatars/woman-2.png',
    'images/femaleAvatars/woman-3.png',
    'images/femaleAvatars/woman-4.png',
    'images/femaleAvatars/woman-5.png',
    'images/femaleAvatars/woman-6.png',
    'images/femaleAvatars/woman-7.png',
    'images/femaleAvatars/woman-8.png',
    'images/femaleAvatars/woman-9.png',
    'images/femaleAvatars/woman-10.png',
    'images/femaleAvatars/woman-11.png',
    'images/femaleAvatars/woman-12.png',
    'images/femaleAvatars/woman-13.png',
    'images/femaleAvatars/woman-14.png',
    'images/femaleAvatars/woman-15.png',
  ];

  const int totalBachelors = 30;
  final List<Bachelor> bachelors = [];

  final faker = Faker();

  // Génération des bachelors féminins
  for (int i = 0; i < totalBachelors; i++) {
    // Choix aléatoire du genre
    Gender randomGender = genders[Random().nextInt(genders.length)];

    // Choix aléatoire d'un prénom en fonction du genre
    String firstName = (randomGender == Gender.Male)
        ? maleFirstNames[Random().nextInt(maleFirstNames.length)]
        : femaleFirstNames[Random().nextInt(femaleFirstNames.length)];

    // Choix aléatoire d'un nom de famille
    String lastName = lastNames[Random().nextInt(lastNames.length)];

    // Choix aléatoire d'un chemin d'image d'avatar
    String randomAvatar = (randomGender == Gender.Male)
        ? maleAvatars[Random().nextInt(maleAvatars.length)]
        : femaleAvatars[Random().nextInt(femaleAvatars.length)];

    final job = faker.job.title();
    final description = faker.lorem.sentences(3).join(' ');

    // Création d'un objet Bachelor avec les valeurs générées
    Bachelor bachelor = Bachelor(
      firstname: firstName,
      lastname: lastName,
      gender: randomGender,
      avatar: randomAvatar,
      searchFor: genders,
      job: job,
      description: description,
    );

    // Ajout du bachelor à la liste
    bachelors.add(bachelor);
  }

  return bachelors;
}
