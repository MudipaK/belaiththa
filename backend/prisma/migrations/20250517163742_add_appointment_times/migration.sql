/*
  Warnings:

  - Added the required column `endTime` to the `Appointment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startTime` to the `Appointment` table without a default value. This is not possible if the table is not empty.

*/
-- First add the columns as nullable
ALTER TABLE `Appointment` ADD COLUMN `startTime` VARCHAR(191) NULL;
ALTER TABLE `Appointment` ADD COLUMN `endTime` VARCHAR(191) NULL;

-- Update existing records with default values
UPDATE `Appointment` SET 
    `startTime` = '09:00',
    `endTime` = '10:00'
WHERE `startTime` IS NULL;

-- Make the columns required
ALTER TABLE `Appointment` MODIFY `startTime` VARCHAR(191) NOT NULL;
ALTER TABLE `Appointment` MODIFY `endTime` VARCHAR(191) NOT NULL;
