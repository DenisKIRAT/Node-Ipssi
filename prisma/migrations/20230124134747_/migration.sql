/*
  Warnings:

  - You are about to drop the `ToDoItem` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ToDoList` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ToDoItem" DROP CONSTRAINT "ToDoItem_toDoListId_fkey";

-- DropForeignKey
ALTER TABLE "ToDoList" DROP CONSTRAINT "ToDoList_userId_fkey";

-- DropTable
DROP TABLE "ToDoItem";

-- DropTable
DROP TABLE "ToDoList";

-- CreateTable
CREATE TABLE "TodoList" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "TodoList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TodoItem" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "todoListId" TEXT NOT NULL,

    CONSTRAINT "TodoItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TodoList_id_key" ON "TodoList"("id");

-- CreateIndex
CREATE UNIQUE INDEX "TodoItem_id_key" ON "TodoItem"("id");

-- AddForeignKey
ALTER TABLE "TodoList" ADD CONSTRAINT "TodoList_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TodoItem" ADD CONSTRAINT "TodoItem_todoListId_fkey" FOREIGN KEY ("todoListId") REFERENCES "TodoList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
