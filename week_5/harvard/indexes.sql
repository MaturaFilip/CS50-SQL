CREATE INDEX "students_id" 
ON "students" ("id");


CREATE INDEX "enrollments_course_id_student_id" 
ON "enrollments" ("course_id", "student_id");


CREATE INDEX "courses_index" 
ON "courses" ("department", "semester", "title");


CREATE INDEX "requirements_id" 
ON "requirements" ("id");


CREATE INDEX "satisfies_course_id" 
ON "satisfies" ("course_id");