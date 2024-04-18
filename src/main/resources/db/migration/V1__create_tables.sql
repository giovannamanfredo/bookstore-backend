CREATE TABLE address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    country VARCHAR(255),
    number VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postal_code VARCHAR(255)
);
CREATE TABLE payment_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    card_number VARCHAR(255),
    card_expiration_date VARCHAR(255),
    card_security_code VARCHAR(255),
    cardholder_name VARCHAR(255),
    bank_account_number VARCHAR(255),
    bank_name VARCHAR(255),
    bank_branch VARCHAR(255)
);

CREATE TABLE users (
    uuid CHAR(36) PRIMARY KEY,
    cpf VARCHAR(255),
    username VARCHAR(255),
    phone VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    date_birth DATE,
    created_at TIMESTAMP,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(id),
    payment_detail_id INT,
    FOREIGN KEY (payment_detail_id) REFERENCES payment_details(id)
);

CREATE TABLE bookstore (
    uuid CHAR(36) PRIMARY KEY,
    cnpj VARCHAR(255),
    fantasy_name VARCHAR(255),
    website VARCHAR(255),
    description TEXT,
    opening_date DATE,
    phone VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    created_at TIMESTAMP,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(id)
);
CREATE TABLE languages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE book_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(255),
    author VARCHAR(255),
    description TEXT,
    pages INT,
    price_in_cents INT,
    languages_id INT,
    FOREIGN KEY (languages_id) REFERENCES languages(id),
    dimensions VARCHAR(255),
    publishing_company VARCHAR(255),
    publication_date DATE,
    book_type_id INT,
    FOREIGN KEY (book_type_id) REFERENCES book_types(id),
    seller_id CHAR(36),
    FOREIGN KEY (seller_id) REFERENCES bookstore(uuid),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    photo TEXT
);
CREATE TABLE favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(36),
    book_id INT,
    FOREIGN KEY (user_id) REFERENCES users(uuid),
    FOREIGN KEY (book_id) REFERENCES books(id)
);



CREATE TABLE sales (
    uuid CHAR(36) PRIMARY KEY,
    seller_id CHAR(36),
    FOREIGN KEY (seller_id) REFERENCES bookstore(uuid),
    sale_datetime DATE,
    cupom VARCHAR(255),
    total_price_in_cents INT,
    status VARCHAR(255),
    form_of_payment VARCHAR(255),
    user_id CHAR(36),
    FOREIGN KEY (user_id) REFERENCES users(uuid)
);

CREATE TABLE shopping_carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id CHAR(36),
    book_id INT,
    FOREIGN KEY (sale_id) REFERENCES sales(uuid),
    FOREIGN KEY (book_id) REFERENCES books(id)
);


