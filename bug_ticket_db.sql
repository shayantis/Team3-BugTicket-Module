-- =====================================
-- TEAM 3 BUG TICKET DATABASE SCHEMA
-- =====================================

CREATE TABLE ticket (
    ticket_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    severity VARCHAR(20),
    status VARCHAR(20) DEFAULT 'OPEN',
    created_by INTEGER,
    office_id INTEGER,
    system_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ticket_assignment (
    assignment_id SERIAL PRIMARY KEY,
    ticket_id INTEGER REFERENCES ticket(ticket_id),
    assigned_to INTEGER,
    assigned_by INTEGER,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'ASSIGNED'
);

CREATE TABLE ticket_status_history (
    history_id SERIAL PRIMARY KEY,
    ticket_id INTEGER REFERENCES ticket(ticket_id),
    old_status VARCHAR(20),
    new_status VARCHAR(20),
    changed_by INTEGER,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ticket_comment (
    comment_id SERIAL PRIMARY KEY,
    ticket_id INTEGER REFERENCES ticket(ticket_id),
    user_id INTEGER,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alert (
    alert_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    ticket_id INTEGER REFERENCES ticket(ticket_id),
    message TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ticket_attachment (
    attachment_id SERIAL PRIMARY KEY,
    ticket_id INTEGER REFERENCES ticket(ticket_id),
    file_name VARCHAR(255),
    file_path TEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);