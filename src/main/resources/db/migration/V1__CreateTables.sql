-- src/main/resources/db/migration/V1__CreateTables.sql

CREATE TABLE boards (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE columns (
    id SERIAL PRIMARY KEY,
    board_id INT REFERENCES boards(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL CHECK (type IN ('INICIAL', 'CANCELAMENTO', 'FINAL', 'PENDENTE')),
    order_position INT NOT NULL
);

CREATE TABLE cards (
    id SERIAL PRIMARY KEY,
    column_id INT REFERENCES columns(id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_blocked BOOLEAN DEFAULT FALSE,
    block_reason TEXT
);

CREATE TABLE card_movements (
    id SERIAL PRIMARY KEY,
    card_id INT REFERENCES cards(id) ON DELETE CASCADE,
    from_column_id INT REFERENCES columns(id),
    to_column_id INT REFERENCES columns(id),
    moved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);