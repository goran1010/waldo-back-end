/*
  Warnings:

  - Made the column `userId` on table `Solution` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Solution" DROP CONSTRAINT "Solution_userId_fkey";

-- AlterTable
ALTER TABLE "Solution" ALTER COLUMN "userId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Solution" ADD CONSTRAINT "Solution_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
