-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Grupo" (
    "idGrupo" TEXT NOT NULL PRIMARY KEY,
    "nomeGrupo" TEXT NOT NULL,
    "matricula" TEXT NOT NULL,
    "liderId" TEXT NOT NULL,
    "estandeId" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Grupo_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Aluno" ("idAluno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Grupo_estandeId_fkey" FOREIGN KEY ("estandeId") REFERENCES "Estande" ("idEstande") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Grupo" ("created_at", "estandeId", "idGrupo", "liderId", "matricula", "nomeGrupo", "updated_at") SELECT "created_at", "estandeId", "idGrupo", "liderId", "matricula", "nomeGrupo", "updated_at" FROM "Grupo";
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE UNIQUE INDEX "Grupo_liderId_key" ON "Grupo"("liderId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
