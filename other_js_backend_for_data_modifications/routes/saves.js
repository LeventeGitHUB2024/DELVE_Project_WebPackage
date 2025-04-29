const express = require('express');
const router = express.Router();
const db = require('../db');

router.post('/',async (req,res) => {
    const{email, save_name, game_length, save_data} = req.body;

    const conn = await db.getConnection();

    try {
        await conn.beginTransaction();

        // 1. Új mentés a saves_sae-be
        await conn.execute(
            `INSERT INTO saves_sae (Full_start_date, PYR_id, save_name, save_time, game_length, save_data) VALUES (NOW(), ?, ?, NOW(), ?, ?)`,[email,save_name,game_length,save_data]
        );

        // 2. Frissítjük a játékos statjait a players_pyr-ben
        let updateQuery = 'UPDATE players_pyr SET playtime = playtime + ?';
        let updateParams = [game_length];

        /*if (won === true) {
            updateQuery += ', games_won = games_won + 1';
        } else if (won === false) {
            updateQuery += ', games_lost = games_lost + 1';
        }*/

        updateQuery += ' WHERE email = ?';
        updateParams.push(email);

        await conn.execute(updateQuery, updateParams);

        await conn.commit();
        res.status(201).json({ message: 'Mentés sikeres' });
        } catch (err) {
        await conn.rollback();
        res.status(500).json({ error: err.message });
        } finally {
        conn.release();
        }
    });

    router.get('/:email', async (req, res) => {
        try {
            const [rows] = await db.execute('SELECT * FROM saves_sae WHERE pyr_id = ?', [req.params.email]);
            res.json(rows);
        } catch (err) {
            res.status(500).json({ error: err.message });
        }
    });

    router.delete('/:email/:date', async (req, res) => {
        try {
            await db.execute(
                'DELETE FROM saves_sae WHERE pyr_id = ? AND Full_start_date = ?',
                [req.params.email, req.params.date]
            );
            res.sendStatus(204);
        } catch (err) {
            res.status(500).json({ error: err.message });
        }
    });

    router.put('/:email/:date', async (req, res) => {
        const { save_data, game_length } = req.body;
        try {
            await db.execute(
                `UPDATE saves_sae 
                 SET save_data = ?, game_length = ?, save_time = NOW()
                 WHERE pyr_id = ? AND Full_start_date = ?`,
                [save_data, game_length, req.params.email, req.params.date]
            );
            res.sendStatus(204);
        } catch (err) {
            res.status(500).json({ error: err.message });
        }
    });    

module.exports = router;