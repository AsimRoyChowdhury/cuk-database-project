-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('SUPER_ADMIN', 'ADMIN', 'HOD');

-- CreateEnum
CREATE TYPE "StudentLevel" AS ENUM ('PG', 'UG', 'PHD', 'ITEP');

-- CreateEnum
CREATE TYPE "ActionType" AS ENUM ('CREATE', 'UPDATE', 'DELETE', 'USER_LOGIN', 'USER_LOGOUT', 'USER_CREATED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "hashedPassword" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,
    "department_id" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AnnualDepartmentStats" (
    "id" TEXT NOT NULL,
    "department_id" TEXT NOT NULL,
    "academic_year_id" TEXT NOT NULL,
    "studentLevel" "StudentLevel" NOT NULL,
    "male_total" INTEGER NOT NULL DEFAULT 0,
    "male_general" INTEGER NOT NULL DEFAULT 0,
    "male_sc" INTEGER NOT NULL DEFAULT 0,
    "male_st" INTEGER NOT NULL DEFAULT 0,
    "male_obc" INTEGER NOT NULL DEFAULT 0,
    "male_ews" INTEGER NOT NULL DEFAULT 0,
    "male_ph" INTEGER NOT NULL DEFAULT 0,
    "male_foreign" INTEGER NOT NULL DEFAULT 0,
    "male_ex_defence" INTEGER NOT NULL DEFAULT 0,
    "female_total" INTEGER NOT NULL DEFAULT 0,
    "female_general" INTEGER NOT NULL DEFAULT 0,
    "female_sc" INTEGER NOT NULL DEFAULT 0,
    "female_st" INTEGER NOT NULL DEFAULT 0,
    "female_obc" INTEGER NOT NULL DEFAULT 0,
    "female_ews" INTEGER NOT NULL DEFAULT 0,
    "female_ph" INTEGER NOT NULL DEFAULT 0,
    "female_foreign" INTEGER NOT NULL DEFAULT 0,
    "female_ex_defence" INTEGER NOT NULL DEFAULT 0,
    "actual_cat_general" INTEGER NOT NULL DEFAULT 0,
    "actual_cat_sc" INTEGER NOT NULL DEFAULT 0,
    "actual_cat_st" INTEGER NOT NULL DEFAULT 0,
    "actual_cat_obc" INTEGER NOT NULL DEFAULT 0,
    "actual_cat_ews" INTEGER NOT NULL DEFAULT 0,
    "admitted_cuet" INTEGER NOT NULL DEFAULT 0,
    "admitted_spot" INTEGER NOT NULL DEFAULT 0,
    "minority_muslim" INTEGER NOT NULL DEFAULT 0,
    "minority_christian" INTEGER NOT NULL DEFAULT 0,
    "dropouts" INTEGER NOT NULL DEFAULT 0,
    "scholarships" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AnnualDepartmentStats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AcademicYear" (
    "id" TEXT NOT NULL,
    "year" TEXT NOT NULL,

    CONSTRAINT "AcademicYear_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ActivityLog" (
    "id" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actionType" "ActionType" NOT NULL,
    "tableName" TEXT NOT NULL,
    "recordId" TEXT NOT NULL,
    "changeDetails" JSONB,
    "userId" TEXT NOT NULL,

    CONSTRAINT "ActivityLog_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "AnnualDepartmentStats_department_id_academic_year_id_studen_key" ON "AnnualDepartmentStats"("department_id", "academic_year_id", "studentLevel");

-- CreateIndex
CREATE UNIQUE INDEX "Department_name_key" ON "Department"("name");

-- CreateIndex
CREATE UNIQUE INDEX "AcademicYear_year_key" ON "AcademicYear"("year");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnnualDepartmentStats" ADD CONSTRAINT "AnnualDepartmentStats_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "Department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnnualDepartmentStats" ADD CONSTRAINT "AnnualDepartmentStats_academic_year_id_fkey" FOREIGN KEY ("academic_year_id") REFERENCES "AcademicYear"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityLog" ADD CONSTRAINT "ActivityLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
