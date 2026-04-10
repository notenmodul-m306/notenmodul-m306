-- Notenmodul Datenbankschema

CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       username VARCHAR(100) NOT NULL UNIQUE,
                       password_hash TEXT NOT NULL,
                       role VARCHAR(20) NOT NULL CHECK (role IN ('TEACHER', 'STUDENT'))
);

CREATE TABLE grades (
                        id SERIAL PRIMARY KEY,
                        student_id INT NOT NULL REFERENCES users(id),
                        teacher_id INT NOT NULL REFERENCES users(id),
                        subject VARCHAR(100) NOT NULL,
                        value DECIMAL(3,1) NOT NULL CHECK (value >= 1.0 AND value <= 6.0),
                        comment TEXT,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE questions (
                           id SERIAL PRIMARY KEY,
                           student_id INT NOT NULL REFERENCES users(id),
                           grade_id INT NOT NULL REFERENCES grades(id),
                           message TEXT NOT NULL,
                           answer TEXT,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);