import prisma from "../db/prisma.js";
import isCharacterFound from "../scripts/isCharacterFound.js";

export async function createUser(req, res) {
  const { imageId } = req.body;
  const user = await prisma.user.create({ data: {} });
  console.log(imageId);
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
  console.log(userId, imageId, character, coordinates);

  const getSolution = await prisma.solution.findFirst({
    where: { userId, imageId },
    include: { Image: true },
  });
  console.log(getSolution);

  if (isCharacterFound(character, coordinates, getSolution.Image.coor)) {
    return res.json(`${character} found !`);
  }
  res.status(400).json("Wrong coordinates");
}
