-- CreateTable
CREATE TABLE "Aluno" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Professor" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "AlunoAvaliacao" (
    "idAluno" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "avaliacaoId1" INTEGER NOT NULL,
    "avaliacaoId2" INTEGER NOT NULL,
    "matriculaAluno" INTEGER NOT NULL,
    "avaliacaoAluno" INTEGER NOT NULL,
    CONSTRAINT "AlunoAvaliacao_avaliacaoId1_fkey" FOREIGN KEY ("avaliacaoId1") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AlunoAvaliacao_avaliacaoId2_fkey" FOREIGN KEY ("avaliacaoId2") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProfessorAvaliacao" (
    "idProfessor" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "avaliacaoId1" INTEGER NOT NULL,
    "avaliacaoId2" INTEGER NOT NULL,
    "matriculaProfessor" INTEGER NOT NULL,
    "avaliacaoProfessor" INTEGER NOT NULL,
    CONSTRAINT "ProfessorAvaliacao_avaliacaoId1_fkey" FOREIGN KEY ("avaliacaoId1") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ProfessorAvaliacao_avaliacaoId2_fkey" FOREIGN KEY ("avaliacaoId2") REFERENCES "Avaliacao" ("idAvaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Avaliacao" (
    "idAvaliacao" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "idEstande" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Estande" (
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

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_id_key" ON "Aluno"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_id_key" ON "Professor"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_matricula_key" ON "Professor"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_email_key" ON "Professor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Avaliacao_idAvaliacao_key" ON "Avaliacao"("idAvaliacao");

-- CreateIndex
CREATE UNIQUE INDEX "Estande_matriculaLider_key" ON "Estande"("matriculaLider");
