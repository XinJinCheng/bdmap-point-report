const express = require('express');
const router = express.Router();

const service = require('../app/service');
const logger = service.getLogger('api.js');

router.post('/surveySubmit', function (req, res, next) {

  let surveySubmit = req.body;
  let responseService = new service.ResponseService(res);
  let apiService = new service.ApiService(responseService);

  apiService.addSurveySubmit(surveySubmit);
  // res.sendStatus(200);
});

router.get('/surveySubmit/findByName', function (req, res, next) {

  let apiService = new service.ApiService(sendResponse);
  let surveySubmit = apiService.querySurveySubmitsByName(req.query.name);
  // res.send(JSON.stringify(surveySubmit));
});

module.exports = router;