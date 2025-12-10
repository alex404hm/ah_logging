DROP TABLE IF EXISTS player_logs;
CREATE TABLE IF NOT EXISTS player_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    steam VARCHAR(20),
    discord VARCHAR(20),
    xbl VARCHAR(20),
    live VARCHAR(20),
    license VARCHAR(50),
    license2 VARCHAR(50),
    fivem VARCHAR(10),
    ip VARCHAR(45) NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
