export default function allCharactersFound(updateFound) {
  for (const character in updateFound) {
    if (updateFound[character] === false) {
      return false;
    }
  }
  return true;
}
