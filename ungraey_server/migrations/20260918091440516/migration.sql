BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "bounty" (
    "id" bigserial PRIMARY KEY,
    "creatorId" bigint NOT NULL,
    "creatorName" text NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "quantityNeeded" bigint NOT NULL,
    "quantityFulfilled" bigint NOT NULL DEFAULT 0,
    "rewardAmountCents" bigint NOT NULL,
    "rewardType" text NOT NULL,
    "tradeItemDescription" text,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL,
    "addressSnippet" text NOT NULL,
    "radiusMiles" double precision NOT NULL DEFAULT 5.0,
    "status" text NOT NULL DEFAULT 'active'::text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "eco_impact" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "totalKgDiverted" double precision NOT NULL DEFAULT 0.0,
    "totalCo2eSavedKg" double precision NOT NULL DEFAULT 0.0,
    "treesSavedEquivalent" double precision NOT NULL DEFAULT 0.0,
    "waterSavedLiters" double precision NOT NULL DEFAULT 0.0,
    "pointsBalance" bigint NOT NULL DEFAULT 0,
    "completedHandoffsCount" bigint NOT NULL DEFAULT 0,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "handoff_transaction" (
    "id" bigserial PRIMARY KEY,
    "snapId" bigint NOT NULL,
    "bountyId" bigint NOT NULL,
    "sellerId" bigint NOT NULL,
    "buyerId" bigint NOT NULL,
    "qrToken" text NOT NULL,
    "rewardAmountCents" bigint NOT NULL,
    "rewardType" text NOT NULL,
    "kgDiverted" double precision NOT NULL,
    "co2eSavedKg" double precision NOT NULL,
    "status" text NOT NULL DEFAULT 'pending'::text,
    "completedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "snap" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "imageUrl" text NOT NULL,
    "detectedCategories" json NOT NULL,
    "detectedLabels" json NOT NULL,
    "estimatedWeightKg" double precision NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL,
    "status" text NOT NULL DEFAULT 'available'::text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);


--
-- MIGRATION VERSION FOR ungraey
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ungraey', '20260918091440516', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260918091440516', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260910193913364-string-rate-limit-keys', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260910193913364-string-rate-limit-keys', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260824182354731', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182354731', "timestamp" = now();


COMMIT;
