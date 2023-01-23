class Question{
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
    "Wudhu' dari segi istilah ialah...",
    "options": ['Bersih dan indah', 'Anggota Badan yang\n tertentu \n dimulakan dengan niat', 'Bersih dan subur'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Sebutkan 2 daripada anggota wudhu'",
    "options": ['Telinga dan lengan', 'Kaki dan bahu', 'Muka dan tangan', 'Lengan dan jari'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Antara berikut merupakan Perkara yang membatalkan wudhu' KECUALI",
    "options": ['Hilang akal', 'Makan', 'Kentut', 'Tidur dengan\n tidak tetap\n papan punggung'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Sebutkan 2 Perkara sunat dalam solat",
    "options": ['Sunat tahhajjud\n dan hajat', 'Sunat hajat\n dan dhuha', 'Sunat terawih\n dan witir', 'Sunat haiat\n dan abaad'],
    "answer_index": 3,
  },
  {
    "id": 5,
    "question": "Sebutkan 1 rukun Fi'li dalam solat",
    "options": ['Berdiri betul', 'Takbiratul ihram', 'Tertib', 'Niat'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Apakah perkara yang membatalkan solat?",
    "options": ['Memandang atas', 'Makan dan minum', 'Solat ketika\n makanan\n telah dihidang', 'Solat dalam\n keadaan mengantuk'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Apakah sebab berhadas besar?",
    "options": ['Nifas', 'Tidur dengan\n tidak tetap\n papan punggung', 'Menyentuh kemaluan\n tanpa berlapik', 'Hilang akal'],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "Manakah Antara berikut larangan ketika berhadas besar?",
    "options": ['Makan', 'Solat', 'Tidur', 'Membuang air besar'],
    "answer_index": 1,
  },
  {
    "id": 9,
    "question": "Apakah maksud mandi pada bahasa?",
    "options": ['Membersihkan badan', 'Mengalirkan air', 'Meratakan air\n ke badan'],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "Berapakah jenis mandi?",
    "options": ['4', '5', '3', '2'],
    "answer_index": 2,
  },
];