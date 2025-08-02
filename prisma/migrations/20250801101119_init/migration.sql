/*
  Warnings:

  - You are about to drop the column `password` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Session` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "User_username_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "password",
ALTER COLUMN "username" SET DEFAULT 'anonymous';

-- DropTable
DROP TABLE "Session";

-- CreateTable
CREATE TABLE "Image" (
    "id" SERIAL NOT NULL,
    "imageURL" TEXT NOT NULL,
    "coor" JSONB NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Solution" (
    "id" SERIAL NOT NULL,
    "userId" TEXT,
    "started" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finished" TIMESTAMP(3),
    "score" TIMESTAMP(3),
    "solutionURL" TEXT,

    CONSTRAINT "Solution_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Image_imageURL_key" ON "Image"("imageURL");

-- AddForeignKey
ALTER TABLE "Solution" ADD CONSTRAINT "Solution_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Solution" ADD CONSTRAINT "Solution_solutionURL_fkey" FOREIGN KEY ("solutionURL") REFERENCES "Image"("imageURL") ON DELETE SET NULL ON UPDATE CASCADE;
