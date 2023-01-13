Create Database play;
USE play;

CREATE TABLE artists (
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(255),
  media_type VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE albums (
  album_id INT PRIMARY KEY,
  album_name VARCHAR(255),
  artist_id INT,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE tracks (
  track_id INT PRIMARY KEY,
  track_name VARCHAR(255),
  album_id INT,
  mediatype_id INT,
  genre_id INT,
  composer NVARCHAR(220),
  milliseconds INT,
  bytes INT,
  unitprice NUMERIC,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE playlists (
  playlist_id INT PRIMARY KEY,
  playlist_name NVARCHAR(255)
);

CREATE TABLE playlist_track (
  playlist_id INT,
  track_id INT,
  PRIMARY KEY (playlist_id, track_id),
  FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
  FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_firstname NVARCHAR(40),
  customer_lastname NVARCHAR(20),
  company NVARCHAR(80),
  address1 NVARCHAR(70),
  state1 NVARCHAR(40),
  city NVARCHAR(40),
  postal_code NVARCHAR(10),
  phone NVARCHAR(24),
  fax NVARCHAR(24),
  email NVARCHAR(60),
  supportrep_id INT,
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_firstname NVARCHAR(20),
  employee_lastname NVARCHAR(20),
  title NVARCHAR(30),
  reportsto INT,
  birthdate datetime,
  hiredate datetime,
  address2 NVARCHAR(70),
);

CREATE TABLE invoices (
  invoice_id INT PRIMARY KEY,
  customer_id INT,
  employee_id INT,
  invoicedate datetime,
  billingaddress NVARCHAR(40),
  billingcity NVARCHAR(80),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE invoice_items (
  invoice_id INT,
  track_id INT,
  unitprice numeric,
  quantity INT
  PRIMARY KEY (invoice_id, track_id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
  FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

SELECT * FROM artists;
SELECT * FROM albums;