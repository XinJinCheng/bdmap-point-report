const express = require('express');
const router = express.Router();

const controller = require('../app/controller');
const service = require('../app/service');
const logger = service.getLogger('api.js');

router.post('/surveySubmit', function (req, res, next) {

  let apiService = new controller.ApiController(res);

  let surveySubmit = req.body;
  apiService.addSurveySubmit(surveySubmit);
  // res.sendStatus(200);
});

router.post('/surveySubmit/findByName', function (req, res, next) {

  let apiService = new controller.ApiController(res);
  
  let name = req.body.name
  apiService.querySurveySubmitsByName(name);
  // logger.debug(req.body);
  // res.send(JSON.stringify(surveySubmit));
});

router.post('/surveySubmit/findLatestN', function (req, res, next) {

  let apiService = new controller.ApiController(res);

  let count = req.body.count
  apiService.queryLatestSurveySubmits(count);
  // res.send(JSON.stringify(surveySubmit));
});

module.exports = router;