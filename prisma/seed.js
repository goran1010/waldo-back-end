import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const images = [
  {
    imageURL: "./assets/waldo-in-battle.jpeg",
    coor: {
      waldo: {
        x: 7.5,
        y: 20,
      },
      wendy: {
        x: 98,
        y: 98,
      },
    },
  },
  {
    imageURL: "./assets/waldo-in-town.jpeg",
    coor: {
      waldo: {
        x: 2,
        y: 2,
      },
      wendy: {
        x: 98,
        y: 98,
      },
    },
  },
  {
    imageURL: "./assets/waldo-shopping.jpeg",
    coor: {
      waldo: {
        x: 2,
        y: 2,
      },
      wendy: {
        x: 98,
        y: 98,
      },
    },
  },
];

async function main() {
  for (const image of images) {
    await prisma.image.create({ data: image });
  }

  console.log("Seed data inserted into Image table.");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
