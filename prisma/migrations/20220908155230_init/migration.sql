-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `userName` VARCHAR(255) NOT NULL,
    `nic` VARCHAR(255) NULL,
    `userRole` INTEGER NOT NULL DEFAULT 1,
    `cashInHand` DECIMAL(65, 30) NOT NULL DEFAULT 0,

    UNIQUE INDEX `users_userName_key`(`userName`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `venders` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `venderName` VARCHAR(255) NOT NULL,
    `address` VARCHAR(191) NULL,
    `email` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NULL,
    `balance` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `createdUserId` BIGINT NOT NULL,
    `updatedUserId` BIGINT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `customerName` VARCHAR(255) NOT NULL,
    `address` VARCHAR(191) NULL,
    `phone` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `nic` VARCHAR(255) NULL,
    `customerNature` INTEGER NULL,
    `balance` DECIMAL(65, 30) NULL DEFAULT 0,
    `vehicleNo` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdUserId` BIGINT NOT NULL,
    `updatedUserId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `branches` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `branchName` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NULL,
    `address` VARCHAR(191) NULL,
    `usersId` BIGINT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sales` (
    `itemId` BIGINT NOT NULL AUTO_INCREMENT,
    `invoiceNo` BIGINT NOT NULL,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `customerId` BIGINT NOT NULL,
    `pumpId` BIGINT NOT NULL,
    `qty` INTEGER NOT NULL DEFAULT 0,
    `value` INTEGER NOT NULL DEFAULT 0,
    `refNo` BIGINT NOT NULL,
    `tax` INTEGER NOT NULL DEFAULT 0,
    `description` VARCHAR(255) NULL,
    `cash` INTEGER NOT NULL,

    PRIMARY KEY (`itemId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tanks` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `remainQty` DECIMAL(65, 30) NULL,
    `createdUserId` BIGINT NOT NULL,
    `updatedUserId` BIGINT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `itemsId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `refills` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `refillAmount` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `cost` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `tanksId` BIGINT NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tankDetails` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `tanksId` BIGINT NOT NULL,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `cost` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `sellingPrice` DECIMAL(65, 30) NOT NULL,
    `liters` DECIMAL(65, 30) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wastages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `cost` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `liters` DECIMAL(65, 30) NULL,
    `tanksId` BIGINT NOT NULL,
    `actualMeter` DECIMAL(65, 30) NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pumpMachines` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `pumpName` VARCHAR(255) NOT NULL,
    `pumpOperatorId` BIGINT NOT NULL,
    `createdUserId` BIGINT NOT NULL,
    `updatedUserId` BIGINT NOT NULL,
    `tanksId` BIGINT NOT NULL,

    UNIQUE INDEX `pumpMachines_pumpOperatorId_key`(`pumpOperatorId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pumpOperators` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(191) NULL,
    `phoneNo` VARCHAR(255) NULL,
    `nic` VARCHAR(255) NULL,
    `balance` DECIMAL(65, 30) NULL DEFAULT 0,
    `createdUserId` BIGINT NOT NULL,
    `updatedUserId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pumpMachineDetails` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `pumpMachineId` BIGINT NOT NULL,
    `startMeter` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `endMeter` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `amount` DECIMAL(65, 30) NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `items` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `itemName` VARCHAR(255) NOT NULL,
    `qty` INTEGER NULL DEFAULT 0,
    `max` INTEGER NULL DEFAULT 0,
    `min` INTEGER NULL DEFAULT 0,
    `cost` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `measurementType` INTEGER NULL,
    `sellingPrice` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `editable` BOOLEAN NOT NULL,
    `createdUserId` BIGINT NOT NULL,
    `updatedUserId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wareHouses` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `vehicleNo` VARCHAR(255) NOT NULL,
    `itemsId` BIGINT NOT NULL,
    `updatedUserId` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `venders` ADD CONSTRAINT `venders_createdUserId_fkey` FOREIGN KEY (`createdUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `venders` ADD CONSTRAINT `venders_updatedUserId_fkey` FOREIGN KEY (`updatedUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_createdUserId_fkey` FOREIGN KEY (`createdUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_updatedUserId_fkey` FOREIGN KEY (`updatedUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `branches` ADD CONSTRAINT `branches_usersId_fkey` FOREIGN KEY (`usersId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_pumpId_fkey` FOREIGN KEY (`pumpId`) REFERENCES `pumpMachines`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tanks` ADD CONSTRAINT `tanks_createdUserId_fkey` FOREIGN KEY (`createdUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tanks` ADD CONSTRAINT `tanks_updatedUserId_fkey` FOREIGN KEY (`updatedUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tanks` ADD CONSTRAINT `tanks_itemsId_fkey` FOREIGN KEY (`itemsId`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `refills` ADD CONSTRAINT `refills_tanksId_fkey` FOREIGN KEY (`tanksId`) REFERENCES `tanks`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tankDetails` ADD CONSTRAINT `tankDetails_tanksId_fkey` FOREIGN KEY (`tanksId`) REFERENCES `tanks`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `wastages` ADD CONSTRAINT `wastages_tanksId_fkey` FOREIGN KEY (`tanksId`) REFERENCES `tanks`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pumpMachines` ADD CONSTRAINT `pumpMachines_createdUserId_fkey` FOREIGN KEY (`createdUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pumpMachines` ADD CONSTRAINT `pumpMachines_updatedUserId_fkey` FOREIGN KEY (`updatedUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pumpMachines` ADD CONSTRAINT `pumpMachines_tanksId_fkey` FOREIGN KEY (`tanksId`) REFERENCES `tanks`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pumpMachines` ADD CONSTRAINT `pumpMachines_pumpOperatorId_fkey` FOREIGN KEY (`pumpOperatorId`) REFERENCES `pumpOperators`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pumpOperators` ADD CONSTRAINT `pumpOperators_createdUserId_fkey` FOREIGN KEY (`createdUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pumpOperators` ADD CONSTRAINT `pumpOperators_updatedUserId_fkey` FOREIGN KEY (`updatedUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pumpMachineDetails` ADD CONSTRAINT `pumpMachineDetails_pumpMachineId_fkey` FOREIGN KEY (`pumpMachineId`) REFERENCES `pumpMachines`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `items` ADD CONSTRAINT `items_createdUserId_fkey` FOREIGN KEY (`createdUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `items` ADD CONSTRAINT `items_updatedUserId_fkey` FOREIGN KEY (`updatedUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `wareHouses` ADD CONSTRAINT `wareHouses_itemsId_fkey` FOREIGN KEY (`itemsId`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `wareHouses` ADD CONSTRAINT `wareHouses_updatedUserId_fkey` FOREIGN KEY (`updatedUserId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
