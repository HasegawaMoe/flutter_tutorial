enum FactionEnum {
  rice('ご飯', 'https://jsonplaceholder.typicode.com/posts'),
  bread('パン', 'https://jsonplaceholder.typicode.com/comments'),
  noodle('麺', 'https://jsonplaceholder.typicode.com/albums'),
  potato('芋', 'https://jsonplaceholder.typicode.com/todos'),
  notEating('食べない', 'https://jsonplaceholder.typicode.com/users');

  final String japanese;
  final String url;
  const FactionEnum(this.japanese, this.url);
}
