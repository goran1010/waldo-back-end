export default function isCharacterFound(
  character,
  currentCoor,
  characterCoor,
) {
  if (
    currentCoor.x >= characterCoor[character].x - 2 &&
    currentCoor.x <= characterCoor[character].x + 2 &&
    currentCoor.y >= characterCoor[character].y - 6 &&
    currentCoor.y <= characterCoor[character].y + 6
  ) {
    return true;
  }
  return false;
}
