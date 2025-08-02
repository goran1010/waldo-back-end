/*
  Warnings:

  - You are about to drop the column `solutionId` on the `Solution` table. All the data in the column will be lost.
  - Added the required column `imageId` to the `Solution` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Solution" DROP CONSTRAINT "Solution_solutionId_fkey";

-- AlterTable
ALTER TABLE "Solution" DROP COLUMN "solutionId",
ADD COLUMN     "imageId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Solution" ADD CONSTRAINT "Solution_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
