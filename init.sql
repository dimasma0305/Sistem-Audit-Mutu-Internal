CREATE DATABASE IF NOT EXISTS dbdesa;

use dbdesa;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    password CHAR(60) NOT NULL,
    role ENUM("user", "admin") DEFAULT "user"
);

INSERT INTO users (username, email,password, role)
VALUES ("admin", "admin@admin.com","$2y$10$W2Nk5p1hL1jraYSPkESaN.01Rai//bWmgoQRluWRrys4DsoOD0JDC", "admin");

CREATE TABLE IF NOT EXISTS jenisSurat(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60)
);

INSERT INTO jenisSurat (name)
VALUES ('Surat Keterangan Domisili'),
    ('Surat Keterangan Usaha'),
    ('Surat Keterangan Kelahiran'),
    ('Surat Keterangan Kematian');

CREATE TABLE IF NOT EXISTS surat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner INT NOT NULL,
    filename VARCHAR(60) NOT NULL,
    jenisSuratId INT NOT NULL,
    title VARCHAR(60) NOT NULL,
    deskripsi TEXT NOT NULL,
    keperluan TEXT NOT NULL,
    status ENUM("pending", "diterima", "ditolak") NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner) REFERENCES users(id),
    FOREIGN KEY (jenisSuratId) REFERENCES jenisSurat(id)
);


CREATE TABLE IF NOT EXISTS artikel (
    id CHAR(24) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES users(id)
);
