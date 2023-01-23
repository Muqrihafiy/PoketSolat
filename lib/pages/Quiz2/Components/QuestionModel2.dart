class Question2 {
  final int id, answer;
  final String question;
  final List<String> options;

  Question2({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
    "Bilakah berlakunya tahun dukacita?",
    "options": ['10 Hijrah', '11Hijrah', '9 Hijrah','8 Hijrah'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Apakah Nama lain bagi tahun dukacita?",
    "options": ['عام القيامة', 'عام الزلزلة', 'عام الحزن', 'عام الغاشية'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Apakah sebab berlakunya tahun dukacita?",
    "options": ['Kematian Ibu\n Rasulullah', 'Kematian Datuknya', 'Dakwah ditentang', 'Kematian Siti\n Khadijah dan\n Abu Talib'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Bilakah berlakunya Peristiwa ISRAK Dan MIKRAJ?",
    "options": ['1 Syawal', '17 Ramadhan', '27 Rejab', '12 Rabiulawal'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "Siapakah Nama 2 malaikat yang mengiringi semasa ISRAK Dan MIKRAJ Nabi?",
    "options": ['Jibril dan Israfil', 'Mikhail dan Roqib', 'Jibril dan Izrail', 'Jibril dan Mikail'],
    "answer_index": 3,
  },
  {
    "id": 6,
    "question": "Siapakah orang yang merancang membunuh Nabi SAW?",
    "options": ['Abu Jahal', 'Abu Lahab', 'Hendon', 'Abu Sufyan'],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "Siapakah yang menggantikan tempat tidur Rasulullah SAW",
    "options": ['Saidina Umar', 'Saidina Ali', 'Saidina Uthman', 'Zaid Al-Harithah'],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "Mengapakah Orang Quraisy merancang pembunuhan baginda Rasulullah SAW?",
    "options": ['Benci kepada\n Dakwah baginda', 'Benci kepada\n keturunan baginda', 'Tidak suka\n agama datuk\n moyang mereka', 'Tidak suka beragama'],
    "answer_index": 0,
  },
  {
    "id": 9,
    "question": "Bilakah berlakunya perang badar",
    "options": ['17 Ramadhan\n 1 hijrah', '27 Rejab', '17 Ramadhan\n 2 hijrah','1 Syawal'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Berapakah bilangan tentera Islam yang menyertai Perang badar?",
    "options": ['1000', '120', '300', '313'],
    "answer_index": 3,
  },
  {
    "id": 11,
    "question": "Di manakah tempat berlakunya perang badar?",
    "options": ['Di Kota Mekah', 'Di Madinah', 'Lembah antara\n Mekah dan\n Madinah', 'Di Lembah Nil'],
    "answer_index": 2,
  },
  {
    "id": 12,
    "question": "Apakah faktor yang membawa kepada kemenangan perang badar?",
    "options": ['Pertolongan Allah', 'Tentera yang\n gagah perkasa', 'Semangat jihad\n yang tinggi',],
    "answer_index": 0,
  },
  {
    "id": 13,
    "question": "Siapakah salah seorang Nama tokoh di bawah yang menyertai Perang Badar?",
    "options": ['Saidina Abu Bakar', 'Zaid b Harithah', 'Salahuddin\n Al-Ayyubi', 'Jaafar b Abi Talib'],
    "answer_index": 0,
  },
  {
    "id": 14,
    "question": "Bilakah berlaku Perang Uhud?",
    "options": ['Bulan Ramadhan\n 2 hijrah', 'Bulan Syawal\n 3 hijrah', "Bulan Sya'aban", 'Bulan Zulkaedah'],
    "answer_index": 1,
  },
  {
    "id": 15,
    "question": "Apakah strategi tentera Islam dalam Perang Uhud?",
    "options": ['Tentera berkumpul\n di satu tempat', '50 tentera\n pemanah di\n atas bukit', 'Pasukan berkuda', 'Tentera mengepung\n musuh'],
    "answer_index": 1,
  },
  {
    "id": 16,
    "question": "Siapakah Nama Ketua orang Kafir yang mengetuai Perang Uhud",
    "options": ['Abu Jahal', 'Abu Lahab', 'Hamzah b\n Abdul Mutallib', 'Abu Sufyan b Harb'],
    "answer_index": 3,
  },
  {
    "id": 17,
    "question": "Siapakah yang membunuh Saidina Hamzah dalam Perang Uhud?",
    "options": ['Wahsy', 'Abdul Rahman\n b Maljan', 'Hendon b Utbah', 'Abu Sufyan b Harb'],
    "answer_index": 0,
  },
  {
    "id": 18,
    "question": "Antara berikut, yang manakah mukjizat Nabi Muhammad SAW",
    "options": ['Laut Terbelah 2', 'Al-Quran', 'Boleh\n memerintah Haiwan', 'Merawat\n Penyakit Kusta'],
    "answer_index": 1,
  },
  {
    "id": 19,
    "question": "Bilakah Rasulullah s.a.w dilahirkan ?",
    "options": ['12 Rabiul Awwal\n Tahun Gajah', '12 Rabiul Awwal\n Tahun Burung', '12 Rabiul Awwal\n Tahun Tupai', '12 Rabiul Awwal\n Tahun Kucing'],
    "answer_index": 0,
  },
  {
    "id": 20,
    "question": "Bilakah Rasulullah s.a.w wafat ?",
    "options": ['13 Rabiul Awwal\n Tahun 14 Hijrah', '12 Rabiul Awwal\n Tahun 10 Hijrah', '12 Rabiul Awwal\n Tahun 11 Hijrah', '11 Zulhijjah\n Tahun 11 Hijrah'],
    "answer_index": 2,
  },
];