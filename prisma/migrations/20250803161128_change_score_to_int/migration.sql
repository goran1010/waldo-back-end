/*
  Warnings:

  - The `score` column on the `Solution` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Solution" DROP COLUMN "score",
ADD COLUMN     "score" INTEGER;
