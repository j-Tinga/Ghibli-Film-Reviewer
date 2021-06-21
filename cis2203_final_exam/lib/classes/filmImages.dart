//Ghibli API doesn't include pictures, so I have to take some urls from the internet

class filmImage {
  static var images = [
    "https://m.media-amazon.com/images/M/MV5BYzg0MWQwNTktM2ExNC00MmY2LTgwZmEtNjU5YTNlNmFmOTNhXkEyXkFqcGdeQXVyNzMwOTY2NTI@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZmY2NjUzNDQtNTgxNC00M2Q4LTljOWQtMjNjNDBjNWUxNmJlXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY1200_CR85,0,630,1200_AL_.jpg",
    "https://m.media-amazon.com/images/M/MV5BYzJjMTYyMjQtZDI0My00ZjE2LTkyNGYtOTllNGQxNDMyZjE0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY1200_CR113,0,630,1200_AL_.jpg",
    "https://m.media-amazon.com/images/M/MV5BN2QyZmFjMTEtZjdjYy00NmE4LTkzZTgtMzhkNjFlMGEwNTY5L2ltYWdlXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMTY5NjI2MjQxMl5BMl5BanBnXkFtZTgwMDA2MzM2NzE@._V1_FMjpg_UX1000_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZjVkYmFkZWQtZmNjYy00NmFhLTliMWYtNThlOTUxNjg5ODdhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BYjBkODU2MjEtMjRhZi00M2M2LTg4ZjgtMGM0NjFiZTdjMzZhXkEyXkFqcGdeQXVyMjc2Nzg5OTQ@._V1_UY1200_CR105,0,630,1200_AL_.jpg",
    "https://m.media-amazon.com/images/M/MV5BNmQ3N2U5NGMtNjU0MS00YTQzLWE1ZDctZDU5M2M5NTNjOGRmXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BNGIzY2IzODQtNThmMi00ZDE4LWI5YzAtNzNlZTM1ZjYyYjUyXkEyXkFqcGdeQXVyODEzNjM5OTQ@._V1_UY1200_CR85,0,630,1200_AL_.jpg",
    "https://m.media-amazon.com/images/M/MV5BNzgwODZkMmYtMTBhNi00OWU1LThjNjYtMmJlY2QxNjNlZDNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY1200_CR85,0,630,1200_AL_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMTQ5ODMyNTgzOV5BMl5BanBnXkFtZTcwNDM4ODAyNw@@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZTRhY2QwM2UtNWRlNy00ZWQwLTg3MjktZThmNjQ3NTdjN2IxXkEyXkFqcGdeQXVyMzg2MzE2OTE@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZGFlN2FhYTktZGYzNi00MzllLWFlOTAtY2ExNjRjZjhkZWM2XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BOTc3YmM3N2QtODZkMC00ZDE5LThjMTQtYTljN2Y1YTYwYWJkXkEyXkFqcGdeQXVyODEzNjM5OTQ@._V1_UY1200_CR90,0,630,1200_AL_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZDY3ZGI0ZDAtMThlNy00MzAxLTg4YjAtNjkwYTkxNmQ4MjdlXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZmFjMTYwODAtMTUzZi00NWUzLWIzMjUtYTNiZTE2MzNlMjNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY1200_CR90,0,630,1200_AL_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMTU4NDg0MzkzNV5BMl5BanBnXkFtZTgwODA3Mzc1MDE@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMTgzOTI4OTYyNl5BMl5BanBnXkFtZTgwODI4NjQ5MDE@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZTlmYTJmMWEtNDRhNy00ODc1LTg2OTMtMjk2ODJhNTA4YTE1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg",
    "https://m.media-amazon.com/images/M/MV5BNDAzODE0YjctZDk4Ni00NTRkLTgyNTQtY2RlMWY1NTE3MTIyXkEyXkFqcGdeQXVyMjgyOTE0MDA@._V1_.jpg",
  ];

  List get getFilmImages {
    return images;
  }
}
