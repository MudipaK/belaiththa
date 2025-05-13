/*
  Warnings:

  - You are about to drop the column `metadata` on the `appointment` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `appointment` DROP COLUMN `metadata`;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `googleTokens` JSON NULL;
