-- CreateTable
CREATE TABLE "VehicleMaker" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "VehicleMakerModel" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "MakerId" TEXT NOT NULL,
    "BodyTypeId" TEXT,
    "Name" TEXT NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL,
    CONSTRAINT "VehicleMakerModel_MakerId_fkey" FOREIGN KEY ("MakerId") REFERENCES "VehicleMaker" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "VehicleMakerModel_BodyTypeId_fkey" FOREIGN KEY ("BodyTypeId") REFERENCES "VehicleBodyType" ("Id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "VehicleMakerModelYear" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "ModelId" TEXT NOT NULL,
    "BodyTypeId" TEXT,
    "Name" TEXT NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL,
    CONSTRAINT "VehicleMakerModelYear_ModelId_fkey" FOREIGN KEY ("ModelId") REFERENCES "VehicleMakerModel" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "VehicleMakerModelYear_BodyTypeId_fkey" FOREIGN KEY ("BodyTypeId") REFERENCES "VehicleBodyType" ("Id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "VehicleMakerModelTrim" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "ModelYearId" TEXT NOT NULL,
    "BodyTypeId" TEXT,
    "Name" TEXT NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL,
    CONSTRAINT "VehicleMakerModelTrim_ModelYearId_fkey" FOREIGN KEY ("ModelYearId") REFERENCES "VehicleMakerModelYear" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "VehicleMakerModelTrim_BodyTypeId_fkey" FOREIGN KEY ("BodyTypeId") REFERENCES "VehicleBodyType" ("Id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "VehicleBodyType" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "User" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "UserSearch" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "UserId" TEXT NOT NULL,
    "MakerId" TEXT NOT NULL,
    "ModelId" TEXT,
    "YearId" TEXT,
    "TrimId" TEXT,
    CONSTRAINT "UserSearch_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "User" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserSearch_MakerId_fkey" FOREIGN KEY ("MakerId") REFERENCES "VehicleMaker" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserSearch_ModelId_fkey" FOREIGN KEY ("ModelId") REFERENCES "VehicleMakerModel" ("Id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "UserSearch_YearId_fkey" FOREIGN KEY ("YearId") REFERENCES "VehicleMakerModelYear" ("Id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "UserSearch_TrimId_fkey" FOREIGN KEY ("TrimId") REFERENCES "VehicleMakerModelTrim" ("Id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "UserReview" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "UserId" TEXT NOT NULL,
    "MakerId" TEXT NOT NULL,
    "ModelId" TEXT NOT NULL,
    "YearId" TEXT NOT NULL,
    "TrimId" TEXT,
    "Rating" INTEGER NOT NULL,
    "Kind" INTEGER NOT NULL,
    "Comment" TEXT NOT NULL,
    "IsMain" BOOLEAN NOT NULL DEFAULT false,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL,
    CONSTRAINT "UserReview_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "User" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserReview_MakerId_fkey" FOREIGN KEY ("MakerId") REFERENCES "VehicleMaker" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserReview_ModelId_fkey" FOREIGN KEY ("ModelId") REFERENCES "VehicleMakerModel" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserReview_YearId_fkey" FOREIGN KEY ("YearId") REFERENCES "VehicleMakerModelYear" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "UserReview_TrimId_fkey" FOREIGN KEY ("TrimId") REFERENCES "VehicleMakerModelTrim" ("Id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "VehicleArticle" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Title" TEXT NOT NULL,
    "Body" TEXT,
    "Data" JSONB NOT NULL,
    "Price" REAL NOT NULL,
    "Currenccy" INTEGER NOT NULL,
    "Url" TEXT NOT NULL,
    "PictureUrl" TEXT NOT NULL,
    "IsAccepted" BOOLEAN NOT NULL,
    "IsVerified" BOOLEAN NOT NULL,
    "IsAnalyzedSuccessfully" BOOLEAN NOT NULL,
    "UsageType" INTEGER NOT NULL,
    "Website" INTEGER NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_Email_key" ON "User"("Email");

-- CreateIndex
CREATE UNIQUE INDEX "VehicleArticle_Url_key" ON "VehicleArticle"("Url");

-- CreateIndex
CREATE INDEX "VehicleArticle_IsAccepted_idx" ON "VehicleArticle"("IsAccepted");

-- CreateIndex
CREATE INDEX "VehicleArticle_IsVerified_idx" ON "VehicleArticle"("IsVerified");
