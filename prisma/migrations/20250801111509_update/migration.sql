/*
  Warnings:

  - Made the column `solutionURL` on table `Solution` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Solution" DROP CONSTRAINT "Solution_solutionURL_fkey";

-- AlterTable
ALTER TABLE "Solution" ALTER COLUMN "solutionURL" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Solution" ADD CONSTRAINT "Solution_solutionURL_fkey" FOREIGN KEY ("solutionURL") REFERENCES "Image"("imageURL") ON DELETE RESTRICT ON UPDATE CASCADE;
