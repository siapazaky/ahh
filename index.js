require('dotenv').config({ path: './.env' })
require('./app')
const fetch = require('node-fetch')

function keepAlive() {
    const url = `https://ahh-production.up.railway.app`
if (/(\/\/|\.)undefined\./.test(url)) return
    setInterval(() => {
        fetch(url).catch(console.error)
    }, 15 * 1000)
    }

keepAlive();
