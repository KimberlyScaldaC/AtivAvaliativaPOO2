/*
  Warnings:

  - You are about to drop the `Usuario` table. If the table is not empty, all the data it contains will be lost.
  - The primary key for the `Estande` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Estande` table. All the data in the column will be lost.
  - The primary key for the `ProfessorAvaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `ProfessorAvaliacao` table. All the data in the column will be lost.
  - The primary key for the `Avaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Avaliacao` table. All the data in the column will be lost.
  - The primary key for the `AlunoAvaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `AlunoAvaliacao` table. All the data in the column will be lost.
  - Added the required column `idEstande` to the `Estande` table without a default value. This is not possible if the table is not empty.
  - Added the required column `matriculaLider` to the `Estande` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numeroEstande` to the `Estande` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idProfessor` to the `ProfessorAvaliacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAvaliacao` to the `Avaliacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAluno` to the `AlunoAvaliacao` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Usuario_email_key";

-- DropIndex
DROP INDEX "Usuario_matricula_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Usuario";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Aluno" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Professor" (
    "matricula" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "idade" INTEGER NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Estande" (
    "idEstande" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "integrantes" INTEGER NOT NULL,
    "matriculaLider" INTEGER NOT NULL,
    "numeroEstande" INTEGER NOT NULL,
    "nomeGrupo" TEXT NOT NULL,
    "dataApresentacao" DATETIME NOT NULL,
    "horaApresentacao" DATETIME NOT NULL,
    "notaGrupoProfessores" REAL NOT NULL,
    "notaGrupoAlunos" REAL NOT NULL
);
INSERT INTO "new_Estande" ("dataApresentacao", "horaApresentacao", "integrantes", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores") SELECT "dataApresentacao", "horaApresentacao", "integrantes", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores" FROM "Estande";
DROP TABLE "Estande";
ALTER TABLE "new_Estande" RENAME TO "Estande";
CREATE UNIQUE INDEX "Estande_matriculaLider_key" ON "Estande"("matriculaLider");
CREATE TABLE "new_ProfessorAvaliacao" (
    "idProfessor" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "avaliacaoId1" INTEGER NOT NULL,
    "avaliacaoId2" INTEGER NOT NULL,
    "matriculaProfessor" INTEGER NOT NULL,
    "avaliacaoProfessor" INTEGER NOT NULL,
    CONSTRAINT "ProfessorAvaliacao_avaliacaoId1_fkey" FOREIGN KEY ("avaliacaoId1") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ProfessorAvaliacao_avaliacaoId2_fkey" FOREIGN KEY ("avaliacaoId2") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ProfessorAvaliacao" ("avaliacaoId1", "avaliacaoId2", "avaliacaoProfessor", "matriculaProfessor") SELECT "avaliacaoId1", "avaliacaoId2", "avaliacaoProfessor", "matriculaProfessor" FROM "ProfessorAvaliacao";
DROP TABLE "ProfessorAvaliacao";
ALTER TABLE "new_ProfessorAvaliacao" RENAME TO "ProfessorAvaliacao";
CREATE TABLE "new_Avaliacao" (
    "idAvaliacao" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "idEstande" INTEGER NOT NULL
);
INSERT INTO "new_Avaliacao" ("idEstande") SELECT "idEstande" FROM "Avaliacao";
DROP TABLE "Avaliacao";
ALTER TABLE "new_Avaliacao" RENAME TO "Avaliacao";
CREATE UNIQUE INDEX "Avaliacao_idAvaliacao_key" ON "Avaliacao"("idAvaliacao");
CREATE TABLE "new_AlunoAvaliacao" (
    "idAluno" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "avaliacaoId1" INTEGER NOT NULL,
    "avaliacaoId2" INTEGER NOT NULL,
    "matriculaAluno" INTEGER NOT NULL,
    "avaliacaoAluno" INTEGER NOT NULL,
    CONSTRAINT "AlunoAvaliacao_avaliacaoId1_fkey" FOREIGN KEY ("avaliacaoId1") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AlunoAvaliacao_avaliacaoId2_fkey" FOREIGN KEY ("avaliacaoId2") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AlunoAvaliacao" ("avaliacaoAluno", "avaliacaoId1", "avaliacaoId2", "matriculaAluno") SELECT "avaliacaoAluno", "avaliacaoId1", "avaliacaoId2", "matriculaAluno" FROM "AlunoAvaliacao";
DROP TABLE "AlunoAvaliacao";
ALTER TABLE "new_AlunoAvaliacao" RENAME TO "AlunoAvaliacao";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_id_key" ON "Aluno"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_matricula_key" ON "Professor"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_email_key" ON "Professor"("email");
