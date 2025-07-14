const cds = require('@sap/cds');
const express = require('express');
const path = require('path');

cds.on('bootstrap', (app) => {
  // Create a standalone router
  const router = express.Router();

  // Serve the static index.html file
  router.get('/index.html', (req, res) => {
    const filePath = path.join(__dirname,'..','app','index.html');
    res.sendFile(filePath);
  });
  router.get('/test', (req, res) => {
    const filePath = path.join(__dirname,'..','app','index.html');
    res.sendFile(filePath);
  });

   // Serve the static index.html file
   router.get('/appconfig/fioriSandboxConfig.json', (req, res) => {
    const filePath = path.join(__dirname, '..','app','appconfig','fioriSandboxConfig.json');
    res.sendFile(filePath);
  });
  app.use(express.static(path.join(__dirname,'..','app')));
  // Attach the router to the CAP app
  app.use('/appconfig', express.static(path.join(__dirname, '..','app','appconfig')));
});

// Start the CAP server
module.exports = cds.server;
