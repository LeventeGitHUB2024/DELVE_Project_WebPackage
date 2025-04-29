const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcrypt');

router.post('/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const [rows] = await db.execute('SELECT password FROM players_pyr WHERE email = ?', [email]);
        if (rows.length === 0) return res.status(401).json({ error: 'Wrong/mistyped email or password' });

        const match = await bcrypt.compare(password, rows[0].password);
        if (!match) return res.status(401).json({ error: 'Wrong/mistyped email or password' });

        res.status(200).json({ message: 'Successful login' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;