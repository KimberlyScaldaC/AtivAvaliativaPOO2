/*
  Warnings:

  - You are about to drop the `AlunoAvaliacao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProfessorAvaliacao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `liderId` on the `Estande` table. All the data in the column will be lost.
  - You are about to drop the column `nomeGrupo` on the `Estande` table. All the data in the column will be lost.
  - You are about to drop the column `estandeId` on the `Avaliacao` table. All the data in the column will be lost.
  - Added the required column `matricula` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nomeGrupo` to the `Grupo` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AlunoAvaliacao";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ProfessorAvaliacao";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "AlunoOnAvaliacao" (
    "alunoId" TEXT NOT NULL,
    "avaliacaoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("alunoId", "avaliacaoId"),
    CONSTRAINT "AlunoOnAvaliacao_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "Aluno" ("idAluno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AlunoOnAvaliacao_avaliacaoId_fkey" FOREIGN KEY ("avaliacaoId") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProfessorOnAvaliacao" (
    "professorId" TEXT NOT NULL,
    "avaliacaoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("professorId", "avaliacaoId"),
    CONSTRAINT "ProfessorOnAvaliacao_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "Professor" ("idProfessor") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ProfessorOnAvaliacao_avaliacaoId_fkey" FOREIGN KEY ("avaliacaoId") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "AvaliacaoOnEstande" (
    "avaliacaoId" TEXT NOT NULL,
    "estandeId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("avaliacaoId", "estandeId"),
    CONSTRAINT "AvaliacaoOnEstande_avaliacaoId_fkey" FOREIGN KEY ("avaliacaoId") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AvaliacaoOnEstande_estandeId_fkey" FOREIGN KEY ("estandeId") REFERENCES "Estande" ("idEstande") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Estande" (
    "idEstande" TEXT NOT NULL PRIMARY KEY,
    "numeroEstande" INTEGER NOT NULL,
    "dataApresentacao" DATETIME NOT NULL,
    "horaApresentacao" DATETIME NOT NULL,
    "notaGrupoProfessores" REAL NOT NULL,
    "notaGrupoAlunos" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Estande" ("created_at", "dataApresentacao", "horaApresentacao", "idEstande", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande", "updated_at") SELECT "created_at", "dataApresentacao", "horaApresentacao", "idEstande", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande", "updated_at" FROM "Estande";
DROP TABLE "Estande";
ALTER TABLE "new_Estande" RENAME TO "Estande";
CREATE TABLE "new_Avaliacao" (
    "idAvaliacao" TEXT NOT NULL PRIMARY KEY,
    "notaAluno" INTEGER NOT NULL,
    "notaProfessor" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Avaliacao" ("created_at", "idAvaliacao", "notaAluno", "notaProfessor", "updated_at") SELECT "created_at", "idAvaliacao", "notaAluno", "notaProfessor", "updated_at" FROM "Avaliacao";
DROP TABLE "Avaliacao";
ALTER TABLE "new_Avaliacao" RENAME TO "Avaliacao";
CREATE TABLE "new_Grupo" (
    "idGrupo" TEXT NOT NULL PRIMARY KEY,
    "nomeGrupo" TEXT NOT NULL,
    "matricula" INTEGER NOT NULL,
    "liderId" TEXT NOT NULL,
    "estandeId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Grupo_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Aluno" ("idAluno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Grupo_estandeId_fkey" FOREIGN KEY ("estandeId") REFERENCES "Estande" ("idEstande") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Grupo" ("estandeId", "idGrupo", "liderId") SELECT "estandeId", "idGrupo", "liderId" FROM "Grupo";
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE UNIQUE INDEX "Grupo_liderId_key" ON "Grupo"("liderId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
