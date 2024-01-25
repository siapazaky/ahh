require('dotenv').config({ path: './.env' })
require('./app')
const fetch = require('node-fetch')

function keepAlive() {
    const url = `https://11da6bab-4316-498e-b7fa-16cd9446c720-00-j2ax3nqyeoc2.pike.replit.dev`
if (/(\/\/|\.)undefined\./.test(url)) return
    setInterval(() => {
        fetch(url).catch(console.error)
    }, 15 * 1000)
    }

keepAlive();
