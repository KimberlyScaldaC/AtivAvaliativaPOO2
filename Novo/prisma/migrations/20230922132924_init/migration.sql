/*
  Warnings:

  - You are about to drop the `Alunoss` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Grupo` table. If the table is not empty, all the data it contains will be lost.
  - The primary key for the `Avaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `AlunoAvaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Estande` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `AvaliacaoParaEstande` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `AvaliacaoParaEstande` table. All the data in the column will be lost.
  - The primary key for the `ProfessorAvaliacao` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `idAvaliacaoParaEstande` was added to the `AvaliacaoParaEstande` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropIndex
DROP INDEX "Aluno_idAluno_key";

-- DropIndex
DROP INDEX "Professor_idProfessor_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Alunoss";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Grupo";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Avaliacao" (
    "idAvaliacao" TEXT NOT NULL PRIMARY KEY,
    "idEstande" INTEGER NOT NULL
);
INSERT INTO "new_Avaliacao" ("idAvaliacao", "idEstande") SELECT "idAvaliacao", "idEstande" FROM "Avaliacao";
DROP TABLE "Avaliacao";
ALTER TABLE "new_Avaliacao" RENAME TO "Avaliacao";
CREATE TABLE "new_AlunoAvaliacao" (
    "idAlunoAvaliacao" TEXT NOT NULL PRIMARY KEY,
    "avaliacaoAluno" INTEGER NOT NULL,
    "matriculaAluno" INTEGER NOT NULL
);
INSERT INTO "new_AlunoAvaliacao" ("avaliacaoAluno", "idAlunoAvaliacao", "matriculaAluno") SELECT "avaliacaoAluno", "idAlunoAvaliacao", "matriculaAluno" FROM "AlunoAvaliacao";
DROP TABLE "AlunoAvaliacao";
ALTER TABLE "new_AlunoAvaliacao" RENAME TO "AlunoAvaliacao";
CREATE TABLE "new_Estande" (
    "idEstande" TEXT NOT NULL PRIMARY KEY,
    "integrantes" INTEGER NOT NULL,
    "matriculaLider" INTEGER NOT NULL,
    "numeroEstande" INTEGER NOT NULL,
    "nomeGrupo" TEXT NOT NULL,
    "dataApresentacao" DATETIME NOT NULL,
    "horaApresentacao" DATETIME NOT NULL,
    "notaGrupoProfessores" REAL NOT NULL,
    "notaGrupoAlunos" REAL NOT NULL
);
INSERT INTO "new_Estande" ("dataApresentacao", "horaApresentacao", "idEstande", "integrantes", "matriculaLider", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande") SELECT "dataApresentacao", "horaApresentacao", "idEstande", "integrantes", "matriculaLider", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande" FROM "Estande";
DROP TABLE "Estande";
ALTER TABLE "new_Estande" RENAME TO "Estande";
CREATE UNIQUE INDEX "Estande_matriculaLider_key" ON "Estande"("matriculaLider");
CREATE TABLE "new_AvaliacaoParaEstande" (
    "idAvaliacaoParaEstande" TEXT NOT NULL PRIMARY KEY
);
DROP TABLE "AvaliacaoParaEstande";
ALTER TABLE "new_AvaliacaoParaEstande" RENAME TO "AvaliacaoParaEstande";
CREATE TABLE "new_ProfessorAvaliacao" (
    "idProfessorAvaliacao" TEXT NOT NULL PRIMARY KEY,
    "avaliacaoProfessor" INTEGER NOT NULL,
    "matriculaProfessor" INTEGER NOT NULL
);
INSERT INTO "new_ProfessorAvaliacao" ("avaliacaoProfessor", "idProfessorAvaliacao", "matriculaProfessor") SELECT "avaliacaoProfessor", "idProfessorAvaliacao", "matriculaProfessor" FROM "ProfessorAvaliacao";
DROP TABLE "ProfessorAvaliacao";
ALTER TABLE "new_ProfessorAvaliacao" RENAME TO "ProfessorAvaliacao";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
