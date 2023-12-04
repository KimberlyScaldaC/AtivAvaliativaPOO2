-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Aluno" (
    "idAluno" TEXT NOT NULL PRIMARY KEY,
    "matricula" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Aluno_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo" ("idGrupo") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Aluno" ("created_at", "email", "grupoId", "idAluno", "matricula", "nome", "updated_at") SELECT "created_at", "email", "grupoId", "idAluno", "matricula", "nome", "updated_at" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
