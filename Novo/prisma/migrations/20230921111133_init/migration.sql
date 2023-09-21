-- CreateTable
CREATE TABLE "Usuario" (
    "matricula" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "idade" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "AlunoAvaliacao" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "avaliacaoId1" INTEGER NOT NULL,
    "avaliacaoId2" INTEGER NOT NULL,
    "matriculaAluno" INTEGER NOT NULL,
    "avaliacaoAluno" INTEGER NOT NULL,
    CONSTRAINT "AlunoAvaliacao_avaliacaoId1_fkey" FOREIGN KEY ("avaliacaoId1") REFERENCES "Avaliacao" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AlunoAvaliacao_avaliacaoId2_fkey" FOREIGN KEY ("avaliacaoId2") REFERENCES "Avaliacao" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProfessorAvaliacao" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "avaliacaoId1" INTEGER NOT NULL,
    "avaliacaoId2" INTEGER NOT NULL,
    "matriculaProfessor" INTEGER NOT NULL,
    "avaliacaoProfessor" INTEGER NOT NULL,
    CONSTRAINT "ProfessorAvaliacao_avaliacaoId1_fkey" FOREIGN KEY ("avaliacaoId1") REFERENCES "Avaliacao" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ProfessorAvaliacao_avaliacaoId2_fkey" FOREIGN KEY ("avaliacaoId2") REFERENCES "Avaliacao" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Avaliacao" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "idEstande" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Estande" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "integrantes" INTEGER NOT NULL,
    "nomeGrupo" TEXT NOT NULL,
    "dataApresentacao" DATETIME NOT NULL,
    "horaApresentacao" DATETIME NOT NULL,
    "notaGrupoProfessores" REAL NOT NULL,
    "notaGrupoAlunos" REAL NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_matricula_key" ON "Usuario"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Avaliacao_id_key" ON "Avaliacao"("id");
