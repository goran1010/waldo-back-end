/*
  Warnings:

  - You are about to drop the column `solutionURL` on the `Solution` table. All the data in the column will be lost.
  - Added the required column `solutionId` to the `Solution` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Solution" DROP CONSTRAINT "Solution_solutionURL_fkey";

-- AlterTable
ALTER TABLE "Solution" DROP COLUMN "solutionURL",
ADD COLUMN     "solutionId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Solution" ADD CONSTRAINT "Solution_solutionId_fkey" FOREIGN KEY ("solutionId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
