String trimName(String name, int upto) {
  if (upto < name.length)
    return name.substring(0, upto) + '...';
  else
    return name;
}
