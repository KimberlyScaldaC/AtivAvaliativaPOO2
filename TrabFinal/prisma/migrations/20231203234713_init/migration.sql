-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Professor" (
    "idProfessor" TEXT NOT NULL PRIMARY KEY,
    "matricula" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Professor" ("created_at", "email", "idProfessor", "matricula", "nome", "updated_at") SELECT "created_at", "email", "idProfessor", "matricula", "nome", "updated_at" FROM "Professor";
DROP TABLE "Professor";
ALTER TABLE "new_Professor" RENAME TO "Professor";
CREATE UNIQUE INDEX "Professor_matricula_key" ON "Professor"("matricula");
CREATE UNIQUE INDEX "Professor_email_key" ON "Professor"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
