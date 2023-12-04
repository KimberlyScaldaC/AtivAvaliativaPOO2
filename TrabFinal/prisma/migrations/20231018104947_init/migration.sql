/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Post";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Aluno" (
    "idAluno" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Aluno_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo" ("idGrupo") ON DELETE RESTRICT ON UPDATE CASCADE
);

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
CREATE TABLE "Professor" (
    "idProfessor" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
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
CREATE TABLE "Avaliacao" (
    "idAvaliacao" TEXT NOT NULL PRIMARY KEY,
    "notaAluno" INTEGER NOT NULL,
    "notaProfessor" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
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

-- CreateTable
CREATE TABLE "Grupo" (
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

-- CreateTable
CREATE TABLE "Estande" (
    "idEstande" TEXT NOT NULL PRIMARY KEY,
    "numeroEstande" INTEGER NOT NULL,
    "dataApresentacao" DATETIME NOT NULL,
    "horaApresentacao" DATETIME NOT NULL,
    "notaGrupoProfessores" REAL NOT NULL,
    "notaGrupoAlunos" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_matricula_key" ON "Professor"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_email_key" ON "Professor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Grupo_liderId_key" ON "Grupo"("liderId");
