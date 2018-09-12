const express = require('express');
const router = express.Router();

const service = require('../app/service');
const logger = service.getLogger('api.js');

router.post('/surveySubmit', function (req, res, next) {

  let responseService = new service.ResponseService(res);
  let apiService = new service.ApiService(responseService);

  let surveySubmit = req.body;
  apiService.addSurveySubmit(surveySubmit);
  // res.sendStatus(200);
});

router.post('/surveySubmit/findByName', function (req, res, next) {

  let responseService = new service.ResponseService(res);
  let apiService = new service.ApiService(responseService);
  
  let name = req.body.name
  apiService.querySurveySubmitsByName(name);
  // logger.debug(req.body);
  // res.send(JSON.stringify(surveySubmit));
});

router.post('/surveySubmit/findLatestN', function (req, res, next) {

  let responseService = new service.ResponseService(res);
  let apiService = new service.ApiService(responseService);

  let count = req.body.count
  apiService.queryLatestSurveySubmits(count);
  // res.send(JSON.stringify(surveySubmit));
});

module.exports = router;