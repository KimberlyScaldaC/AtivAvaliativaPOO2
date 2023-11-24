/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `lider` on the `Estande` table. All the data in the column will be lost.
  - Added the required column `liderId` to the `Estande` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Post";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Estande" (
    "idEstande" TEXT NOT NULL PRIMARY KEY,
    "liderId" TEXT NOT NULL,
    "numeroEstande" INTEGER NOT NULL,
    "nomeGrupo" TEXT NOT NULL,
    "dataApresentacao" DATETIME NOT NULL,
    "horaApresentacao" DATETIME NOT NULL,
    "notaGrupoProfessores" REAL NOT NULL,
    "notaGrupoAlunos" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Estande_liderId_fkey" FOREIGN KEY ("liderId") REFERENCES "Grupo" ("idGrupo") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Estande" ("created_at", "dataApresentacao", "horaApresentacao", "idEstande", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande", "updated_at") SELECT "created_at", "dataApresentacao", "horaApresentacao", "idEstande", "nomeGrupo", "notaGrupoAlunos", "notaGrupoProfessores", "numeroEstande", "updated_at" FROM "Estande";
DROP TABLE "Estande";
ALTER TABLE "new_Estande" RENAME TO "Estande";
CREATE UNIQUE INDEX "Estande_liderId_key" ON "Estande"("liderId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
