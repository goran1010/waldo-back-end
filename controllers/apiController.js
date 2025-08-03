import prisma from "../db/prisma.js";
import isCharacterFound from "../scripts/isCharacterFound.js";
import allCharactersFound from "../scripts/allCharactersFound.js";

export async function createUser(req, res) {
  const { imageId } = req.body;
  const user = await prisma.user.create({ data: {} });

  await prisma.solution.create({
    data: {
      imageId: imageId,
      userId: user.id,
      characterFound: JSON.stringify({ waldo: false, wendy: false }),
    },
  });

  res.status(201).json(user);
}

export async function updateSolution(req, res) {
  const { userId } = req.params;
  const { imageId, character, coordinates } = req.body;

  const getSolution = await prisma.solution.findFirst({
    where: { userId, imageId },
    include: { Image: true },
  });

  if (isCharacterFound(character, coordinates, getSolution.Image.coor)) {
    const updateFound = JSON.parse(getSolution.characterFound);
    updateFound[character] = true;

    const newSolution = await prisma.solution.update({
      where: { id: getSolution.id },
      data: {
        characterFound: JSON.stringify(updateFound),
      },
    });

    if (allCharactersFound(updateFound)) {
      const done = new Date();
      const score = await prisma.solution.update({
        where: { id: getSolution.id },
        data: {
          finished: done,
          score: (done - newSolution.started) / 1000,
        },
      });

      return res.status(201).json(score);
    }
    return res.status(200).json(character);
  }
  res.status(400).json(character);
}
