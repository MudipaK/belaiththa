/*
  Warnings:

  - You are about to drop the column `googleCalendarEventId` on the `appointment` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `appointment` DROP COLUMN `googleCalendarEventId`;

-- CreateTable
CREATE TABLE `Symptom` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Symptom_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AppointmentSymptom` (
    `appointmentId` INTEGER NOT NULL,
    `symptomId` INTEGER NOT NULL,

    INDEX `AppointmentSymptom_appointmentId_idx`(`appointmentId`),
    INDEX `AppointmentSymptom_symptomId_idx`(`symptomId`),
    PRIMARY KEY (`appointmentId`, `symptomId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `AppointmentSymptom` ADD CONSTRAINT `AppointmentSymptom_appointmentId_fkey` FOREIGN KEY (`appointmentId`) REFERENCES `Appointment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AppointmentSymptom` ADD CONSTRAINT `AppointmentSymptom_symptomId_fkey` FOREIGN KEY (`symptomId`) REFERENCES `Symptom`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
