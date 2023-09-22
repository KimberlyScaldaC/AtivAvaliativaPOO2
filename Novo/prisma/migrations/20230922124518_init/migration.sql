/*
  Warnings:

  - The primary key for the `ProfessorAvaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `avaliacaoId1` on the `ProfessorAvaliacao` table. All the data in the column will be lost.
  - You are about to drop the column `avaliacaoId2` on the `ProfessorAvaliacao` table. All the data in the column will be lost.
  - You are about to drop the column `idProfessor` on the `ProfessorAvaliacao` table. All the data in the column will be lost.
  - The primary key for the `AlunoAvaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `avaliacaoId1` on the `AlunoAvaliacao` table. All the data in the column will be lost.
  - You are about to drop the column `avaliacaoId2` on the `AlunoAvaliacao` table. All the data in the column will be lost.
  - You are about to drop the column `idAluno` on the `AlunoAvaliacao` table. All the data in the column will be lost.
  - The primary key for the `Aluno` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Aluno` table. All the data in the column will be lost.
  - The primary key for the `Professor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Professor` table. All the data in the column will be lost.
  - Added the required column `idProfessorAvaliacao` to the `ProfessorAvaliacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAlunoAvaliacao` to the `AlunoAvaliacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAluno` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idProfessor` to the `Professor` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "AvaliacaoParaEstande" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "Alunoss" (
    "idAluno" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Grupo" (
    "idGrupo" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ProfessorAvaliacao" (
    "idProfessorAvaliacao" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "avaliacaoProfessor" INTEGER NOT NULL,
    "matriculaProfessor" INTEGER NOT NULL,
    CONSTRAINT "ProfessorAvaliacao_avaliacaoProfessor_fkey" FOREIGN KEY ("avaliacaoProfessor") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ProfessorAvaliacao_matriculaProfessor_fkey" FOREIGN KEY ("matriculaProfessor") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ProfessorAvaliacao" ("avaliacaoProfessor", "matriculaProfessor") SELECT "avaliacaoProfessor", "matriculaProfessor" FROM "ProfessorAvaliacao";
DROP TABLE "ProfessorAvaliacao";
ALTER TABLE "new_ProfessorAvaliacao" RENAME TO "ProfessorAvaliacao";
CREATE TABLE "new_AlunoAvaliacao" (
    "idAlunoAvaliacao" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "matriculaAluno" INTEGER NOT NULL,
    "avaliacaoAluno" INTEGER NOT NULL,
    CONSTRAINT "AlunoAvaliacao_matriculaAluno_fkey" FOREIGN KEY ("matriculaAluno") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AlunoAvaliacao_avaliacaoAluno_fkey" FOREIGN KEY ("avaliacaoAluno") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AlunoAvaliacao" ("avaliacaoAluno", "matriculaAluno") SELECT "avaliacaoAluno", "matriculaAluno" FROM "AlunoAvaliacao";
DROP TABLE "AlunoAvaliacao";
ALTER TABLE "new_AlunoAvaliacao" RENAME TO "AlunoAvaliacao";
CREATE TABLE "new_Aluno" (
    "idAluno" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL
);
INSERT INTO "new_Aluno" ("email", "matricula", "nome") SELECT "email", "matricula", "nome" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_idAluno_key" ON "Aluno"("idAluno");
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");
CREATE TABLE "new_Professor" (
    "idProfessor" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL
);
INSERT INTO "new_Professor" ("email", "matricula", "nome") SELECT "email", "matricula", "nome" FROM "Professor";
DROP TABLE "Professor";
ALTER TABLE "new_Professor" RENAME TO "Professor";
CREATE UNIQUE INDEX "Professor_idProfessor_key" ON "Professor"("idProfessor");
CREATE UNIQUE INDEX "Professor_matricula_key" ON "Professor"("matricula");
CREATE UNIQUE INDEX "Professor_email_key" ON "Professor"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
