CREATE DATABASE exercises2_4;
USE exercises2_4;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(11),
    point INT,
    permission BIT,
    status BIT
);
CREATE TABLE exams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status BIT
);
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    exam_id INT NOT NULL,
    status BIT,
    FOREIGN KEY (exam_id) REFERENCES exams(id)
);
CREATE TABLE answer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    question_id INT NOT NULL,
    answerTrue BIT,
    FOREIGN KEY (question_id) REFERENCES questions(id)
);
CREATE TABLE history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    point INT,
    examDate DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE history_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    history_id INT NOT NULL,
    question_id INT NOT NULL,
    result BIT,
    FOREIGN KEY (history_id) REFERENCES history(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

