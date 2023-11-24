/*
  Warnings:

  - You are about to drop the column `alunoId` on the `Grupo` table. All the data in the column will be lost.
  - You are about to drop the column `integrantes` on the `Estande` table. All the data in the column will be lost.
  - You are about to drop the column `matriculaLider` on the `Estande` table. All the data in the column will be lost.
  - Added the required column `estandeId` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `liderId` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `grupoId` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lider` to the `Estande` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Professor" (
    "idProfessor" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Professor" ("email", "idProfessor", "matricula", "nome") SELECT "email", "idProfessor", "matricula", "nome" FROM "Professor";
DROP TABLE "Professor";
ALTER TABLE "new_Professor" RENAME TO "Professor";
CREATE UNIQUE INDEX "Professor_matricula_key" ON "Professor"("matricula");
CREATE UNIQUE INDEX "Professor_email_key" ON "Professor"("email");
CREATE TABLE "new_Grupo" (
    "idGrupo" TEXT NOT NULL PRIMARY KEY,
    "liderId" TEXT NOT NULL,
    "estandeId" TEXT NOT NULL,
    CONSTRAINT "Grupo_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Aluno" ("idAluno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Grupo_estandeId_fkey" FOREIGN KEY ("estandeId") REFERENCES "Estande" ("idEstande") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Grupo" ("idGrupo") SELECT "idGrupo" FROM "Grupo";
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE UNIQUE INDEX "Grupo_liderId_key" ON "Grupo"("liderId");
CREATE TABLE "new_Aluno" (
    "idAluno" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Aluno_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo" ("idGrupo") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Aluno" ("email", "idAluno", "matricula", "nome") SELECT "email", "idAluno", "matricula", "nome" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");
CREATE TABLE "new_Avaliacao" (
    "idAvaliacao" TEXT NOT NULL PRIMARY KEY,
    "notaAluno" INTEGER NOT NULL,
    "notaProfessor" INTEGER NOT NULL,
    "estandeId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Avaliacao_estandeId_fkey" FOREIGN KEY ("estandeId") REFERENCES "Estande" ("idEstande") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Avaliacao" ("estandeId", "idAvaliacao", "notaAluno", "notaProfessor") SELECT "estandeId", "idAvaliacao", "notaAluno", "notaProfessor" FROM "Avaliacao";
DROP TABLE "Avaliacao";
ALTER TABLE "new_Avaliacao" RENAME TO "Avaliacao";
CREATE TABLE "new_Estande" (
    "idEstande" TEXT NOT NULL PRIMARY KEY,
    "lider" TEXT NOT NULL,
    "numeroEstande" INTEGER NOT NULL,
    "nomeGrupo" TEXT NOT NULL,
    "dataApresentacao" DATETIME NOT NULL,
    "horaApresentacao" DATETIME NOT NULL,
    "notaGrupoProfessores" REAL NOT NULL,
    "notaGrupoAlunos" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Estande" ("dataApresentacao", "horaApresentacao", "idEstande", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande") SELECT "dataApresentacao", "horaApresentacao", "idEstande", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande" FROM "Estande";
DROP TABLE "Estande";
ALTER TABLE "new_Estande" RENAME TO "Estande";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
