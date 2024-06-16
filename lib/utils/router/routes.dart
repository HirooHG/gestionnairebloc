
enum Routes {
  auth("/"),
  add("/add"),
  update("/update"),
  home("/home");

  const Routes(this.path);

  final String path;
}
