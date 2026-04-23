require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');
const session = require('express-session');
const bcrypt = require('bcryptjs');

const app = express();
const pool = new Pool({ connectionString: process.env.DATABASE_URL, ssl: true });

app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));
app.use(session({ secret: process.env.SESSION_SECRET || 'secret', resave: false, saveUninitialized: false }));

// Middleware to protect routes
const isAuth = (req, res, next) => req.session.userId ? next() : res.redirect('/login');

app.get('/', (req, res) => res.redirect('/login'));

app.get('/login', (req, res) => res.render('login', { error: null }));

app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    try {
        const result = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
        if (result.rows.length > 0) {
            const user = result.rows[0];
            const isMatch = await bcrypt.compare(password, user.password);
            if (isMatch) {
                req.session.userId = user.id;
                return res.redirect('/dashboard');
            }
        }
        res.render('login', { error: 'Invalid credentials' });
    } catch (err) {
        res.status(500).send('Database error');
    }
});

app.get('/dashboard', isAuth, async (req, res) => {
    try {
        const items = await pool.query('SELECT * FROM items');
        res.render('dashboard', { items: items.rows });
    } catch (err) {
        res.status(500).send('Database error');
    }
});

app.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/login');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
