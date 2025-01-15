/*
  Warnings:

  - You are about to drop the column `llamaCoderVersion` on the `Chat` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Message` table. All the data in the column will be lost.
  - You are about to drop the `GeneratedApp` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_chatId_fkey";

-- DropIndex
DROP INDEX "Message_chatId_idx";

-- AlterTable
ALTER TABLE "Chat" DROP COLUMN "llamaCoderVersion";

-- AlterTable
ALTER TABLE "Message" DROP COLUMN "createdAt";

-- DropTable
DROP TABLE "GeneratedApp";

-- CreateIndex
CREATE INDEX "Chat_id_idx" ON "Chat"("id");

-- CreateIndex
CREATE INDEX "Message_id_idx" ON "Message"("id");

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
